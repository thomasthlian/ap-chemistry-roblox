<<<<<<< Updated upstream
local LabTable = workspace:WaitForChild("Lab Table")
local Chemicals = LabTable.Chemicals

local ChemicalController = { }
ChemicalController.ChemicalColor = Chemicals.BrickColor

function ChemicalController.ChangeColor(color)
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
=======
local tweenService = game:GetService("TweenService")
local ChemicalModel = workspace:WaitForChild("Chemicals")
local Chemicals = ChemicalModel.Chemicals

local ChemicalController = { }
ChemicalController.ChemicalColor = Chemicals.Color

function ChemicalController.ChangeColor(color)
    local tweenInfo = TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
>>>>>>> Stashed changes
    local goal = {Color = color}
    local tween = tweenService:Create(Chemicals, tweenInfo, goal)
    tween:Play()

    for _, v in Chemicals:GetChildren() do
<<<<<<< Updated upstream
        if v.Name == "Precipitate" then continue end
        tweenService:Create(v, tweenInfo, goal):Play()
    end
    ChemicalController.ChemicalColor = Chemical.BrickColor
=======
        if v.Name == "Precipitate" or not v:IsA("BasePart") then continue end
        tweenService:Create(v, tweenInfo, goal):Play()
    end
    ChemicalController.ChemicalColor = Chemicals.Color
>>>>>>> Stashed changes
end

function ChemicalController.AddPrecipitate(color)
    local precipitate = Instance.new("Part")
    precipitate.Name = "Precipitate"
    precipitate.Size = Vector3.new(0.1, 0.1, 0.1)
<<<<<<< Updated upstream
    precipitate.BrickColor = color
=======
    precipitate.Color = color
>>>>>>> Stashed changes
    precipitate.Parent = Chemicals
    precipitate.Position = Chemicals.BubbleEmitter.Position
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