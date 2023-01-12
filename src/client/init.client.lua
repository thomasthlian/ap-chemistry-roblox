local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Client = player.PlayerScripts.Client
local ChatboxController = require(Client.ChatboxController)

ChatboxController.Say(ChatboxController.Test)