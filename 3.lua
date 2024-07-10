local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerListGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 600)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Add UICorner to Frame
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

-- Create Resizable Constraint
local uiResizeConstraint = Instance.new("UISizeConstraint")
uiResizeConstraint.MinSize = Vector2.new(200, 300)
uiResizeConstraint.MaxSize = Vector2.new(600, 900)
uiResizeConstraint.Parent = frame

-- Create UIListLayout
local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 5)
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
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.Gotham
    button.Text = ""
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.Parent = frame

    -- Add UICorner to Button
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 10)
    buttonCorner.Parent = button

    -- Load player's profile picture
    local thumbnailUrl = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, 50, 0, 50)
    imageLabel.Position = UDim2.new(0, 0, 0, 0)
    imageLabel.Image = thumbnailUrl
    imageLabel.Parent = button

    -- Add UICorner to ImageLabel
    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(0, 10)
    imageCorner.Parent = imageLabel

    -- Create a TextLabel for the player's name
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -60, 1, 0)
    nameLabel.Position = UDim2.new(0, 60, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Font = Enum.Font.Gotham
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = button

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
        if button:IsA("TextButton") and button.Text == "" and button:FindFirstChild("TextLabel") and button.TextLabel.Text == player.Name then
            button:Destroy()
        end
    end
end)

-- Function to toggle the GUI
local function toggleGUI()
    if screenGui.Enabled then
        screenGui.Enabled = false
    else
        screenGui.Enabled = true
    end
end

-- Connect toggle function to right shift key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        toggleGUI()
    end
end)
