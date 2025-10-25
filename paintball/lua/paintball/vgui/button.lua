local PANEL = {}

AccessorFunc(PANEL, "btext", "bText", FORCE_STRING)

function PANEL:Init()
    self:SetText("")
    self:SetContentAlignment(5)
end

function PANEL:Paint(w,h)
    draw.SimpleText(self.btext, "CloseCaption_Bold", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end 

vgui.Register("PaintballButton", PANEL, "DButton")