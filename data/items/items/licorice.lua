-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "licorice")

function item:init()
    super.init(self)

     -- Display name
    self.name = "Licorice"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n20HP"
    -- Shop description
    self.shop = nil
    -- Menu description
    self.description = "Heals 20 HP. A red line of licorice."

    -- Amount healed (HealItem variable)
    self.heal_amounts = {
        alexa = 20,
        susie = 0,
        ralsei = 20,
        noelle = 0,
        jevil = 20
    }

    -- Shop buy price
    self.buy_price = 20
    -- Shop sell price (usually half of buy price)
    self.sell_price = 10

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
        alexa = "I always love licorice.",
        susie = "Nope.",
        ralsei = "Ooo, it tastes like cherries!",
        noelle = "U-um, I'll pass, faha...",
        jevil = "Never understood why some people hate this."
    }
end

-- Function overrides go here

return item