local spell, super = Class(Spell, "fear_heal")

function spell:init()
    super:init(self)

    -- Display name
    self.name = "Fear Heal"

    -- Battle description
    self.effect = "Heal\nBased on\nLimit"
    -- Menu description
    self.description = "I can use my fear to my advantage to heal myself."

    -- TP cost (set to 0 for this mod)
    self.cost = 0

    -- Target mode (party, enemy, or none/nil)
    self.target = "ally"

    -- Tags that apply to this spell
    self.tags = {"heal"}
end

function spell:onStart(user, target)
	Game.battle:battleText(self:getCastMessage(user, target))
    user:setAnimation("battle/aid", function()
        local result = self:onCast(user, target)
        if result or result == nil then
            Game.battle:finishActionBy(user)
        end
    end)
end

function spell:getCastMessage(user, target)
	if target ~= user then
		return "* I heal " .. target.chara.name .. " with my fear."
	end
    return "* I heal myself with my fear."
end

function spell:isUsable(chara)
	if Game.battle.fheal_cd > 0 then
		return false
	end
	return true
end

function spell:onCast(user, target)
	target:heal(math.floor((Game.tension / Game.max_tension) * (target.chara:getStat("health") * 7 / 10)))
	Game.battle.fheal_cd = 4
end

return spell