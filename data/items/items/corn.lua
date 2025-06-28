-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "corn")

function item:init()
    super:init(self)

     -- Display name
    self.name = "Corn"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Corn."
    -- Shop description
    self.shop = "Corn."
    -- Menu description
    self.description = "Corn."

    -- Amount healed (HealItem variable)
    self.heal_amount = 30

    -- Shop buy price
    self.buy_price = 40
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
        alexa = "Thank you, Corn Shop.",
        susie = "Could use some butter.",
        ralsei = "Um, it's just corn?",
        noelle = "I think I got some stuck in my teeth...",
        jevil = "Ehh, needs salt."
    }
end

-- Function overrides go here

return item