-- decoblock.nodes.lua

local S = decoblock.S

minetest.register_node("decoblock:bowling_pin", {
	description = S("Bowling Pin"),
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = false,
	is_ground_content = false,
	groups = {snappy = 3, cracky = 3},
	tiles = {
		"decoblock_bowling_pin_top.png",
		"decoblock_bowling_pin_bottom.png",
		"decoblock_bowling_pin_front.png",
		"decoblock_bowling_pin_front.png",
		"decoblock_bowling_pin_front.png",
		"decoblock_bowling_pin_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.3125, -0.125, 0.25, 0, 0.3125}, -- NodeBox4
			{-0.125, 0, -0.0625, 0.1875, 0.125, 0.25}, -- NodeBox5
			{-0.125, 0.1875, -0.0625, 0.1875, 0.25, 0.25}, -- NodeBox8
			{-0.0625, 0.3125, 0, 0.125, 0.375, 0.1875}, -- NodeBox10
			{0, 0.375, 0.0625, 0.0625, 0.4375, 0.125}, -- NodeBox12
			{-0.125, 0.25, -0.0625, 0.1875, 0.3125, 0.25}, -- NodeBox13
			{-0.125, -0.375, -0.0625, 0.1875, -0.3125, 0.25}, -- NodeBox14
			{-0.0625, -0.5, 0, 0.125, -0.375, 0.1875}, -- NodeBox15
			{-0.0625, 0.125, 0, 0.125, 0.1875, 0.1875}, -- NodeBox16
		}
	}
})

for key,color in pairs(decoblock.colors) do

    local intensity = 96
	minetest.register_node("decoblock:framed_glass_" .. color[1], {
		description = S("Framed glass @1", color[3]),
		drawtype = "glasslike_framed_optional",
		tiles = {"decoblock_framed_glass.png^[colorize:" .. color[2] .. ":" .. intensity},
		paramtype = "light",
		light_source = 3,
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3},
		sounds = default.node_sound_glass_defaults()
	})

	if(not (color[1] == "white")) then
		minetest.register_node("decoblock:game_piece_" .. color[1], {
			description = S("Game Piece @1", color[3]),
			paramtype = "light",
			paramtype2 = "facedir",
			sunlight_propagates = false,
			is_ground_content = false,
			groups = {snappy = 3, cracky = 3},
			tiles = {
				"decoblock_bowling_pin_top.png^[colorize:" .. color[2] .. ":" .. intensity+32,
				"decoblock_bowling_pin_bottom.png^[colorize:" .. color[2] .. ":" .. intensity+32,
				"decoblock_bowling_pin_front.png^[colorize:" .. color[2] .. ":" .. intensity+32,
				"decoblock_bowling_pin_front.png^[colorize:" .. color[2] .. ":" .. intensity+32,
				"decoblock_bowling_pin_front.png^[colorize:" .. color[2] .. ":" .. intensity+32,
				"decoblock_bowling_pin_front.png^[colorize:" .. color[2] .. ":" .. intensity+32
			},
			drawtype = "nodebox",
			paramtype = "light",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.1875, -0.3125, -0.125, 0.25, 0, 0.3125}, -- NodeBox4
					{-0.125, 0, -0.0625, 0.1875, 0.125, 0.25}, -- NodeBox5
					{-0.125, 0.1875, -0.0625, 0.1875, 0.25, 0.25}, -- NodeBox8
					{-0.0625, 0.3125, 0, 0.125, 0.375, 0.1875}, -- NodeBox10
					{0, 0.375, 0.0625, 0.0625, 0.4375, 0.125}, -- NodeBox12
					{-0.125, 0.25, -0.0625, 0.1875, 0.3125, 0.25}, -- NodeBox13
					{-0.125, -0.375, -0.0625, 0.1875, -0.3125, 0.25}, -- NodeBox14
					{-0.0625, -0.5, 0, 0.125, -0.375, 0.1875}, -- NodeBox15
					{-0.0625, 0.125, 0, 0.125, 0.1875, 0.1875}, -- NodeBox16
				}
			}
		})
	end

end

minetest.register_node("decoblock:smoke", {
	description = S("Smoke"),
	inventory_image = "decoblock_smoke.png",
	drawtype = "plantlike",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	tiles = {
		{
			image = "decoblock_smoke.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		},

	},
})
