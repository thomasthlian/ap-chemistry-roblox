local PlayerModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
local Controls = PlayerModule:GetControls()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Client = player.PlayerScripts.Client

local CutsceneController = { }

function CutsceneController.PlayCutscene(name, ...)
    local cutscene = Client.Cutscenes:FindFirstChild(name)

    if not cutscene then return end

    cutscene = require(cutscene)
    cutscene.Play(player, ...)
end

return CutsceneController