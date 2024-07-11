-- Constants
local MENU_TOGGLE_KEY = Enum.KeyCode.RightShift
local MENU_TITLE = "Player List"
local MENU_FONT = Enum.Font.GothamBold
local MENU_SIZE_X = 250
local MENU_SIZE_Y = 400
local MENU_POSITION_X = 50
local MENU_POSITION_Y = 50
local MENU_CLOSE_BUTTON_SIZE = UDim2.new(0, 20, 0, 20)
local PLAYER_LIST_UPDATE_INTERVAL = 1 -- in seconds

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- GUI Setup
local menuOpen = false

local playerListFrame = Instance.new("Frame")
playerListFrame.Name = "PlayerListFrame"
playerListFrame.Size = UDim2.new(0, MENU_SIZE_X, 0, MENU_SIZE_Y)
playerListFrame.Position = UDim2.new(0, MENU_POSITION_X, 0, MENU_POSITION_Y)
playerListFrame.BackgroundTransparency = 0.5
playerListFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerListFrame.BorderSizePixel = 2
playerListFrame.Active = true
playerListFrame.Visible = false
playerListFrame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "X"
closeButton.Size = MENU_CLOSE_BUTTON_SIZE
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.Font = MENU_FONT
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.Parent = playerListFrame

local playerListUI = Instance.new("ScrollingFrame")
playerListUI.Name = "PlayerListUI"
playerListUI.Size = UDim2.new(1, 0, 1, -30)
playerListUI.Position = UDim2.new(0, 0, 0, 30)
playerListUI.BackgroundTransparency = 1
playerListUI.BorderSizePixel = 0
playerListUI.CanvasSize = UDim2.new(0, 0, 0, 0)
playerListUI.Parent = playerListFrame

local function updatePlayerList()
    playerListUI:ClearAllChildren()

    for _, player in ipairs(Players:GetPlayers()) do
        local playerFrame = Instance.new("TextButton")
        playerFrame.Name = player.Name
        playerFrame.Text = player.Name
        playerFrame.Size = UDim2.new(1, 0, 0, 50)
        playerFrame.Position = UDim2.new(0, 0, 0, (#playerListUI:GetChildren() * 50))
        playerFrame.Font = MENU_FONT
        playerFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerFrame.BackgroundTransparency = 0.5
        playerFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        playerFrame.BorderSizePixel = 0
        playerFrame.Parent = playerListUI

        playerFrame.MouseButton1Click:Connect(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
        end)
    end

    playerListUI.CanvasSize = UDim2.new(0, 0, 0, #playerListUI:GetChildren() * 50)
end

local function onPlayerAdded(player)
    player.Changed:Connect(function(property)
        if property == "Parent" and player.Parent == nil then
            playerListUI[player.Name]:Destroy()
            updatePlayerList()
        end
    end)

    updatePlayerList()
end

local function onPlayerRemoved(player)
    if playerListUI:FindFirstChild(player.Name) then
        playerListUI[player.Name]:Destroy()
        updatePlayerList()
    end
end

-- Event connections
closeButton.MouseButton1Click:Connect(function()
    playerListFrame.Visible = false
    menuOpen = false
end)

UserInputService.InputBegan:Connect(function(input, isProcessed)
    if not isProcessed and input.KeyCode == MENU_TOGGLE_KEY then
        menuOpen = not menuOpen
        playerListFrame.Visible = menuOpen
    end
end)

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoved)

-- Initial setup
Players:GetPlayers()
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Periodic update of player list
while true do
    wait(PLAYER_LIST_UPDATE_INTERVAL)
    updatePlayerList()
end
