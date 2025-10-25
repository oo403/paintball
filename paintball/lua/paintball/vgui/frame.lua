local PANEL = {}

function PANEL:Init()
    self:SetDraggable(false)
    self:SetTitle("")
    self:ShowCloseButton(false)
end

function PANEL:Paint(w, h)
    draw.RoundedBox(5, 0, 0, w, h, Color(73,74,97))
end

vgui.Register("PaintballFrame", PANEL, "DFrame")