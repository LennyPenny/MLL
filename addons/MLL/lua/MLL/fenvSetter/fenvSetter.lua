local newFenv = {}
setmetatable(newFenv, {__index = _G})

setfenv(1, newFenv)

function include(filey) --we can't use include normally since the file we'll try to load aren't addcsluafiled
	filey = file.Read(filey, "LUA") --so we change include just in the fenv of the files we're including
	RunString(filey) --that will keep maximum compatibility
end