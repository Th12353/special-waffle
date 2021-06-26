local env = getgenv();
env.players = game:GetService("Players");
env.uis = game:GetService("UserInputService");
env.runservice = game:GetService("RunService");
env.tweenservice = game:GetService("TweenService");
env.marketplaceservice = game:GetService("MarketplaceService");
env.textservice = game:GetService("TextService");
env.coregui = game:GetService("CoreGui");

env.player = players.LocalPlayer
env.mouse = player:GetMouse()
