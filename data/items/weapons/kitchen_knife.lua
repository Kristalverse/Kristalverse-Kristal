local item, super = Class(Item, "kitchen_knife")

function item:init()
    super:init(self)

    self.name = "KitchenKnife"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/axe"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "Make sure\nto charge it"
    -- Menu description
    self.description = "The kitchen knife I keep at all times.\nSharp as ever. Causes some decent cuts."

    -- Shop buy price
    self.buy_price = 0
    -- Shop sell price (usually half of buy price)
    self.sell_price = nil

    -- Consumable target mode (party, enemy, noselect, or none/nil)
    self.target = nil
    -- Where this item can be used (world, battle, all, or none/nil)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 0
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        alexa = true
    }

    -- Character reactions
    self.reactions = {
        susie = "Oops... I bent it.",
        ralsei = "I'll just stick to the cauldron.",
        noelle = "(I can't cook???)"
    }
end

return item
