local tweenService = game:GetService("TweenService")
local StartCutscene = { }

local Pathfinding = require(game:GetService("ReplicatedStorage").Common.Pathfinding)

function StartCutscene.Play()
    local cutscene = workspace:WaitForChild("CutsceneModels").StartCutscene
    local door = cutscene.Door1
    local finalDoor = cutscene.Door2

    for _, v in door:GetChildren() do
        v.Transparency = 0
    end

    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
    local cf = Instance.new("CFrameValue")
    cf.Value = door:GetPrimaryPartCFrame()
    cf:GetPropertyChangedSignal("Value"):Connect(function()
        door:SetPrimaryPartCFrame(cf.Value)
    end)

    local tween = tweenService:Create(cf, tweenInfo, { Value = finalDoor:GetPrimaryPartCFrame() })
    tween:Play()
    tween.Completed:Wait()

    Pathfinding.FollowPath(cutscene.Waypoints, workspace.Models["Walter Underwear"]):await()
end

return StartCutscene