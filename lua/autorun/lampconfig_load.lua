if SERVER then
    resource.AddWorkshop("3104918953") -- LampConfig
end

LampConfig = LampConfig or {}
local function a(b, c)
    local d = string.lower(string.Left(b, 3))
    if SERVER and d == "sv_" then
        include(c .. b)
    elseif d == "sh_" then
        if SERVER then
            AddCSLuaFile(c .. b)
        end

        include(c .. b)
    elseif d == "cl_" then
        if SERVER then
            AddCSLuaFile(c .. b)
        elseif CLIENT then
            include(c .. b)
        end
    end
end

local function e(c)
    c = c .. "/"
    local f, g = file.Find(c .. "*", "LUA")
    for h, i in ipairs(f) do
        a(i, c)
    end

    for h, i in ipairs(g) do
        e(c .. i)
    end
end

e("lampconfig")
