local lib = {}

lib.CreateNotif = function(Text, Color)
    if game.PlaceId == 3431407618 then
    local alert = Instance.new('Color3Value')
    alert.Name = Text
    alert.Parent = game.Players.LocalPlayer.Character["@Alerts"]
    alert.Value = Color3.fromRGB(255, 255, 255)
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Game.Alert:GetChildren()) do
        if v.Text == alert.Name then
            v.TextColor3 = Color
    end
    end
    elseif game.PlaceId == 3095204897 then
    local alert = Instance.new('Color3Value')
    alert.Name = Text
    alert.Parent = game.Players.LocalPlayer.Character["@Alerts"]
    alert.Value = Color3.fromRGB(255, 255, 255)
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Alert.Alert:GetChildren()) do
        if v.Text == alert.Name then
            v.TextColor3 = Color
    end
    end
    end
end

return lib
