local spell, super = Class(Spell, "helping_heal")

function spell:init()
    super:init(self)

    -- Display name
    self.name = "Helping Heal"

    -- Battle description
    self.effect = "Heal\nEnemies"
    -- Menu description
    self.description = "I feel like if I help enemies, I might be able to get past some of them!"

    -- TP cost (set to 0 for this mod)
    self.cost = 0

    -- Target mode (party, enemy, or none/nil)
    self.target = nil

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
    return "* I take care for the enemies."
end

function spell:isUsable(chara)
	if Game.battle.help_cd > 0 then
		return false
	end
	return true
end

function spell:onCast(user, target)
	for k,v in pairs(Game.battle:getActiveEnemies()) do
		v:heal(v.max_health / 4)
	end
	Game.battle.help_cd = 4
end

return spell