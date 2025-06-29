local spell, super = Class(Spell, "cure")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Cure"

    -- Battle description
    self.effect = "Cure\nEffects"
    -- Menu description
    self.description = "I can use this to cure myself of status effects."

    -- TP cost
    self.cost = 0

    -- Target mode (party, enemy, or none/nil)
    self.target = "ally"

    -- Tags that apply to this spell
    self.tags = {"heal"}
end

function spell:onStart(user, target)
	Game.battle:battleText(self:getCastMessage(user, target))
    user:setAnimation("battle/cure", function()
        local result = self:onCast(user, target)
        if result or result == nil then
            Game.battle:finishActionBy(user)
        end
    end)
end

function spell:getCastMessage(user, target)
	if target ~= user then
		return "* I cure " .. target.chara.name .. " of any ailment."
	end
    return "* I cure myself of any ailment."
end

function spell:isUsable(chara)
	if Game.battle.cure_cd > 0 then
		return false
	end
	return true
end

function spell:onCast(user, target)
    target.chara.poison = false
    target.chara.sleep = false
    target.chara.sleep_timer = 0
    target.chara.shock = false
    target.chara.shock_timer = 0
	Assets.playSound("power")
	local mask = ColorMaskFX({87/255, 0/255, 127/255}, 1)
	target:addFX(mask)
	Game.battle.timer:tween(1, mask, {amount = 0}, "linear", function()
		target:removeFX(mask)
	end)
	
	target:sparkle(unpack({87/255, 0/255, 127/255}))
	Game.battle.cure_cd = 4
end

return spell