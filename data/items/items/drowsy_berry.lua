-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(HealItem, "drowsy_berry")

function item:init()
    super.init(self)

     -- Display name
    self.name = "DrowsyBerry"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n30HP\nSleep 2"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "Heals 30 HP and induces sleep. Looking at this berry makes you feel tired."

    -- Amount healed (HealItem variable)
    self.heal_amount = 30

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
        alexa = "One sheep... Two sheep... Three...",
        susie = "*yawn*... need to... stay... awake...",
        ralsei = "I feel like I'm going to pass out...",
        noelle = "I feel... so drowzy...",
        jevil = "I'm all tired out..."
    }
end

-- Function overrides go here

function item:onBattleUse(user, target)
	super:onBattleUse(self, user, target)
	user.chara.sleep = true
	user.chara.sleep_timer = 3
	user.hit_count = user.hit_count + 1
	user:statusMessage("msg", "sleep")
end

return item