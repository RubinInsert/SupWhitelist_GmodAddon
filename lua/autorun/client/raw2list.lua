contents = {}
raw = file.Read("sup/rp/props_whitelist.dat", "DATA")

function createPropList(propList)
	for _, model in ipairs(propList) do
		table.insert( contents, {
			type = "model",
			model = model
		} )
	end
	spawnmenu.AddPropCategory("SUPAddon", "SUP Whitelist", contents, "icon16/box.png")
end


if raw == nil then
	http.Fetch( "https://gmod-api.superiorservers.co/api/darkrp/whitelist",
		function( body, length, headers, code )
			createPropList(util.JSONToTable(body))
		end,
		function( message )
			print( message )
		end,
		{ 
			["accept-encoding"] = "gzip, deflate",
			["accept-language"] = "fr" 
		}
	)

else 

	raw = raw:gsub("'", "")
	raw = raw:gsub("}", "")
	raw = raw:gsub("{", "")
	raw = raw:gsub("~", "")
	raw = raw:gsub(" ", "")
	raw = raw:sub(1, -2)
	parsed = string.Split(raw, ";")
	createPropList(parsed)
end
