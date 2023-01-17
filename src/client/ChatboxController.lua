local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Promise = require(ReplicatedStorage.Common:WaitForChild("Promise"))
local mouse = player:GetMouse()

local Client = player.PlayerScripts.Client

local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local Chatbox = ScreenGui.Chatbox

local ChatboxController = { }

local ShortPause = ",;"
local LongPause = ".?!-"
local ChatSpeed = 1

ChatboxController.Test = "The solution shifts to the right as more reactants are being added; however, there aren't enough ammonia ions to overpower the light blue precipitate formed by the complex of copper II ions and water."

function ChatboxController.Show()
    Chatbox.Visible = true
end

function ChatboxController.Hide()
    Chatbox.Text.Text = ""
    Chatbox.Speaker.Text = ""
    Chatbox.Visible = false
end

function ChatboxController.Say(text, speaker)
    return Promise.new(function(resolve)

        if not speaker then
            speaker = "Walt"
        end

        Chatbox.Speaker.Text = speaker

        ChatboxController.Show()

        local ChatboxText = Chatbox.Text
        local TextSound = Chatbox.Sound
        ChatboxText.Text = ""

        for _, v in text:split("") do
            ChatboxText.Text = ChatboxText.Text .. v
            TextSound:Play()
            if string.match(ShortPause, v) then task.wait(0.2 / ChatSpeed) end
            if string.match(LongPause, v) then
                task.wait(0.3 / ChatSpeed)
            end
            task.wait(0.03 / ChatSpeed)
        end

        local connection

        connection = mouse.Button1Down:Connect(function()
            ChatboxController.Hide()
            Chatbox.Continue.Visible = false
            connection:Disconnect()
            resolve()
            return
        end)

        while true do
            Chatbox.Continue.Visible = true
            Promise.delay(0.5):await()
            Chatbox.Continue.Visible = false
            Promise.delay(0.5):await()
        end
    end)
end

return ChatboxController