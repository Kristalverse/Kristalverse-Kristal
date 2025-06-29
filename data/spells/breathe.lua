local spell, super = Class(Spell, "breathe")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Breathe"

    -- Battle description
    self.effect = "Deep\nBreath"
    -- Menu description
    self.description = "Taking a deep breath is important to stay sane and calm."

    -- TP cost (set to 0 for this mod)
    self.cost = 0

    -- Target mode (party, enemy, or none/nil)
    self.target = nil

    -- Tags that apply to this spell
    self.tags = {"calm"}
end

function spell:onStart(user, target)
	Game.battle:battleText(self:getCastMessage(user, target))
    user:setAnimation("battle/breathe", function()
        local result = self:onCast(user, target)
        if result or result == nil then
            Game.battle:finishActionBy(user)
        end
    end)
end

function spell:getCastMessage(user, target)
    return "* I take a deep breath.[wait:5].[wait:5].[wait:5]\n* I feel a bit more calm."
end

function spell:isUsable(chara)
	if Game.battle.breathe_cd > 0 then
		return false
	end
	return true
end

function spell:onCast(user, target)
	Game:removeTension(35)
	Game.battle.breathe_cd = 3
end

return spell