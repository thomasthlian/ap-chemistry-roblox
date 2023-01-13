local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local Chatbox = ScreenGui.Chatbox

local ChatboxController = { }

local ShortPause = ",;"
local LongPause = ".?!-"

ChatboxController.Test = "The solution shifts to the right as more reactants are being added; however, there aren't enough ammonia ions to overpower the light blue precipitate formed by the complex of copper II ions and water."

function ChatboxController.Show()
    Chatbox.Visible = true
end

function ChatboxController.Hide()
    Chatbox.Text.Text = ""
    Chatbox.Visible = false
end

function ChatboxController.Say(text)
    ChatboxController.Show()

    local ChatboxText = Chatbox.Text
    local TextSound = Chatbox.Sound
    ChatboxText.Text = ""

    for _, v in text:split("") do
        ChatboxText.Text = ChatboxText.Text .. v
        TextSound:Play()
        local ShortPause = ",;"
        local LongPause = ".?!-"
        if string.match(ShortPause, v) then task.wait(0.3) end
        if string.match(LongPause, v) then
            task.wait(0.5)
            if #ChatboxText.Text > 150 then
                task.wait(5)
                ChatboxText.Text = ""
            end
        end
        task.wait(0.03)

    end

    if not ChatboxText.Text == "" then
        task.wait(5)
        ChatboxText.Text = ""
    end
    Chatbox.Visible = false
end

return ChatboxController