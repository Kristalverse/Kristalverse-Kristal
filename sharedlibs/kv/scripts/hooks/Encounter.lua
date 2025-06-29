---@class Encounter
---@overload fun(...) : Encounter
local Encounter = Utils.hookScript(Encounter)

function Encounter:createSoul(x, y, color)
    local player = Game.party[1]
    if player.id == "knight" then
        return NailSoul(x, y, color)
	elseif player.id == "alexa" then
		return LimitSoul(x, y, color)
    else
        return Soul(x, y, color)
    end
end

return Encounter