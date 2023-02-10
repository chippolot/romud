## Resources
* https://github.com/mudcoders/awesome-mud
* https://irowiki.org/classic/Attacks
* https://db.irowiki.org/db/monster-info/1002/
* https://ratemyserver.net/index.php?page=mob_db&list=1&letter=d

## TODO
[x] Users can see each others' messages
[x] Users get joined/left notifications for other users
[x] Users join basic room with description
[x] Scope communication to rooms
[x] Different communication options (whisper, say, yell)
[x] Room exits
[x] Input prompt
[x] Users can move between rooms
[x] List commands of known exits
[x] Users get notifications when moving between rooms
[x] List players in room
[x] Auto-restart server + client
[x] Preamble
[x] Colorful output 
[x] User can login w/ character name
[x] Send w/ and w/o prompt
[x] Persistence
    [x] Saving
    [x] Loading
[x] Stats
[x] Stats in prompt
[x] Loading from data files
[x] Mobs
    [x] Viewing in Room
    [x] Looking At
[x] Wandering Mobs
[x] Remove Disconnected entities!
[x] Log Flags
[x] Self status command
[x] Leveling up
[x] Items
    [x] Viewing in Room
    [x] Inventory
    [x] Get
    [x] Drop
    [x] Scavengers
    [x] Containers
    [x] Get From
    [x] Put in
    [x] Get All From
    [x] Weights
    [x] Looking At
    [x] Equip Command
    [x] Unequip Command
    [x] Equipment Stats
    [x] Use Weapons in Combat
    [x] Show Equipped
    [x] Slot specific equip messages
    [x] Wear armor in combat
    [x] Armor buffs
[x] Combat
    [x] Why isn't player dealing damage 
    [x] Better ranging and ending combat
    [x] Combat prompt
    [x] Roll for damage / hits
    [x] Critical hits
    [x] End combat if stunned
    [x] End of battle message
    [x] Regain health on login
    [x] KOed and Death
    [x] Condition change messages
    [x] XP gain
    [x] Damage dependent messages
    [x] Corpses
    [x] Leave corpse on death
    [x] Hit and damage bonuses
    [x] Kick to the ground
[x] Positions
    [x] Limit actions
    [x] Rest + Sleep actions
        [x] Restore stats
[x] Scavengers
[x] Spawning - Debug command
[x] get all corpse
[x] Heal on login after time
[x] Aliases
[x] Give command
[x] Search
    [x] Require double quotes for entity disambiguation
    [x] Support all for put
    [x] Support all for give
    [x] Support all for drop
[x] Description grouping
[x] Looking at players
[x] Status Effects
    [x] Expiration
    [x] Application
    [x] Remove on login
    [x] From attacks
    [x] From equipment
    [x] Advantage / Disadvantage
    [x] Roll Boosts
[x] Text
    [x] Handle blind + invisible at room level -- needs new text parsing
        [x] Need to differentiate between actions player can FEEL vs ones they can SEE
    [x] Lazy name resolvers for everything!
[x] Equipment
    [x] Advantage / Disadvantage
    [x] Roll Boosts
    [x] Use Armor in Combat
    [x] Mobs use equipment
[x] Advantage / Disadvantage Sources
[x] Lua Scripting
    [x] EnterRoom / EntityEnterRoom
    [x] Bindings
        [x] Attack
        [x] Say / Whisper / Yell
        [x] Move
        [x] Get / Equip / Unequip
    [x] Example : Equipper Mob
        [x] Picks up equippable items off the ground
        [x] Equips items
            [x] Only if slot open
            [x] When picked up
            [x] When given
        [x] Boasts about it
[x] Color as send option
[x] Colorize assist msg
[x] Clear status effects on death
[x] Zones
    [x] Movement is zone-locked
[x] Circle Data Conversion
    [x] Rooms
    [x] Zones
    [x] Mobs
[x] Lua-ize Config
    [x] Zones
    [x] Rooms
    [x] Items
    [x] Entities
        [x] Config
        [x] Entity Scripts
    [x] Cleanup old JSON
[x] Fix attack config parsing
[x] Circle Data
    [x] Items
    [x] Finish Spawn Commands
    [x] Make LoadEntityLimited/LoadItemLimited actually limited
[x] Zones
    [x] Spawning in zones
        [x] Give enemies
        [x] Equip enemies w/ items
    [x] Respawn on timer
[x] Passwords
[x] Telnet protocol
    [x] Password mode
[x] Combat Speed
[x] Config roots
[x] Thread Safety!
[x] RO
    [x] Calc full exp value
    [x] Base Stats
    [x] ASpd
    [x] Level Table
    [x] Mov everything to RO Classic
    [x] Mon Dodge special calc?
    [x] Mon Flee special calc?
    [x] Players start w/ knife + shirt
    [x] How much damage should unarmed do?
    [x] Weapon AtkPower
    [x] Unarmed AtkSpeed
    [x] Hard Def
    [x] Fix damage messages
    [x] Die at 0
    [x] No more bleeding out
    [x] Players don't drop corpses
    [x] Critical Message
    [x] Auto Level Up
    [x] Why aren't they moving?
    [x] Stat points
        [x] Gain
        [x] Spend
    [x] Death options
    [x] Drop tables
    [x] Make linked list add to tail as well 
    [x] Temp dropped item ownership
    [x] HP / SP Recovery -- https://irowiki.org/classic/HP_Recovery
    [x] RO Spawning
    [x] Required equipment levels
    [x] Entity Speeds - Walking
    [x] Items
        [x] Healing Items
            [x] Apple
    [x] Damage elements
    [x] Damage sizes
    [x] Shops
        [x] Group notifs by amount
        [x] Item name plural or singular
        [x] Allow buying multiples
    [x] Skills
        [x] Water Attribute Attack
        [x] Whirlwind
            [x] Fix
        [x] List Skills
            [x] List skills for current and all previous jobs
        [x] Learn Skills
        [x] Upgrade skills
        [x] Targeting a monster should aggro it
        [x] Async.Schedule -- Thunderstorm
        [x] NPC: Metamorphasis
        [x] NPC: Teleportation
        [x] Tag entities that are "silent" for shouting magic incantations
        [x] NPC: Wind Attribute Attack 1
    [x] Magic
        [x] Use MATK for magic spells
        [x] Stats Screen
            [x] MAtk
            [x] MDef
        [x] Cast time status mod
        [x] Sot MDef + Hard MDef
        [x] Rod
        [x] Check targets after cast time complete
        [x] Spell interruption
    [x] Lua
        [x] Go_API
    [x] Lua
        [x] More enum bindings (instead of strings)
    [x] Ranged Combat
        [x] Bows
        [x] Distance
        [x] Backstep
    [x] Jobs
        [x] Job XP
        [x] Job leveling
        [x] Job MaxHP / MaxSP / MaxMov bonuses
        [x] Job Aspd
        [x] Job tree
        [x] Job changing
    [x] Prompt
        [x] Display combat prompt for single enemy attacking you
    [x] Parser Improvements
        [x] Allow skill use at arbitrary levels
    [x] Char Creation
        [x] Starting Stats  
        [x] Lua starting script
[x] Github
    [x] Move to Github
    [x] Add License
----------------------------------------
[] Github
    [] Improve ReadMe
[] RO
    [] Skills
        [] Teleport Level 2
        [] NPC: Sleep Attack Lv 3
        [] Mage: Different messages for different spells
    [] Parser Improvements
        [] Prioritize entity searches against combat targets
    [] Jobs
        [] Job specific skills
        [] Job specific eq
            [] Unequip on job change
        [] Job stat bonuses
    [] Items
        [] Group pickup display
        [] Stackable
    [] Content
        [] Create stub Prontera w/ shop
        [] Flesh out Prontera Fields
    [] Ranged Combat
        [] Arrows
    [] Quick slot
    [] Shops
        [] Indoors/ Outdoors
        [] No Monster Spawns / Movement
    [] Create Poring Items
        [] Cards
            [] Poring Card
        [] Taming Items
            [] Unripe Apple
    [] Item types (?)
    [] Corpses crumble after time
    [] Skills
        [] Passive
    [] Advantage / Disadvantage
    [] Dex Weapons
    [] Auto-Con using colors
    [] Starting equip scriptable
[] Items
    [] Use flags (ex: edible = eat)
    [] Equipment Slots + Cards
        [] Modifies item name
[] MVP mobs
[] Equippable Cards
[] More commands
[] Status Effects
    [] Finish implementing
    [] Immunities
[] Light Sources
    [] Weather
    [] Indoors / Sector Type
[] Text
    [] Lazy gender resolvers for everything!
    [] Also, handle sleepers!
[] Items
    [] Gold
    [] Equipment
        [] Prevent dual wield
[] Combat
    [] More Skills!
        [] Grapple?
    [] Mobs can spawn w/ items from random table
    [] Mob Weapons
    [] Weapon dependent messages
    [] Attack type strengths / weaknesses
    [] Multiple damage per attack
[] Positions
    [] Look descriptions
[] Classes
[] Followers
[] Doors
[] Groups
[] Servers
    [] TLS
    [] SSH
    [] MUD Protocols
[] Generify connections -- support ssh
[] Look into MUD protocols
[] Look into MUD compression


## Skills
------------------------------
[x] first_aid
[x] bash
[x] cold_bolt
[x] fire_bolt
[x] lightning_bolt
[x] napalm_beat
[x] heal
[x] back_slide
[x] fire_ball
[x] soul_strike
[x] thunderstorm
[] play_dead
[] endure
[] increase_hp_recovery
[] magnum_break
[] provoke
[] sword_mastery
[] 2h_sword_mastery
[] berserk
[] fatal_blow
[] hp_recovery_while_moving
[] fire_wall
[] frost_driver
[] increase_sp_recovery
[] safety_wall
[] sight
[] stone_curse
[] energy_coat
[] arrow_shower
[] double_strafe
[] improve_concentration
[] owls_eye
[] vultures_eye
[] arrow_crafting
[] arrow_repel
[] angelus
[] aqua_benedicta
[] blessing
[] cure
[] decrease_agi
[] demon_bane
[] divine_protection
[] increase_agi
[] pneuma
[] ruwach
[] signum_crusis
[] teleport
[] warp_portal
[] holy_light
[] discount
[] enlarge_weight_limit
[] item_appraisal
[] mammonite
[] overcharge
[] pushcart
[] vending
[] cart_revolution
[] change_cart
[] crazy_uproar
[] detoxify
[] double_attack
[] envenom
[] hiding
[] improve_dodge
[] steal
[] find_stone
[] sand_attack
[] stone_fling
[] bowling_bash
[] brandish_spear
[] cavalier_mastery
[] counter_attack
[] peco_peco_ride
[] pierce
[] spear_boomerang
[] spear_mastery
[] spear_stab
[] twohand_quicken
[] charge_attack
[] aspersio
[] b.s_sacramenti
[] gloria
[] impositio_manus
[] increase_sp_recovery
[] kyrie_eleison
[] lex_aeterna
[] lex_divina
[] mace_mastery
[] magnificat
[] magnus_exorcismus
[] resurrection
[] safety_wall
[] sanctuary
[] slow_poison
[] status_recovery
[] suffragium
[] turn_undead
[] redemptio
[] earth_spike
[] fire_pillar
[] frost_nova
[] heaven's_drive
[] ice_wall
[] jupitel_thunder
[] lord_of_vermilion
[] meteor_storm
[] quagmire
[] sense
[] sightrasher
[] storm_gust
[] water_ball
[] fire_ivy
[] sight_blaster
[] adrenaline_rush
[] hammer_fall
[] hilt_binding
[] power_maximize
[] power-thrust
[] skin_tempering
[] weapon_perfection
[] enchantedstone_craft
[] iron_tempering
[] ore_discovery
[] oridecon_research
[] smith_axe
[] smith_dagger
[] smith_knucklebrace
[] smith_mace
[] smith_spear
[] smith_sword
[] smith_two-handed_sword
[] steel_tempering
[] weapon_repair
[] weaponry_research
[] greed
[] dubious_salesmanship
[] ankle_snare
[] beast_bane
[] blast_mine
[] blitz_beat
[] claymore_trap
[] detect
[] falconry_mastery
[] flasher
[] freezing_trap
[] land_mine
[] remove_trap
[] sandman
[] shockwave_trap
[] skid_trap
[] spring_trap
[] steel_crow
[] talkie_box
[] phantasmic_arrow
[] cloaking
[] enchant_poison
[] grimtooth
[] katar_mastery
[] righthand_mastery
[] lefthand_mastery
[] poison_react
[] sonic_blow
[] venom_dust
[] venom_splasher
[] sonic_acceleration
[] venom_knife
[] cavalier_mastery
[] cure
[] defending_aura
[] demon_bane
[] divine_protection
[] faith
[] grand_cross
[] guard
[] heal
[] holy_cross
[] peco_peco_ride
[] resistant_souls
[] sacrifice
[] shield_boomerang
[] shield_reflect
[] smite
[] spear_mastery
[] spear_quicken
[] shrink
[] flee
[] fury
[] guillotine_fist
[] iron_fists
[] mental_strength
[] occult_impaction
[] raging_quadruple_blow
[] raging_thrust
[] raging_trifecta_blow
[] root
[] snap
[] spiritual_cadence
[] spiritual_sphere_absorption
[] summon_spirit_sphere
[] throw_spirit_sphere
[] spiritual_bestowment
[] excruciating_palm
[] cast_cancel
[] deluge
[] dispell
[] dragonology
[] earth_spike
[] endow_blaze
[] endow_quake
[] endow_tornado
[] endow_tsunami
[] free_cast
[] heaven's_drive
[] hindsight
[] hocus-pocus
[] magic_rod
[] magnetic_earth
[] sense
[] spell_breaker
[] study
[] volcano
[] whirlwind
[] create_elemental_converter
[] elemental_change
[] back_stab
[] divest_armor
[] divest_helm
[] divest_shield
[] divest_weapon
[] double_strafe
[] gank
[] haggle
[] intimidate
[] mug
[] piece
[] remove_trap
[] remover
[] scribble
[] sightless_mind
[] slyness
[] snatch
[] stalk
[] sword_mastery
[] vulture's_eye
[] close_confine
[] acid_terror
[] aid_potion
[] alchemical_weapon
[] axe_mastery
[] biochemical_helm
[] bomb
[] potion_research
[] prepare_potion
[] summon_flora
[] summon_marine_sphere
[] synthesized_shield
[] synthetic_armor
[] bioethics
[] amp
[] encore
[] impressive_riff
[] magic_strings
[] melody_strike
[] music_lessons
[] perfect_tablature
[] song_of_lutie
[] unbarring_octave
[] unchained_serenade
[] acoustic_rhythm
[] battle_theme
[] classical_pluck
[] down_tempo
[] harmonic_lick
[] lullaby
[] mental_sensing
[] power_cord
[] pang_voice
[] amp
[] dance_lessons
[] dazzler
[] encore
[] focus_ballet
[] gypsy's_kiss
[] hip_shaker
[] lady_luck
[] slinging_arrow
[] slow_grace
[] acoustic_rhythm
[] battle_theme
[] classical_pluck
[] down_tempo
[] harmonic_lick
[] lullaby
[] mental_sensing
[] power_cord
[] charming_wink