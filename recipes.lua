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

end

minetest.register_craft({
  output = "decoblock:bowling_pin 2",
  recipe = {
             {"default:steel_ingot","dye:white",""},
             {"group:wood","dye:red",""},
             {"group:wood","default:obsidian_shard",""},
           }
   })
