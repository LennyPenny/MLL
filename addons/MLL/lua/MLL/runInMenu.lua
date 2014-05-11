local function runInMenu(ply, cmd, args, str)
	CompileString(str, "MLL - ConCommand: "..cmd, true)()
end
concommand.Add("MLL_runMenu", runInMenu)

print("\trunInMenu loaded")