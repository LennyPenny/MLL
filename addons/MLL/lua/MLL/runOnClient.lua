local function runOnClient(ply, cmd, args, str)
	if !IsInGame() then print("Must be InGame to run lua in the client state!") end
	
	RunOnClient(str) --sry no error handling b/c compilestring is being a bitch
end
concommand.Add("MLL_runOnClient", runOnClient)

print("\trunOnClient loaded")