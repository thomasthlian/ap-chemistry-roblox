local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local Client = player.PlayerScripts.Client
local Cameras = workspace.Cameras

local ChatboxController = require(Client.ChatboxController)
local ChemicalController = require(Client.ChemicalController)
local CameraController = require(Client.CameraController)
local CutsceneController = require(Client.CutsceneController)
local PlayerModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))

local Controls = PlayerModule:GetControls()
Controls:Disable()

local Walter = ReplicatedStorage.Models["Walter White"]:Clone()
Walter.Parent = workspace.Models

CameraController.Start()
task.wait(2) -- Change to OnClick Button
CutsceneController.PlayCutscene("StartCutscene")
CameraController.MoveTo(Cameras["Begun Camera"], 2)

local text = "Jesse, er-" .. player.DisplayName .. " it's time to cook... You need some chemistry help? Le Châtelier's Principle? Alright " .. player.DisplayName .. ", let's head over to the lab."

ChatboxController.Say(text)

ChemicalController.ChangeColor(Color3.fromRGB(0,0,255))