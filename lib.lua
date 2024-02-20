local S = decoblock.S
decoblock.lib = {}
local sc = smart_chat
local lib = decoblock.lib
math.randomseed(os.time())

function decoblock.lib.roll_dice()
    minetest.sound_play("decoblock_dice", {
                                            loop = false,
                                           }
                       )
    return math.random(1, 6)

end

function decoblock.lib.announce(name, value)

    if(sc) then
       sc.me(name, sc.green .. " " .. S("rolled the dice.") .. " " .. sc.yellow .. value .. sc.green .. ".")

    else
        minetest.chat_send_all(name .. " " .. S("rolled the dice.") .. " " .. value .. ".")

    end

end
