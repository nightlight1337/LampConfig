if SERVER then
    util.AddNetworkString("LampConfig.Message")
    function LampConfig.SendMessage(pl, txt)
        net.Start("LampConfig.Message")
        net.WriteString(txt)
        net.Send(pl)
    end
else
    net.Receive(
        "LampConfig.Message",
        function()
            chat.AddText(Color(241, 156, 187), "[LampConfig] ", Color(255, 255, 255), net.ReadString())
        end
    )
end