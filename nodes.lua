-- decoblock.nodes.lua

local S = decoblock.S
local intensity = 96
local lib = decoblock.lib

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
			use_texture_alpha="clip",
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
				aspect_w = 32,
				aspect_h = 32,
				length = 1.5
			},
		},

	},
})


intensity = 55
minetest.register_node("decoblock:dice", {
	description = S("Dice"),
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = false,
	is_ground_content = false,
	tiles = {
		"default_wood.png^[colorize:#FFFFFF:" .. intensity .. "^[overlay:" .. "decoblock_dice_1.png",
		"default_wood.png^[colorize:#FFFFFF:" .. intensity .. "^[overlay:" .. "decoblock_dice_6.png",
		"default_wood.png^[colorize:#FFFFFF:" .. intensity .. "^[overlay:" .. "decoblock_dice_4.png",
		"default_wood.png^[colorize:#FFFFFF:" .. intensity .. "^[overlay:" .. "decoblock_dice_3.png",
		"default_wood.png^[colorize:#FFFFFF:" .. intensity .. "^[overlay:" .. "decoblock_dice_5.png",
		"default_wood.png^[colorize:#FFFFFF:" .. intensity .. "^[overlay:" .. "decoblock_dice_2.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	on_punch = function(pos, node, puncher, pointed_thing)
						if (not puncher) then return end
					    local item_stack = puncher:get_wielded_item()
					    local item_name = item_stack:get_name()
					    local player = puncher:get_player_name()

					    if(not item_name) then
					        lib.announce(player, lib.roll_dice())

					    elseif (string.match(item_name, "pick") or (string.match(item_name, "axe"))) then
						    minetest.node_dig(pos, node, puncher)

				        else
				            lib.announce(player, lib.roll_dice())

				        end

               end
})

minetest.register_node("decoblock:black_white_black", {
	description = S("Black white black"),
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	light_source = default.LIGHT_MAX-6,
	tiles = {"decoblock_black_white_black.png"},
	drawtype = "nodebox",
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("decoblock:cooking_pot", {
	description = S("Cooking Pot"),
	drawtype = "mesh",
	mesh = "decoblock_cooking_pot.obj",
	inventory_image = "decoblock_cooking_pot_inventory.png",
	wield_image = "decoblock_cooking_pot_inventory.png",
	tiles = {
				"decoblock_cooking_pot.png",
			},
	--inventory_image = "cucina_vegana_coffee_cup_inv.png",
	--wield_image = "cucina_vegana_coffee_cup_inv.png",
	paramtype = "light",
	is_ground_content = false,
	param2 = "4dir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, .03, 0.25}
	},
	groups = {dig_immediate = 3, attached_node = 1, food_vegan = 1, eatable = 1},
})
