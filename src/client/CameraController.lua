local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Promise = require(ReplicatedStorage.Common.Promise)

local CameraController = { }

function CameraController.Start()
    Camera.CameraType = Enum.CameraType.Scriptable
    Camera.CFrame = workspace.Cameras["Menu Camera"].CFrame
end

function CameraController.MoveTo(part, time)
    return Promise.new(function(resolve)
        local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
        local goal = {CFrame = part.CFrame}
        local tween = tweenService:Create(Camera, tweenInfo, goal)
        tween:Play()
        tween.Completed:Wait()
        resolve()
    end)
end

return CameraController