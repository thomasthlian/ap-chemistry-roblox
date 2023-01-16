local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local Client = player.PlayerScripts.Client
local Cameras = workspace.Cameras
local Camera = workspace.CurrentCamera

local ChatboxController = require(Client.ChatboxController)
local ChemicalController = require(Client.ChemicalController)
local CameraController = require(Client.CameraController)
local CutsceneController = require(Client.CutsceneController)
local ChemicalSettings = require(ReplicatedStorage.Common.ChemicalSettings)

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("TopbarEnabled", false)
local StartGui = player.PlayerGui:WaitForChild("StartGui")
StartGui.Enabled = true
local StartButton = StartGui.Play.Button
local Walter = ReplicatedStorage.Models["Walter Underwear"]:Clone()
ReplicatedStorage.Models["Door"]:Clone().Parent = workspace.Models
Walter.Parent = workspace.Models

CameraController.Start()
StartButton.MouseButton1Click:Wait()
StartButton.Parent.Parent:Destroy()

CutsceneController.PlayCutscene("StartCutscene")
CutsceneController.PlayCutscene("OutsideCutscene")
CutsceneController.PlayCutscene("InsideCutscene")

player.PlayerGui.ChemicalGui.Enabled = true
ChemicalController.ResetChemicals()