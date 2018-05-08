-- A weak key-value store that maps objects to names.
-- This will break for some userdata (Roblox Instances come to mind), but I'm
-- not going to worry about that, since those types have a Name field!
local names = {}
setmetatable(names, {
	__mode = "k"
})

local Cognomen = {}

--[[
	Names an object.
	`object` may be any value except nil.
	`name` must be a string.

	If called with one argument, this function acts as an alias of getName.
]]
function Cognomen.name(...)
	-- Use varargs to detect nil vs. no value
	-- This is important, otherwise:
	-- name(1, nil) is interpreted as "get the name of 1", not
	-- "set the name of 1 to nil".
	local count = select("#", ...)

	-- count == 2 means we're naming something
	if count == 2 then
		local object, name = ...
		assert(type(object) ~= "nil", "object (1) must not be nil")
		assert(type(name) == "string", "name (2) must be a string")

		names[object] = name
	-- count == 1 means we're getting the name of something
	elseif count == 1 then
		return Cognomen.getName(...)
	-- Anything else is an error
	else
		error(("invalid number of arguments (expected 1 or 2, got %d)"):format(count), 2)
	end
end

--[[
	Clears the name of an object in Cognomen's dictionary.
	After calling this function you will be able to set the object's name to
	something else.
]]
function Cognomen.unname(object)
	assert(type(object) ~= "nil", "object (1) must not be nil")
	names[object] = nil
end

--[[
	Gets the name of an object, or nil if the object is unnamed.
]]
function Cognomen.getName(object)
	assert(type(object) ~= "nil", "object (1) must not be nil")
	return names[object]
end

return Cognomen