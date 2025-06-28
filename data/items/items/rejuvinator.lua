-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(Item, "rejuvinator")

function item:init()
    super:init(self)

     -- Display name
    self.name = "Rejuvinator"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Auto\nCalm"
    -- Shop description
    self.shop = "Corn."
    -- Menu description
    self.description = "I can't use it, but when I go insane, it will calm me down."

    -- Amount healed (HealItem variable)
    self.heal_amount = 30

    -- Shop buy price
    self.buy_price = 40
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
	
	self.usable_in = "none"
end

-- Function overrides go here

return item