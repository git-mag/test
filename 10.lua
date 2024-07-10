-- List of usernames to detect
local specialUsernames = {
    "yarhmplus",
    "xxxs_omeonexxx",
    "joystick531"
}

-- Function to check if a username is in the special list
local function isSpecialUsername(username)
    for _, name in ipairs(specialUsernames) do
        if username == name then
            return true
        end
    end
    return false
end

-- Function to create the GUI above the player's head
local function createDeveloperTag(player)
    -- Create BillboardGui
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "DeveloperTag"
    billboard.Size = UDim2.new(4, 0, 1, 0)  -- Adjust the size as needed
    billboard.StudsOffset = Vector3.new(0, 3, 0)  -- Offset above the head

    -- Create Frame for background
    local background = Instance.new("Frame", billboard)
    background.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Bright red
    background.BackgroundTransparency = 0  -- Adjust transparency
    background.Size = UDim2.new(1, 0, 1, 0)
    background.Position = UDim2.new(0, 0, 0, 0)
    background.BorderSizePixel = 0
    background.ClipsDescendants = true
    background.AnchorPoint = Vector2.new(0.5, 1)
    background.Position = UDim2.new(0.5, 0, 1, 0)
    background.Size = UDim2.new(1, 0, 0.2, 0)
    background.ZIndex = 10

    -- Create TextLabel for text
    local textLabel = Instance.new("TextLabel", background)
    textLabel.Text = "YARHM Developer"
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 15
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextStrokeTransparency = 1

    -- Attach BillboardGui to player's character
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    billboard.Parent = character.Head

    -- Clean up when player leaves
    player.CharacterRemoving:Connect(function()
        billboard:Destroy()
    end)
end

-- Check for existing players
for _, player in ipairs(game.Players:GetPlayers()) do
    if isSpecialUsername(player.Name) then
        createDeveloperTag(player)
    end
end

-- Listen for new players
game.Players.PlayerAdded:Connect(function(player)
    if isSpecialUsername(player.Name) then
        createDeveloperTag(player)
    end
end)
