Act = {
    Attack = function(e, tgt)
        GoAPI_Act.Attack(e, tgt)
    end,
    SkillAttack = function(e, tgts, skill, skillAttack)
        GoAPI_Act.SkillAttack(e, tgts, skill, skillAttack)
    end,
    Get = function(e, i)
        GoAPI_Act.Get(e, i)
    end,
    Equip = function(e, i)
        GoAPI_Act.Equip(e, i)
    end,
    MoveDir = function(e, dir)
        GoAPI_Act.MoveDir(e, dir)
    end,
    MoveTo = function(e, r)
        GoAPI_Act.MoveTo(e, r)
    end,
    Say = function(e, msg)
        GoAPI_Act.Say(e, msg)
    end,
    Tell = function(e, tgt, msg)
        GoAPI_Act.Tell(e, tgt, msg)
    end,
    Yell = function(e, yell)
        GoAPI_Act.Yell(e, yell)
    end,
}

Config = {
    NewZone = function(cfg)
        GoAPI_Config.NewZone(cfg)
    end,
    NewRoom = function(cfg)
        GoAPI_Config.NewRoom(cfg)
    end,
    NewShop = function(cfg)
        GoAPI_Config.NewShop(cfg)
    end,
    NewEntity = function(cfg)
        GoAPI_Config.NewEntity(cfg)
    end,
    NewItem = function(cfg)
        GoAPI_Config.NewItem(cfg)
    end,
    NewSkill = function(cfg)
        GoAPI_Config.NewSkill(cfg)
    end,
    RegisterNouns = function(cfg)
        GoAPI_Config.RegisterNouns(cfg)
    end,
}

Write = {
    ToPlayer = function(e, msg)
        GoAPI_Write.ToPlayer(e, msg)
    end,
    ToRoom = function(r, ignore, msg)
        GoAPI_Write.ToRoom(r, ignore, msg)
    end
}

Entity = {
    Name = function(e)
        return GoAPI_Entity.Name(e)
    end,
    NameCap = function(e)
        return GoAPI_Entity.NameCap(e)
    end,
    RoomId = function(e)
        return GoAPI_Entity.RoomId(e)
    end,
    Room = function(e)
        return GoAPI_Entity.Room(e)
    end,
    EquipSlotOpen = function(e, slot)
        return GoAPI_Entity.EquipSlotOpen(e, slot)
    end,
    HealHP = function(e, amt)
        GoAPI_Entity.HealHP(e, amt)
    end,
    HealSP = function(e, amt)
        GoAPI_Entity.HealSP(e, amt)
    end,
    HealMov = function(e, amt)
        GoAPI_Entity.HealMov(e, amt)
    end,
    InCombat = function(e)
        return GoAPI_Entity.InCombat(e)
    end,
    IsPlayer = function(e)
        return GoAPI_Entity.IsPlayer(e)
    end,
}

Item = {

    Name = function(i)
        return GoAPI_Item.Name(i)
    end,
    NameCap = function(i)
        return GoAPI_Item.NameCap(i)
    end,
    Equippable = function(i)
        return GoAPI_Item.Equippable(i)
    end,
    EquipSlot = function(i)
        return GoAPI_Item.EquipSlot(i)
    end,
}

Room = {
    Entities = function(r)
        return GoAPI_Room.Entities(r)
    end,
    Items = function(r)
        return GoAPI_Room.Items(r)
    end,
}

Util = {
    RandomChance = function()
        return GoAPI_Util.RandomChance()
    end,
    RandomRange = function(min, max)
        return GoAPI_Util.RandomRange(min, max)
    end
}