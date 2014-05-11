
var lua =
{
	Run: function ( cmd )
	{
		if ( arguments.length == 1 )
		{
			console.log( "RUNLUA:" + cmd );
			return;
		}


		var str = "";
		var arg = 1;

		//
		// Build the string!
		//
		for ( var i = 0; i<cmd.length; i++ )
		{
			if ( cmd[i] == '%' )
			{
				i++;

				if ( cmd[i] == 's' )
				{
					str += "\"";
					str += arguments[arg].replace(/"/g, "\\\"");
					str += "\"";

					arg++;
					continue;
				}

				if ( cmd[i] == 'i' )
				{
					str += arguments[arg];
					arg++;
					continue;
				}
			}

			str += cmd[i];
		}

		console.log( "RUNLUA:" + str );
		
	},

	PlaySound: function( name )
	{
		lua.Run( "surface.PlaySound( %s )", String( name ) )
	}
}

lua.Run("print(%s)", String("Menu Lua Loader (MLL) by Lenny.(STEAM_0:0:30422103) loading...\\n"))
lua.Run("for k, v in pairs(file.Find(%s, %s)) do CompileString(file.Read(%s..v, %s), %s..v)() end", String("lua/MLL/*.lua"), String("GAME"), String("lua/MLL/"), String("GAME"), String("MLL - File: "))
lua.Run("print(%s)", String("\\n\\nMLL initialized!")) //TODO: find out what the fuck is up with escaping