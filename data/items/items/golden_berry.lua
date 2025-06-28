-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "golden_berry")

function item:init()
    super:init(self)

     -- Display name
    self.name = "GoldenBerry"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\nMax HP\nFull Calm"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "An extremely rare berry you can't buy anywhere."

    -- Amount healed (HealItem variable)
    self.heal_amount = 200

    -- Shop buy price
    self.buy_price = 500
    -- Shop sell price (usually half of buy price)
    self.sell_price = 150

    -- Consumable target mode (Should be party)
    self.target = "party"
    -- Where this item can be used (world, battle, all, or none/nil)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Character reactions (key = party member id)
    self.reactions = {
        alexa = "I feel like I wasted this...",
        susie = "Man, I feel so at ease right now.",
        ralsei = "The taste is so calming!",
        noelle = "Wow, that berry tasted really good.",
        jevil = "I feel like I can do anything now!"
    }
end

-- Function overrides go here

function item:onBattleUse(user, target)
	super:onBattleUse(self, user, target)
	Game:removeTension(999)
	Game.tension = 0
	user.poison = false
	user.shock = false
end

return item