-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "melted_cheese")

function item:init()
    super.init(self)

     -- Display name
    self.name = "MeltCheese"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n50HP"
    -- Shop description
    self.shop = "Corn."
    -- Menu description
    self.description = "Caleb's new invention, the melted cheese sandwich! Heals 50 HP."

    -- Amount healed (HealItem variable)
    self.heal_amount = 50

    -- Shop buy price
    self.buy_price = 40
    -- Shop sell price (usually half of buy price)
    self.sell_price = 1

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
        alexa = "Mmm, still hot!",
        susie = {
            susie = "Uh, it's called 'grilled cheese'.",
            alexa = "No it isn't?"
        },
        ralsei = "The cheese is so gooey!",
        noelle = "U-um, are you SURE this is a new invention?",
        jevil = "Nice and toasted!"
    }
end

-- Function overrides go here

return item