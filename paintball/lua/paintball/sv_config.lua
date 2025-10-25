paintball = paintball or {}
paintball.server = paintball.server or {}

util.AddNetworkString("paintball_save_config")
util.AddNetworkString("paintball_send_config")

local config_path = "paintball/config.json"
local default_config = {
    arena_pos = { x = 0, y = 0, z = 0 },
}

function paintball.server.LoadConfig()
    if file.Exists(config_path, "DATA") then
        local json_table = file.Read(config_path, "DATA")
        local normal_table = util.JSONToTable(json_table) or {}
        paintball.server.config = table.Merge(table.Copy(default_config), normal_table)
    else
        paintball.server.config = table.Copy(default_config)
        file.CreateDir("paintball")
        file.Write(config_path, util.TableToJSON(paintball.server.config, true))
    end
end

function paintball.server:SaveConfig()
    file.Write(config_path, util.TableToJSON(paintball.server.config, true))
end

paintball.server.LoadConfig()