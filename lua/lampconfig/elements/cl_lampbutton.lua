local PANEL = {}
local offset = 2
function PANEL:Paint(w, h)
    if self:IsHovered() then
        draw.RoundedBox(30, 0, 0, w, h, LampConfig.GetTheme().white)
        draw.RoundedBox(30, offset, offset, w - (offset * 2), h - (offset * 2), LampConfig.GetTheme().buttonclr)
    else
        draw.RoundedBox(30, 0, 0, w, h, LampConfig.GetTheme().buttonclr)
    end

    return true
end

vgui.Register("LampConfig.Button", PANEL, "DButton")