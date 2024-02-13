-- decoblock.nodes.lua

local S = decoblock.S

for key,color in pairs(decoblock.colors) do

	print(dump(color))
	minetest.register_node("decoblock:framed_glass_" .. color[1], {
		description = S("Framed glass @1", color[3]),
		drawtype = "glasslike_framed_optional",
		tiles = {"decoblock_framed_glass.png^[colorize:" .. color[2] .. ":96"},
		paramtype = "light",
		light_source = 3,
		paramtype2 = "glasslikeliquidlevel",
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3},
		sounds = default.node_sound_glass_defaults()
	})

end
