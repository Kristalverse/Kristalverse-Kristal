-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "wonder_candy")

function item:init()
    super:init(self)

     -- Display name
    self.name = "WonderCandy"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals 50HP\nCures\nPARALYZE"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "Some candy made of pure magic!\nHeals 50 HP and cures PARALYZE."

    -- Amount healed (HealItem variable)
    self.heal_amount = 50

    -- Shop buy price
    self.buy_price = 75
    -- Shop sell price (usually half of buy price)
    self.sell_price = 37

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
        alexa = "Tastes magical!",
        susie = "I feel so invigorated!",
        ralsei = "Delicious!",
        noelle = "Wow, this is so sweet!",
        jevil = "Uee hee! This tastes so good!"
    }
end

-- Function overrides go here

function item:onBattleUse(user, target)
	super:onBattleUse(self, user, target)
	user.chara.shock = false
	user.chara.shock_timer = 0
end

return item