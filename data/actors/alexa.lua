local actor, super = Class(Actor, "alexa")

function actor:init()
    super:init(self)

    -- Display name (optional)
    self.name = "Alexa"

    -- Width and height for this actor, used to determine its center
    self.width = 17
    self.height = 34

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {0, 22, 17, 14}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {253/255, 190/255, 219/255}

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/alexa"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of sprite animations
    self.animations = {
        -- Movement animations
        ["slide"]               = {"slide", 4/30, true},
		
        ["surprised_right"]     = {"surprised_right", 4/30, true},
        ["surprised_left"]      = {"surprised_left", 4/30, true},

        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 0.15, true},
        ["battle/sleep"]        = {"battle/sleep", 0.3, true},
        ["battle/insane"]       = {"battle/insane", 0.15, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/act", 1/15, false},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/act", 1/15, false, next="battle/idle"},
		
        ["battle/cure"]         = {"battle/cure", 1/12, false, next="battle/idle"},
        ["battle/breathe"]      = {"battle/breathe", 1/10, false, next="battle/idle"},
        ["battle/aid"]      	= {"battle/aid", 1/12, false, next="battle/idle"},
        ["battle/sing"]      	= {"battle/sing", 1/2, false},
        ["battle/pose"]      	= {"battle/pose", 1, true},

        ["battle/attack_ready"] = {"battle/attackready", 0.2, true},
        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/actready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.3},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},

        ["prepare_throw"]       = {"battle/prepare_throw", 1/15, false},
        ["throw"]       		= {"battle/throw", 1/15, false},

        ["battle/mapTransition"] = {"battle/idle_1", 0.2, true},
        ["battle/intro"]        = {"battle/idle_1", 0.15, true},
        ["battle/victory"]      = {"battle/victory", 1/10, false},
		
        ["battle/invis"]      	= {"battle/invis", 1/10, false},
		
        ["wash_hands"]      	= {"wash_hands", 1/5, false, next="washing"},
		["washing"] 	     	= {"washing", 1/5, false},
		["dry_hands"] 	     	= {"dry_hands", 1/10, false},
		
		["bed_book"] 	     	= {"bed_book", 1/10, false},
		["bed_sleep"] 	     	= {"bed_sleep", 1/10, false},
		
		["point"] 	     		= {"point", 1/10, false},
		
		["hand_card"] 	     	= {"hand_card", 1/10, false},
		
		["knife_pull"] 	     	= {"knife_pull", 1, false},
		["knife_sui"] 	     	= {"knife_sui", 1, false},
		
		["trip"] 	     		= {"trip", 1/8, false, next="fallen"},
		["fallen"] 	     		= {"fallen", 1, false},
		
		["sit_look_left"] 	    = {"sit_look_left", 1/8, false},
		["sit_look_right"] 	    = {"sit_look_right", 1/8, false},
		
		["fall"] 			    = {"fall", 5, true},
		
		["creepy_walk_right"] 	= {"creepy_walk_right", 5, true},
		["creepy_step_right"] 	= {"creepy_step_right", 5, true},
		["creepy_slash_right"] 	= {"creepy_slash_right", 1/8, false},
		
		["down"]			 	= {"down", 1/8, false},
		
		["cardgame"]			= {"cardgame", 0.15, true},
		["cardgame_l"]			= {"cardgame_l", 0.15, true},
		
		["pocketwatch"]			= {"pocketwatch", 0.15, true},
	}

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
		-- Movement offsets
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},

        ["slide"] = {0, 0},
		
		["surprised_right"] = {-5, 3},
		["surprised_left"] = {0, 0},

        -- Battle offsets
        ["battle/idle"] = {-5, -1},
        ["battle/sleep"] = {-5, -1},
        ["battle/insane"] = {-5, -1},

        ["battle/attack"] = {-5, -1},
        ["battle/attackready"] = {-5, -1},
        ["battle/act"] = {-5, -1},
        ["battle/actend"] = {-5, -1},
        ["battle/actready"] = {-5, -1},
        ["battle/item"] = {-5, -1},
        ["battle/itemready"] = {-5, -1},
        ["battle/defend"] = {-5, -1},
		
        ["battle/cure"] = {-5, -1},
        ["battle/breathe"] = {-5, -1},
        ["battle/aid"] = {-5, -1},
        ["battle/sing"] = {-5, -1},
        ["battle/pose"] = {-5, -1},

        ["battle/defeat"] = {-8, -5},
        ["battle/hurt"] = {-5, -1},
		
        ["prepare_throw"] = {-12, -1},
        ["throw"] = {-12, -1},

        ["battle/intro"] = {-5, -1},
        ["battle/victory"] = {-5, -1},
		
        ["battle/invis"] = {-5, -1},

        ["wash_hands"] = {-3, -3},
        ["washing"] = {-3, -3},
        ["dry_hands"] = {-8, -3},
		
        ["bed_book"] = {-13, 0},
        ["bed_sleep"] = {-13, 0},
		
        ["point"] = {0, 0},
		
        ["hand_card"] = {-7, 0},
		
        ["knife_pull"] = {0, 0},
        ["knife_sui"] = {0, 0},
		
        ["trip"] = {-10, 3},
        ["fallen"] = {-10, 3},
		
        ["sit_look_left"] = {0, 9},
        ["sit_look_right"] = {0, 9},
		
        ["fall"] = {0, 0},
		
        ["creepy_step_right"] = {0, 0},
        ["creepy_walk_right"] = {0, 0},
        ["creepy_slash_right"] = {0, 0},
		
        ["down"] = {-8, 7},
		
        ["cardgame"] = {-5, -1},
        ["cardgame_l"] = {-15, -1},

        ["pocketwatch"] = {0, 0},
	}
	
	self.mirror_sprites = {
		["walk/down"] = "walk_clone/up",
		["walk/up"] = "walk_clone/down",
		["walk/left"] = "walk_clone/right",
		["walk/right"] = "walk_clone/left",
	}
end

function actor:preSetAnimation(sprite, anim, callback)
	if anim == "battle/idle" and (Game.battle and Game.battle.party[1].chara.sleep) then
		sprite:setAnimation("battle/sleep")
		return true
	elseif anim == "battle/idle" and (Game.battle and Game.battle.encounter.insane) then
		sprite:setAnimation("battle/insane")
		return true
	end
end

return actor