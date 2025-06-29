-- Create an item and specify its ID (id is optional, defaults to file path)
local item, super = Class(Item, "poisonous_potato")

function item:init()
    super.init(self)

     -- Display name
    self.name = "P. POTATO"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Deal\n2 DMG\nto self"
    -- Shop description
    self.shop = nil
    -- Menu description
    self.description = "Ugh, this thing really smells!\nWhat did that guy sell me!?"

    -- Shop buy price
    self.buy_price = 40
    -- Shop sell price (usually half of buy price)
    self.sell_price = nil
	self.can_sell = false

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
        alexa = "Ugh, gross!",
        susie = "Eugh, it's so bitter!",
        ralsei = "I feel so queasy now...",
        noelle = "(I think I'm gonna be sick...)",
        jevil = "Why the hell did I eat that?!"
    }
end

-- Function overrides go here
function item:onBattleUse(user, target)
	user:hurt(2, true)
end

function item:onWorldUse(character)
	
end

function item:onToss()
	Game.world:startCutscene(function(cutscene)
        cutscene:text("* Dropping this thing would be like littering.")
        cutscene:text("* I guess I have no choice but to eat it.")
    end)
	return false
end

return item