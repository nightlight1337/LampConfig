function LampConfig.GetSettings()
    local settings = file.Read("lampconfig.txt", "DATA")
    if settings then
        return util.JSONToTable(settings)
    else
        return {}
    end
end

function LampConfig.SetSettings(tbl)
    file.Write("lampconfig.txt", util.TableToJSON(tbl))
end

util.AddNetworkString("LampConfig.SetSettings")
net.Receive(
    "LampConfig.SetSettings",
    function(len, pl)
        if not pl:IsSuperAdmin() then
            LampConfig.SendMessage(pl, LampConfig.GetLang("noaccess"))

            return
        end

        local settings = LampConfig.GetSettings()
        local key = net.ReadString()
        local val = net.ReadString()
        settings[key] = val
        LampConfig.SetSettings(settings)
        net.Start("LampConfig.SetSettings")
        net.WriteTable(settings)
        net.Broadcast()
    end
)

hook.Add(
    "PlayerAuthed",
    "LampConfig.SendSettings",
    function(pl)
        net.Start("LampConfig.SetSettings")
        net.WriteTable(LampConfig.GetSettings())
        net.Send(pl)
    end
)