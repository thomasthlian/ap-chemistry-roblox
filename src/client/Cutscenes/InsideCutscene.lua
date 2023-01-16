local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local Client = player.PlayerScripts.Client
local Walter = workspace.Models["Walter Underwear"]
local Inside = workspace.CutsceneModels.Inside

local ChatboxController = require(Client.ChatboxController)
local Pathfinding = require(ReplicatedStorage.Common.Pathfinding)
local CameraController = require(Client.CameraController)
local ChemicalController = require(Client.ChemicalController)

local InsideCutscene = { }

function InsideCutscene.Play()
    ChatboxController.Say(player.DisplayName .. ", I’m going to be using some dangerous chemicals to demonstrate Le Châtelier's Principle. It is important to understand the potential hazards associated with the chemicals we will be working with."):await()
    ChatboxController.Say("Ethanol is highly flammable; last time we used Hydrochloric Acid in Jesse’s house it didn’t go well. We should wear gloves and turn off all flames for Ethanol."):await()
    ChatboxController.Say("I’m going to change into some suitable lab gear."):await()
    Pathfinding.FollowPath(Inside["Into Closet"], Walter):await()

    Walter:Destroy()
    Walter = ReplicatedStorage.Models["Walter Lab"]:Clone()
    Walter.Parent = workspace.Models
    task.wait(1)

    Pathfinding.FollowPath(Inside["Out of Closet"], Walter):await()
    ChatboxController.Say("I quickly shaved my hair and now we're ready."):await()
    ChatboxController.Say("First, we should go over some lab safety. It is important to familiarize yourself with the location of emergency exits, fire extinguishers, and first aid kits."):await()
    ChatboxController.Say("We should also wear appropriate equipment such as goggles, lab coats and gloves. Handle chemicals properly by following proper lab procedures."):await()
    ChatboxController.Say("I would advise you to keep your work area clean to prevent accidents. As we say in Breaking Bad, it is important to remove all contaminants."):await()
    ChatboxController.Say("Now that we got that out of the way, let's move over to the lab bench so I can show you the chemicals."):await()

    CameraController.MoveTo(workspace.Cameras["Classroom Camera"], 5)
    Pathfinding.FollowPath(Inside["To Desk"], player.Character)
    Pathfinding.FollowPath(Inside["Behind Bench"], Walter):await()

    CameraController.MoveTo(workspace.Cameras["Chemical Camera"], 4):await()
    ChatboxController.Say("Before we begin, I would like to explain what Le Châtelier's Principle even is."):await()
    ChatboxController.Say("Le Châtelier's principle states that if a system in equilibrium is subjected to a change such as concentration, temperature, or pressure, the system will shift in such a way as to counteract the change and reestablish equilibrium. In other words, a system at equilibrium will try to maintain balance by opposing any change that is imposed upon it. This principle is often used to predict the behavior of chemical reactions and physical processes."):await()
    ChatboxController.Say("Now that we got that out of the way, we can show this principle in action in several equilibriums. For each chemical, you will first tell me what you think will happen, then I will explain."):await()
    player.PlayerGui.ChemicalGui.Enabled = true
    ChemicalController.ResetChemicals()
end

return InsideCutscene