-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "rock_candy")

function item:init()
    super:init(self)

     -- Display name
    self.name = "Rock Candy"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n20HP"
    -- Shop description
    self.shop = nil
    -- Menu description
    self.description = "Heals 20 HP. It's just a rock."

    -- Amount healed (HealItem variable)
    self.heal_amounts = {
        alexa = 20,
        susie = 50,
        ralsei = 0,
        noelle = 5,
        jevil = 20
    }

    -- Shop buy price
    self.buy_price = 40
    -- Shop sell price (usually half of buy price)
    self.sell_price = 20

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
        alexa = "Ow! My teeth...",
        susie = "Tastes great!",
        ralsei = "... No thank you.",
        noelle = "O-OW! I think I chipped a tooth...",
        jevil = "Very crunchy."
    }
end

return item