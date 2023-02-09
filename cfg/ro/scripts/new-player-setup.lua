require('cfg.ro.utils.go-api')

Config.RegisterNewPlayerScript(function(player)
    local knife = Spawn.Item("knife", player)
    if knife ~= nil then
        Act.Equip(player, knife, true)
    end
    local shirt = Spawn.Item("cotton_shirt", player)
    if shirt ~= nil then
        Act.Equip(player, shirt, true)
    end
end)