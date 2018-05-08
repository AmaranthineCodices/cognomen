return function()
	local Cognomen = require(script.Parent)

	describe("name", function()
		it("should set names", function()
			local testObject = newproxy(true)

			Cognomen.name(testObject, "test")
			expect(Cognomen.getName(testObject)).to.equal("test")
			-- Don't need to manually unname; Cognomen uses a weak store. The
			-- userdata will be garbage collected automatically.
		end)

		it("should throw if given nil as the first argument", function()
			expect(function()
				Cognomen.name(nil, "test")
			end).to.throw()
		end)

		it("should throw if given nil as the second argument", function()
			local testObject = newproxy(true)

			expect(function()
				Cognomen.name(testObject, nil)
			end).to.throw()
		end)

		it("should throw if given wrong numbers of arguments", function()
			expect(function()
				Cognomen.name()
			end).to.throw()

			expect(function()
				Cognomen.name(1, 2, 3)
			end).to.throw()
		end)

		it("should throw if the object is already named", function()
			local testObject = newproxy(true)

			Cognomen.name(testObject, "test")

			expect(function()
				Cognomen.name(testObject, "otherTest")
			end).to.throw()
		end)

		it("should get names", function()
			local testObject = newproxy(true)

			Cognomen.name(testObject, "test")
			expect(Cognomen.name(testObject)).to.equal("test")
		end)
	end)

	describe("unname", function()
		it("should remove names", function()
			local testObject = newproxy(true)

			Cognomen.name(testObject, "test")
			expect(Cognomen.getName(testObject)).to.equal("test")
			Cognomen.unname(testObject)
			expect(Cognomen.getName(testObject)).to.equal(nil)
		end)

		it("should error if given nil", function()
			expect(function()
				Cognomen.unname(nil)
			end).to.throw()
		end)
	end)

	describe("getName", function()
		it("should get names", function()
			local testObject = newproxy(true)

			Cognomen.name(testObject, "test")
			expect(Cognomen.getName(testObject)).to.equal("test")
		end)
	end)
end