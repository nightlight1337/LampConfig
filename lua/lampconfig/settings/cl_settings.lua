LampConfig.Settings = LampConfig.Settings or {}
net.Receive(
    "LampConfig.SetSettings",
    function()
        local settings = net.ReadTable()
        LampConfig.Settings = settings
    end
)

function LampConfig.OpenSettings()
    local m = vgui.Create("LampConfig.Frame")
    m:SetSize(350, ScrH() * 0.6)
    m:Center()
    m:MakePopup()
    local topm = m:Add("EditablePanel")
    topm:SetSize(0, 40)
    topm:DockMargin(17, 17, 17, 0)
    topm:Dock(TOP)
    topm.Paint = function(s, w, h)
        draw.RoundedBox(30, 0, 0, w, h, LampConfig.GetTheme().buttonclr)
    end

    local closebtn = topm:Add("DButton")
    closebtn:SetSize(30, 0)
    closebtn:DockMargin(0, 5, 10, 5)
    closebtn:Dock(RIGHT)
    closebtn.DoClick = function()
        m:AlphaTo(
            0,
            0.2,
            0,
            function()
                m:Remove()
            end
        )
    end

    closebtn.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, LampConfig.GetTheme().outlineframe)
        draw.SimpleText("r", "LampFont.Close", w * 0.5, h * 0.5, Color(227, 194, 251), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        return true
    end

    local fillpnl = m:Add("LampConfig.Scroll")
    fillpnl:Dock(FILL)
    local botm = m:Add("EditablePanel")
    botm:SetSize(0, 60)
    botm:DockMargin(17, 0, 17, 17)
    botm:Dock(BOTTOM)
    botm.Paint = function(s, w, h)
        draw.RoundedBox(20, 0, 0, w, h, LampConfig.GetTheme().buttonclr)
    end

    local infobtn = botm:Add("LampConfig.Button")
    infobtn:SetSize(55, 0)
    infobtn:DockMargin(10, 5, 0, 5)
    infobtn:Dock(LEFT)
    infobtn.DoClick = function()
        m:Remove()
    end

    infobtn.offset = 6
    infobtn.clr = table.Copy(LampConfig.GetTheme().outlineframe)
    infobtn.PaintOver = function(s, w, h)
        if s:IsHovered() then
            infobtn.clr = LampConfig.LerpColor(FrameTime() * LampConfig.GetTheme().lerp, infobtn.clr, LampConfig.GetTheme().themeclr)
        else
            infobtn.clr = LampConfig.LerpColor(FrameTime() * LampConfig.GetTheme().lerp, infobtn.clr, LampConfig.GetTheme().outlineframe)
        end

        draw.RoundedBox(16, 0, 0, w, h, infobtn.clr)
        surface.SetMaterial(LampConfig.GetImage("https://i.imgur.com/ulpgmJw.png"))
        surface.SetDrawColor(255, 255, 255)
        surface.DrawTexturedRect(infobtn.offset, infobtn.offset, w - (infobtn.offset * 2), h - (infobtn.offset * 2))

        return true
    end

    local langbtn = botm:Add("LampConfig.Button")
    langbtn:SetSize(113, 0)
    langbtn:DockMargin(8, 5, 0, 5)
    langbtn:Dock(LEFT)
    langbtn.DoClick = function()
        fillpnl:Clear()
        for k, v in pairs(LampConfig.Lang) do
            local btn = fillpnl:Add("LampConfig.Button")
            btn:SetSize(0, 40)
            btn:DockMargin(17, 10, 17, 0)
            btn:Dock(TOP)
            btn.DoClick = function()
                net.Start("LampConfig.SetSettings")
                net.WriteString("Lang")
                net.WriteString(k)
                net.SendToServer()
            end

            btn.PaintOver = function(s, w, h)
                surface.SetMaterial(LampConfig.GetImage(v.icon))
                surface.SetDrawColor(255, 255, 255)
                surface.DrawTexturedRect(15, 6, 45, 28)
                draw.SimpleText(utf8.upper(k), "LampFont.34", 68, h * 0.5, LampConfig.GetTheme().white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        end
    end

    langbtn.DoClick()
    langbtn.clr = table.Copy(LampConfig.GetTheme().outlineframe)
    langbtn.PaintOver = function(s, w, h)
        if s:IsHovered() then
            langbtn.clr = LampConfig.LerpColor(FrameTime() * LampConfig.GetTheme().lerp, langbtn.clr, LampConfig.GetTheme().themeclr)
        else
            langbtn.clr = LampConfig.LerpColor(FrameTime() * LampConfig.GetTheme().lerp, langbtn.clr, LampConfig.GetTheme().outlineframe)
        end

        draw.RoundedBox(16, 0, 0, w, h, langbtn.clr)
        draw.SimpleText(utf8.upper(LampConfig.GetLang("lang")), "LampFont.34", w * 0.5, h * 0.5, LampConfig.GetTheme().white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local themebtn = botm:Add("LampConfig.Button")
    themebtn:SetSize(113, 0)
    themebtn:DockMargin(8, 5, 0, 5)
    themebtn:Dock(LEFT)
    themebtn.DoClick = function()
        fillpnl:Clear()
        for k, v in pairs(LampConfig.Theme) do
            local btn = fillpnl:Add("LampConfig.Button")
            btn:SetSize(0, 40)
            btn:DockMargin(17, 10, 17, 0)
            btn:Dock(TOP)
            btn.DoClick = function()
                net.Start("LampConfig.SetSettings")
                net.WriteString("Theme")
                net.WriteString(k)
                net.SendToServer()
            end

            btn.PaintOver = function(s, w, h)
                draw.RoundedBox(8, 15, 6, 28, 28, LampConfig.GetTheme().white)
                draw.RoundedBox(8, 16, 7, 26, 26, LampConfig.GetTheme().themeclr)
                draw.SimpleText(utf8.upper(k), "LampFont.34", 52, h * 0.5, LampConfig.GetTheme().white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        end
    end

    themebtn.clr = table.Copy(LampConfig.GetTheme().outlineframe)
    themebtn.PaintOver = function(s, w, h)
        if s:IsHovered() then
            themebtn.clr = LampConfig.LerpColor(FrameTime() * LampConfig.GetTheme().lerp, themebtn.clr, LampConfig.GetTheme().themeclr)
        else
            themebtn.clr = LampConfig.LerpColor(FrameTime() * LampConfig.GetTheme().lerp, themebtn.clr, LampConfig.GetTheme().outlineframe)
        end

        draw.RoundedBox(16, 0, 0, w, h, themebtn.clr)
        draw.SimpleText(utf8.upper(LampConfig.GetLang("theme")), "LampFont.34", w * 0.5, h * 0.5, LampConfig.GetTheme().white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
end

concommand.Add("lampconfig", LampConfig.OpenSettings)