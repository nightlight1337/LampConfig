for i = 10, 50, 2 do
    surface.CreateFont(
        "LampFont." .. i,
        {
            font = system.IsLinux() and "Roboto" or "Sriracha Cyrillic",
            size = i,
            extended = true,
        }
    )
end

surface.CreateFont(
    "LampFont.Close",
    {
        font = "Marlett",
        size = 32,
        extended = true,
        symbol = true,
    }
)

LampConfig.Theme = LampConfig.Theme or {}
function LampConfig.AddTheme(name, tbl)
    LampConfig.Theme[name] = tbl
end

function LampConfig.GetTheme()
    if LampConfig.Settings["Theme"] then
        return LampConfig.Theme[LampConfig.Settings["Theme"]]
    else
        return LampConfig.Theme["Light"]
    end
end