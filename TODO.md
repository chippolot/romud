## Resources
* https://github.com/mudcoders/awesome-mud

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
[x] Circle Data Converter
    [x] Rooms
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
[x] "get all corpse"
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
[x] Circle Data
    [x] Zones
----------------------------------------
[] Circle Data
    [] Mobs
    [] Spawn Commands
    [] Items
[] RRO Stats
[] RRO Combat
[] Combat Speed
[] Zones
    [] Spawning in zones
[] Random Drops
[] MVP mobs
[] Equippable Cards
[] Lua scripting
    [] More bindings
    [] More examples
    [] Tick trigger
    [] Delay?
    [] Example: Shrieker
[] Status Display
    [] Hit adv/dis
    [] Hit bonus
    [] Dam bonus
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
        [] Use Armor in Combat
        [] Mobs use equipment
        [] Prevent dual wield
[] Combat
    [] More Skills!
        [] Grapple?
    [] Mobs can spawn w/ items from random table
    [] Mob Weapons
    [] Weapon dependent messages
    [] More 5E combat options
    [] Attack type strengths / weaknesses
    [] Multi-attack
    [] Multiple damage per attack
[] Positions
    [] Look descriptions
[] Shops
[] Races
[] Classes
[] Followers
[] Doors
[] Figure out thread safety
[] Groups
[] Servers
    [] TLS
    [] SSH
    [] MUD Protocols
[] Passwords
[] User can login w/ character name and password
[] Generify connections -- support ssh
[] Look into MUD protocols
[] Look into MUD compression