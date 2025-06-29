-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "drowsy_pie")

function item:init()
    super.init(self)

     -- Display name
    self.name = "DrowsyPie"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n100HP\nSleep 3"
    -- Shop description
    self.shop = nil
    -- Menu description
    self.description = "Heals 100 HP and induces sleep. The smell of this pie makes me tired."

    -- Amount healed (HealItem variable)
    self.heal_amount = 100

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
        alexa = "*yawn*... Can I sleep yet...?",
        susie = "Man I... *yawn*... need to take a nap...",
        ralsei = "Goodness, that pie tasted... so good...",
        noelle = "Gosh I'm... so sleepy...",
        jevil = "One duckie... Two duckies..."
    }
end

-- Function overrides go here

function item:onBattleUse(user, target)
	super:onBattleUse(self, user, target)
	user.chara.sleep = true
	user.chara.sleep_timer = 4
end

return item