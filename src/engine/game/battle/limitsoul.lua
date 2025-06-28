local Limit, super = Class(Soul)

function Limit:init(x, y, color)
    super:init(self, x, y, color)

    self.graze_tp_factor = -0.4
end

function Limit:onDamage(amount, bullet)
	super:onDamage(self, bullet, amount)
	Game:giveTension(5)
	Game:setFlag("nohit", false)
end

return Limit