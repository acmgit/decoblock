-- Registering for various Mods

local db = decoblock

if (minetest.get_modpath("moreblocks")) then
    for _, name in pairs(db.colors) do
        local nodename = db.modname .. ":framed_glass_" .. name[1]
        local ndef = table.copy(minetest.registered_nodes[nodename])
        ndef.sunlight_propagates = true

        -- Stone and desert_stone drop cobble and desert_cobble respectively.
        if type(ndef.drop) == "string" then
            ndef.drop = ndef.drop:gsub(".+:", "")

        end

        -- Use the primary tile for all sides of cut glasslike nodes and disregard paramtype2.
        if #ndef.tiles > 1 and ndef.drawtype and ndef.drawtype:find("glass") then
            ndef.tiles = {ndef.tiles[1]}
            ndef.paramtype_2 = "wallmounted"

        end

        local mod = "moreblocks"
        local des = "framed_glass_" .. name[1]
        stairsplus:register_all(mod, des, nodename, ndef)
        minetest.register_alias_force("stairs:stair_" .. des, mod .. ":stair_" .. "framed_glass_" .. des)
        minetest.register_alias_force("stairs:stair_outer_" .. des, mod .. ":stair_" .. des .. "_outer")
        minetest.register_alias_force("stairs:stair_inner_" .. des, mod .. ":stair_" .. des .. "_inner")
        minetest.register_alias_force("stairs:slab_"  .. des, mod .. ":slab_"  .. des)

    end

end
