local PlayerModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
local Controls = PlayerModule:GetControls()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage.Common

local CutsceneController = { }

function CutsceneController.PlayCutscene(name, ...)
    local cutscene = Common:FindFirstChild(name)

    if not cutscene then return end

    cutscene = require(cutscene)
    cutscene.Play(...)
end

return CutsceneController