local Players = game:GetService("Players")
local player = Players.LocalPlayer
local tweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = player.PlayerScripts.Client

local ChatboxController = require(Client.ChatboxController)
local CameraController = require(Client.CameraController)
local ChemicalController = { }
local ChemicalSettings = require(ReplicatedStorage.Common.ChemicalSettings)

local Chemicals = workspace.Chemicals.Chemicals
local ChemicalGui = player.PlayerGui.ChemicalGui
local ChemicalButtons = ChemicalGui.ChemicalButtons
local ButtonConnections = { }

local EquilibriumText = workspace.Whiteboard.SurfaceGui.Equilibrium
local EquilibriumName = player.PlayerGui.ChemicalGui.EquilibriumName

local tweeningDuration = 0.5

function ChemicalController.HideUI()
    EquilibriumText.Text = ""

    for _, v in ButtonConnections do
        v:Disconnect()
    end

    local tweenInfo = TweenInfo.new(tweeningDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
    local goal = {AnchorPoint = Vector2.new(1, 0)}
    local tween
    for i in ChemicalButtons:GetChildren() do
        tween = tweenService:Create(ChemicalButtons:FindFirstChild(i), tweenInfo, goal)
        tween:Play()
    end

    goal = { Position = UDim2.new(0, 0, -0.2, 0) }
    tween = tweenService:Create(EquilibriumName, tweenInfo, goal)

    tween:Play()
    tween.Completed:Wait()

    EquilibriumName.Text = ""
end

function ChemicalController.StartChemical(chemicalName)
    if not chemicalName then return end

    local chemicalInfo

    for _, v in ChemicalSettings do
        if v["ButtonName"] ~= chemicalName then continue end
        chemicalInfo = v
        break
    end

    if not chemicalInfo then return end

    ChemicalController.HideUI()

    EquilibriumName.Text = chemicalInfo["Name"]
    EquilibriumText.Text = chemicalInfo["Equation"]

    Chemicals.Transparency = 0.4

    if chemicalInfo["Initial Color"] then
        ChemicalController.ChangeColor(chemicalInfo["Initial Color"], 0)
    end

    if chemicalInfo["Transparency"] then
        Chemicals.Transparency = chemicalInfo["Transparency"]
    end

    local tweenInfo = TweenInfo.new(tweeningDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
    local goal = { AnchorPoint = Vector2.new(0, 0) }
    local tween

    for _, v in ChemicalButtons:GetChildren() do
        v.Text.Text = ""
    end

    for i, v in chemicalInfo["Buttons"] do
        local button = ChemicalButtons:FindFirstChild(i)
        tween = tweenService:Create(button, tweenInfo, goal)
        button.Text.Text = v["ButtonName"]

        local connection = button.MouseButton1Click:Connect(function()
            ChemicalController.ShowReaction(v)
        end)
        table.insert(ButtonConnections, connection)

        tween:Play()
    end

    local button = ChemicalButtons:FindFirstChild(7)
    tween = tweenService:Create(button, tweenInfo, goal)
    button.Text.Text = "Reset Equilibrium"

    local connection = button.MouseButton1Click:Connect(function()
        ChemicalController.StartChemical(chemicalName)
    end)
    table.insert(ButtonConnections, connection)

    tween:Play()

    button = ChemicalButtons:FindFirstChild(8)
    tween = tweenService:Create(button, tweenInfo, goal)
    button.Text.Text = "Return to All Chemicals"

    connection = button.MouseButton1Click:Connect(ChemicalController.ResetChemicals)
    table.insert(ButtonConnections, connection)

    tween:Play()

    goal = { Position = UDim2.new(0, 0, 0, 0) }

    tween = tweenService:Create(EquilibriumName, tweenInfo, goal)
    tween:Play()
    tween.Completed:Wait()
end

function ChemicalController.ResetChemicals()
    ChemicalController.HideUI()

    Chemicals.Transparency = 1
    Chemicals.BubbleEmitter.ParticleEmitter.Enabled = false

    local tweenInfo = TweenInfo.new(tweeningDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
    local goal = { AnchorPoint = Vector2.new(0, 0) }
    local tween
    for i, v in ChemicalSettings do
        local button = ChemicalButtons:FindFirstChild(i)
        tween = tweenService:Create(button, tweenInfo, goal)
        button.Text.Text = v["ButtonName"]

        table.insert(ButtonConnections, button.MouseButton1Click:Connect(function()
            ChemicalController.StartChemical(v["ButtonName"])
        end))

        tween:Play()
    end

    tween.Completed:Wait()
end

function ChemicalController.ChangeColor(color, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
    local goal = {Color = color}
    local tween = tweenService:Create(Chemicals, tweenInfo, goal)
    tween:Play()

    for _, v in Chemicals:GetDescendants() do
        if v.Name == "Precipitate" or not v:IsA("BasePart") then continue end
        tweenService:Create(v, tweenInfo, goal):Play()
    end

    tween.Completed:Wait()
    Chemicals.Color = color
end

function ChemicalController.AddPrecipitate(color)
    local precipitate = Instance.new("Part")
    precipitate.Name = "Precipitate"
    precipitate.Size = Vector3.new(0.25, 0.25, 0.25)
    precipitate.Color = color
    precipitate.Parent = Chemicals
    precipitate.Position = Chemicals.BubbleEmitter.Position
end

function ChemicalController.ShowReaction(reactionInfo)
    print(reactionInfo)
    local Hypothesis = reactionInfo["Hypothesis"]
    local Dialogue = reactionInfo["Dialogue"]
    local Color = reactionInfo["Color"]
    local Animation = reactionInfo["Animation"] -- Not currently implemented.
    local Precipitate = reactionInfo["PrecipitateColor"]
    if not (Hypothesis and Dialogue) then return end

    if Chemicals.Color == Color then
        ChatboxController.Say("The chemicals are already shifted towards that end of the reaction, nothing will happen. We shouldn't waste chemicals."):await()
        return
    end

    local tweenInfo = TweenInfo.new(tweeningDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
    local goal = {AnchorPoint = Vector2.new(1, 0)}
    local tween
    for _, v in ChemicalButtons:GetChildren() do
        tween = tweenService:Create(v, tweenInfo, goal)
        tween:Play()
    end

    ChatboxController.Say("This is what I think will happen. " .. Hypothesis, player.DisplayName):await()
    CameraController.MoveTo(workspace.Cameras["Close-up Camera"], 1):await()

    if Precipitate then
        print("Adding Precipitate")
        ChemicalController.AddPrecipitate(Precipitate)
    end

    ChemicalController.ChangeColor(Color, 4)
    ChatboxController.Say(Dialogue):await()

    goal = {AnchorPoint = Vector2.new(0, 0)}
    for _, v in ChemicalButtons:GetChildren() do
        if v.Text.Text == "" then continue end
        tween = tweenService:Create(v, tweenInfo, goal)
        tween:Play()
    end

    CameraController.MoveTo(workspace.Cameras["Chemical Camera"], 1):await()
end

function ChemicalController.Reset(color)
    for _, v in Chemicals:GetChildren() do
        if v.Name == "Precipitate" then
            v:Destroy()
            continue
        end
    end

    ChemicalController.ChangeColor(color)
end

return ChemicalController