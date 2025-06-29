local TensionBar, super = Utils.hookScript(TensionBar)

function TensionBar:init(x, y, dont_animate)
    super.init(self, x, y, dont_animate)
	
	if Game.party[1].id == "alexa" then
		self.tp_bar_fill = Assets.getTexture("ui/battle/party_b/tp_bar_fill")
        self.tp_bar_outline = Assets.getTexture("ui/battle/party_b/tp_bar_outline")
		self.tp_text = Assets.getTexture("ui/battle/party_b/tp_text")
	end
end

function TensionBar:drawMaxText()
	if Game.party[1].id == "alexa" then
		Draw.setColor({1,0,0})

		love.graphics.print("M", -28, 70)
		love.graphics.print("A", -24, 90)
		love.graphics.print("X", -20, 110)
	else
		super.drawMaxText(self)
	end
end

function TensionBar:drawBack()
	if Game.party[1].id == "alexa" then
		Draw.setColor({0.3,0.3,0.3})
		Draw.pushScissor()
		Draw.scissorPoints(0, 0, 25, 196 - (self:getPercentageFor250(self.current) * 196) + 1)
		Draw.draw(self.tp_bar_fill, 0, 0)
		Draw.popScissor()
	else
		super.drawBack(self)
	end
end

function TensionBar:drawFill()
	if Game.party[1].id == "alexa" then
		if (self.apparent < self.current) then
			Draw.setColor(PALETTE["tension_decrease"])
			Draw.pushScissor()
			Draw.scissorPoints(0, 196 - (self:getPercentageFor250(self.current) * 196) + 1, 25, 196)
			Draw.draw(self.tp_bar_fill, 0, 0)
			Draw.popScissor()

			Draw.setColor({0.6,0,0})
			Draw.pushScissor()
			Draw.scissorPoints(0, 196 - (self:getPercentageFor250(self.apparent) * 196) + 1 + (self:getPercentageFor(self.tension_preview) * 196), 25, 196)
			Draw.draw(self.tp_bar_fill, 0, 0)
			Draw.popScissor()
		elseif (self.apparent > self.current) then
			Draw.setColor(1, 1, 1, 1)
			Draw.pushScissor()
			Draw.scissorPoints(0, 196 - (self:getPercentageFor250(self.apparent) * 196) + 1, 25, 196)
			Draw.draw(self.tp_bar_fill, 0, 0)
			Draw.popScissor()

			Draw.setColor({0.6,0,0})
			if (self.maxed) then
				Draw.setColor({1,0,0})
			end
			Draw.pushScissor()
			Draw.scissorPoints(0, 196 - (self:getPercentageFor250(self.current) * 196) + 1 + (self:getPercentageFor(self.tension_preview) * 196), 25, 196)
			Draw.draw(self.tp_bar_fill, 0, 0)
			Draw.popScissor()
		elseif (self.apparent == self.current) then
			Draw.setColor({0.6,0,0})
			if (self.maxed) then
				Draw.setColor({1,0,0})
			end
			Draw.pushScissor()
			Draw.scissorPoints(0, 196 - (self:getPercentageFor250(self.current) * 196) + 1 + (self:getPercentageFor(self.tension_preview) * 196), 25, 196)
			Draw.draw(self.tp_bar_fill, 0, 0)
			Draw.popScissor()
		end
	else
		super.drawFill(self)
	end
end

return TensionBar