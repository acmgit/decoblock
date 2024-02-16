--[[

   *****************************************
   **            decoblock                **
   **                                     **
   **          (?) by a.c.m.              **
   **                                     **
   **             GPL 3.0                 **
   *****************************************

]]

decoblock = {}

decoblock.modname = minetest.get_current_modname()
decoblock.modpath = minetest.get_modpath(decoblock.modname)
decoblock.version = 1
decoblock.revision = 0
decoblock.S = minetest.get_translator(minetest.get_current_modname())

local S = decoblock.S

decoblock.colors = {
                     {"white", "#FFFFFF", S("white")},
                     {"yellow", "#FFFF00", S("yellow")},
                     {"green", "#00FF00", S("green")},
                     {"blue", "#0000FF", S("blue")},
                     {"magenta", "#FF00FF", S("magenta")},
                     {"cyan", "#00FFFF", S("cyan")},
                     {"brown", "#6D2400", S("brown")},
                     {"black", "#000000", S("black")},

                  }

dofile(decoblock.modpath .. "/nodes.lua")
dofile(decoblock.modpath .. "/recipes.lua")
dofile(decoblock.modpath .. "/register_mods.lua")

minetest.log("action", "MOD [" .. decoblock.modname .. "] Version " .. decoblock.version .. "." .. decoblock.revision .. " loaded.")
