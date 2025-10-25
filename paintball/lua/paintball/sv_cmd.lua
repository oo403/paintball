paintball = paintball or {}
paintball.server = paintball.server or {}

util.AddNetworkString("open_config_menu")

function paintball.server:RegisterCommand(name, id, func)
    hook.Add("PlayerSay", id, function(ply, text)
        if string.StartWith(string.lower(text), "/" .. name) then
            func(ply)
            return ""
        end
    end)

    concommand.Add(name, function(ply, cmd, args, argsStr)
        func(ply)
    end)
end

paintball.server:RegisterCommand("paintball_config", "paintball_config", function(ply)
    net.Start("open_config_menu")
    net.WriteEntity(ply)
    net.Send(ply)
end)