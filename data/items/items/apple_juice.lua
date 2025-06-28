-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "apple_juice")

function item:init()
    super:init(self)

     -- Display name
    self.name = "AppleJuice"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n40HP"
    -- Shop description
    self.shop = nil
    -- Menu description
    self.description = "Heals 40 HP. A juice box full of apple juice."

    -- Amount healed (HealItem variable)
    self.heal_amounts = {
        alexa = 40,
        susie = 40,
        ralsei = 40,
        noelle = 40,
        jevil = 0
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
        alexa = "My mom packed it for me, so might as well.",
        susie = "Man, these things take me way back!",
        ralsei = "Ooo, it tastes really sweet!",
        noelle = "I used to drink these when I was little.",
        jevil = "Hell no, I'm not a kid!"
    }
end

return item