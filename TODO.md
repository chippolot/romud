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
----------------------------------------
[] Spawning - Data drives
[] Items
    [] Gold / Stacking
    [] Equipment
        [] Equipment Stats
    [] Wearing
    [] Looking At
[] Give command
[] Search
    [] Require double quotes for entity disambiguation
    [] Support all for put
    [] Support all for give
    [] Support all for drop
[] Commands
    [] Give
[] Combat
    [] More Skills!
        [] Grapple?
    [] Mobs can spawn w/ items from random table
    [] Weapons
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
[] Looking at players
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


## Update Parser to support
```
GET TAKE

GET and TAKE are exactly the same and can be used interchangeably.

Usage: get | take <object>
       get | take all.<object>
       get | take all [container]
       get | take all all.<container>
       get | take all.<object> all.<container>

If you find something interesting on the ground, you may use GET to 
pick it up. GET can also be used to extract items from containers.

Examples:

  > get sword corpse
  > get all corpse
  > get all all.bag
  > get all.bread all.bag

You can also: 
     get only the 3rd sword lying on the ground 
     get 4 swords lying on the ground
     get all swords 
     get green sword
     get all green swords

and my favorite
     get all coins from all corpses in the room

Examples:
  > get 3.sword 
  > get 4 sword
  > get all.sword
  > get green-sword
  > get all.green-sword
  > get all.coins all.corpse
  ```