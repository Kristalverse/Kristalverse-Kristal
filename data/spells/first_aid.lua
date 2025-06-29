local spell, super = Class(Spell, "first_aid")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "First Aid"

    -- Battle description
    self.effect = "Small\nHeal"
    -- Menu description
    self.description = "Maybe with first aid, I can make myself last just a little longer."

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
		return "* I healed " .. target.chara.name .. " with first aid."
	end
	if user.chara.health < 16 then
		return "* I healed myself with first aid.[wait:5]\n* Just in time,[wait:5] too."
	else
		return "* I healed myself with first aid."
	end
end

function spell:isUsable(chara)
	if Game.battle.aid_cd > 0 then
		return false
	end
	return true
end

function spell:onCast(user, target)
	local _, equip_count = user:checkArmor("aid_guide")
	target:heal(25 + (10 * equip_count))
	if ((user.chara:getArmor(1) and user.chara:getArmor(1).id == "aid_kit") or (user.chara:getArmor(2) and user.chara:getArmor(2).id == "aid_kit")) then
		Game.battle.aid_cd = 2
	else
		Game.battle.aid_cd = 3
	end
end

return spell