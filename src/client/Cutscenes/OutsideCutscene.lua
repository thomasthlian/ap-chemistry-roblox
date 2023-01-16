local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local Client = player.PlayerScripts.Client
local ChatboxController = require(Client.ChatboxController)
local CameraController = require(Client.CameraController)
local Pathfinding = require(ReplicatedStorage.Common.Pathfinding)

local CutsceneModels = workspace.CutsceneModels
local Camera = workspace.CurrentCamera
local Cameras = workspace.Cameras
local Walter = workspace.Models["Walter Underwear"]

local OutsideCutscene = { }

function OutsideCutscene.Play()
    local text = "Uh... you caught me at a bad time. Well Jesse, er-" .. player.DisplayName .. " it's time to cook... You need some chemistry help? Le Châtelier's Principle? Alright " .. player.DisplayName .. ", let's head over to the lab. By the way, the name's Walt."
    local Promise = ChatboxController.Say(text, "???")
    local CutsceneCameras = workspace.CutsceneModels.WaitingCutscene
    local Outside = CutsceneModels.Outside

    for i = 1, 4 do
        CameraController.MoveTo(CutsceneCameras[i], 2.5):await()
    end
    CameraController.MoveTo(Cameras["Begun Camera"], 1):await()

    Promise:await()
    CameraController.MoveTo(Cameras["Outside Camera"], 3)

    Pathfinding.FollowPath(Outside.Waypoints, player.Character)
    Pathfinding.FollowPath(Outside.Waypoints, Walter):await()

    Walter.PrimaryPart.CFrame = Outside.Walter.CFrame
    player.Character.PrimaryPart.CFrame = Outside.Player.CFrame

    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
    local TransitionFrame = player.PlayerGui.ScreenGui.TransitionFrame
    local tween = tweenService:Create(TransitionFrame, tweenInfo, { AnchorPoint = Vector2.new(0, 0.5) })
    tween:Play()
    tween.Completed:Wait()
    Camera.CFrame = Cameras["Inside Camera"].CFrame

    task.wait(1)

    tween = tweenService:Create(TransitionFrame, tweenInfo, { AnchorPoint = Vector2.new(1, 0.5) })
    tween:Play()
    tween.Completed:Wait()
end

return OutsideCutscene