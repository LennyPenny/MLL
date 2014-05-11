local function runFileOnClient(ply, cmd, args, str)
	if !IsInGame() then print("Must be InGame to run lua in the client state!") return end

	local filez = file.Read("lua/MLL/fenvSetter/fenvSetter.lua", "GAME") --important stuffs happening here
	local filezz = file.Read("lua/"..str, "GAME")
	RunOnClient(filez.." "..filezz)
end
concommand.Add("MLL_runClientFile", runFileOnClient)

print("\trunClientFile loaded")