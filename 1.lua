local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerListGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 600)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create UIListLayout
local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = frame

-- Function to teleport to player
local function teleportToPlayer(targetPlayer)
    local localPlayer = Players.LocalPlayer
    if localPlayer and targetPlayer and targetPlayer.Character and localPlayer.Character then
        local hrp = localPlayer.Character:FindFirstChild("HumanoidRootPart")
        local targetHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp and targetHrp then
            hrp.CFrame = targetHrp.CFrame
        end
    end
end

-- Function to create player button
local function createPlayerButton(player)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 50)
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button.BorderSizePixel = 0
    button.Text = player.Name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = frame

    -- Load player's profile picture
    local thumbnailUrl = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, 50, 0, 50)
    imageLabel.Position = UDim2.new(0, 0, 0, 0)
    imageLabel.Image = thumbnailUrl
    imageLabel.Parent = button

    -- Adjust text position
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.TextSize = 18
    button.Text = "   " .. player.Name

    button.MouseButton1Click:Connect(function()
        teleportToPlayer(player)
    end)

    player.AncestryChanged:Connect(function()
        if not player:IsDescendantOf(Players) then
            button:Destroy()
        end
    end)
end

-- Create buttons for all current players
for _, player in ipairs(Players:GetPlayers()) do
    createPlayerButton(player)
end

-- Update list when players join or leave
Players.PlayerAdded:Connect(function(player)
    createPlayerButton(player)
end)

Players.PlayerRemoving:Connect(function(player)
    for _, button in ipairs(frame:GetChildren()) do
        if button:IsA("TextButton") and button.Text == "   " .. player.Name then
            button:Destroy()
        end
    end
end)

