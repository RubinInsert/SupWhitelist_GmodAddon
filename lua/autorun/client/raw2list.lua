contents = {}
raw = file.Read("sup/props_whitelist.dat", "DATA")
raw = raw:gsub("'", "")
raw = raw:gsub("}", "")
raw = raw:gsub("{", "")
raw = raw:gsub("~", "")
raw = raw:gsub(" ", "")
raw = raw:sub(1, -2)
parsed = string.Split(raw, ";")

for _, model in ipairs(parsed) do
    print("... ", model)
    table.insert( contents, {
		type = "model",
		model = model
	} )
end


spawnmenu.AddPropCategory("SUPAddon", "SUP Whitelist", contents, "icon16/box.png")