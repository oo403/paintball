paintball = paintball or {}
paintball.client = paintball.client or {}

function paintball.client:OpenConfigMenu(ply)
    if ply:IsSuperAdmin() then
        self.BG = vgui.Create("PaintballFrame")
        self.BG:SetSize(ScrW() / 2, ScrH() / 2)
        self.BG:Center()
        self.BG:MakePopup()

        self.CLOSEBUTTON = vgui.Create("PaintballButton", self.BG)
        self.CLOSEBUTTON:SetPos(self.BG:GetWide() - 32, 0)
        self.CLOSEBUTTON:SetSize(32, 32)
        self.CLOSEBUTTON:SetbText("X")

        self.CLOSEBUTTON.DoClick = function()
            self.BG:Remove()
        end

        self.POS = vgui.Create("DLabel", self.BG)
    end
end

net.Receive("open_config_menu", function(len, ply)
    local ply = net.ReadEntity(ply)
    paintball.client:OpenConfigMenu(ply)
end)