local PANEL = {}
function PANEL:Init(w, h)
    timer.Simple(
        0,
        function()
            if not IsValid(self) then return end
            local vbar = self:GetVBar()
            vbar:SetHideButtons(true)
            function vbar:Paint(w2, h2)
            end

            function vbar.btnGrip:Paint(w2, h2)
            end
        end
    )
end

vgui.Register("LampConfig.Scroll", PANEL, "DScrollPanel")