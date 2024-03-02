-- decoblock.recipes.lua

for key,color in pairs(decoblock.colors) do
  minetest.register_craft({
          output = "decoblock:framed_glass_" .. color[1] .. " 4",
          recipe = {
                  {"dye:" .. color[1],"default:glass",""},
                  {"default:glass","default:torch","default:glass"},
                  {"","default:glass",""},
                }
        })
  minetest.register_craft({
          output = "decoblock:game_piece_" .. color[1],
          recipe = {
                     {"dye:" .. color[1],"decoblock:bowling_pin",""},
                   }
           })

end

minetest.register_craft({
  output = "decoblock:bowling_pin 2",
  recipe = {
             {"default:steel_ingot","dye:white",""},
             {"group:wood","dye:red",""},
             {"group:wood","default:obsidian_shard",""},
           }
   })

minetest.register_craft({
  output = "decoblock:smoke 5",
  recipe = {
             {"group:wood","group:wood","default:torch"},
           }
   })

minetest.register_craft({
  output = "decoblock:dice",
  recipe = {
             {"dye:white","group:wood","dye:red"},
           }
   })

minetest.register_craft({
  output = "decoblock:black_white_black",
  recipe = {
             {"group:stone","dye:black",""},
             {"default:mese_crystal_fragment","dye:white",""},
             {"","dye:black",""}
           }
   })
