local PANEL = {}
function PANEL:Init()
    self:SetAlpha(0)
    self:AlphaTo(255, 0.2, 0)
end

function PANEL:Paint(w, h)
    draw.RoundedBox(25, 0, 0, w, h, LampConfig.GetTheme().frame)
    surface.SetMaterial(LampConfig.GetImage("https://i.imgur.com/Vj6tu5s.png"))
    surface.SetDrawColor(255, 255, 255)
    surface.DrawTexturedRect(0, 0, w, h)
end

vgui.Register("LampConfig.Frame", PANEL, "EditablePanel")