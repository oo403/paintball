paintball = paintball or {}

function paintball:LoadClient(path)
    if SERVER then
        AddCSLuaFile(path)
    elseif CLIENT then
        include(path)
    end
end

function paintball:LoadServer(path)
    if SERVER then
        include(path)
    end
end

function paintball:LoadShared(path)
    if SERVER then
        AddCSLuaFile(path)
    end

    include(path)
end

function paintball:LoadUIFiles()
    local loaded_files = 0
    local path = "paintball/vgui/"

    for _,f in ipairs(file.Find("paintball/vgui/*", "LUA")) do
        paintball:LoadClient(path .. f)

        loaded_files = loaded_files + 1
    end
    print("Załadowano pliki w ilości " .. loaded_files)
end

function paintball:LoadMainFiles()
    local loaded_files = 0
    local path = "paintball/"
    for _,f in ipairs(file.Find("paintball/*", "LUA")) do
        local prefix = string.sub(f, 0, 3)
        if prefix == "cl_" then
            paintball:LoadClient(path .. f)
            loaded_files = loaded_files + 1
        end
        if prefix == "sv_" then
            paintball:LoadServer(path .. f)
            loaded_files = loaded_files + 1
        end
        if prefix == "sh_" then
            paintball:LoadShared(path .. f)
            loaded_files = loaded_files + 1
        end
    end
    print("Załodowałem pliki w iłosci " .. loaded_files)
end

function paintball:LoadAddon()
    paintball:LoadUIFiles()
    paintball:LoadMainFiles()

    paintball.loaded = true
end

paintball:LoadAddon()