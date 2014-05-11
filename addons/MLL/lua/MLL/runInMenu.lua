local pw = math.random(999999999)

local tries = 0
local function wrongPw()
	if tries == 3 then
		print("Suspecting bruteforce, removing MLL_runOnMenu")
		concommand.Remove("MLL_runMenu")
		return
	end

	tries = tries + 1
	print("Try "..tries.." out of 3!")
end

local function runInMenu(ply, cmd, args, str)
	if !string.find(str, pw) then print("Wrong password!") wrongPw() return end
	tries = 0
	str = string.Replace(str, tostring(pw), "")

	CompileString(str, "MLL - ConCommand: "..cmd, true)()
end
concommand.Add("MLL_runMenu", runInMenu)
concommand.Add("MLL_runMenuPassword", function() print(pw) end)

print("\trunInMenu loaded")
print("\t\t Include the password in the command! Password: "..pw.." (We need this because otherwise servers could just run cmds on our menu state)")