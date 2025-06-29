-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "soda")

function item:init()
    super.init(self)

     -- Display name
    self.name = "Soda"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n2HP"
    -- Shop description
    self.shop = nil
    -- Menu description
    self.description = "Heals 2 HP. Cherry-flavored soda, my favorite!"

    -- Amount healed (HealItem variable)
    self.heal_amount = 2

    -- Shop buy price
    self.buy_price = 25
    -- Shop sell price (usually half of buy price)
    self.sell_price = 12

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
        alexa = "*burp* Excuse me.",
        susie = "Man, now my teeth kinda hurt...",
        ralsei = "Tastes really fizzy!",
        noelle = "This tastes really good!",
        jevil = "Eh, not really a fan."
    }
end

-- Function overrides go here

return item