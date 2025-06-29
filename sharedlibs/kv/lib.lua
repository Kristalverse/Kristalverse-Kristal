local lib = {}

Registry.registerGlobal("KV", lib)
KV = lib

function lib:getActionButtons(battler, buttons)
    if Game.party[1].id == "alexa" then
        Utils.removeFromTable(buttons, "fight")
    end
    return buttons
end

return lib