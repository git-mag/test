-- Define the usernames and the tag text
local developerUsernames = {
    "yarhmplus",
    "joystick531",
    "xxxs_omeonexxx"
}
local smallerText = "YARHM"
local largerText = "Developer"
local font = Enum.Font.Gotham -- Gotham font (change to desired font)

-- Function to create the tag above a player's head
local function createTag(player)
    -- Create BillboardGui for the tag
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "DeveloperTag"
    billboardGui.AlwaysOnTop = true
    billboardGui.Size = UDim2.new(0, 200, 0, 50) -- Adjust size as needed
    billboardGui.StudsOffset = Vector3.new(0, 3, 0) -- Offset above head

    -- Create TextLabel for the tag
    local tagLabel = Instance.new("TextLabel", billboardGui)
    tagLabel.BackgroundTransparency = 1
    tagLabel.Size = UDim2.new(1, 0, 1, 0)
    tagLabel.Font = font
    tagLabel.TextScaled = true -- Adjust text size automatically
    tagLabel.TextColor3 = Color3.new(1, 1, 1) -- White text color
    tagLabel.TextStrokeTransparency = 0.5 -- Semi-transparent text stroke
    tagLabel.ZIndex = 10 -- Ensure it's above other UI

    -- Create Frame for gradient background
    local gradientFrame = Instance.new("Frame", tagLabel)
    gradientFrame.BackgroundTransparency = 1
    gradientFrame.Size = UDim2.new(1, 0, 1, 0)
    gradientFrame.ZIndex = 9 -- Ensure it's behind the text
    gradientFrame.BorderSizePixel = 0 -- No border

    -- Apply gradient to Frame
    local gradient = Instance.new("UIGradient", gradientFrame)
    gradient.Rotation = 90 -- Vertical gradient
    gradient.Color = ColorSequence.new {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), -- Red on the left
        ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) -- White on the right
    }

    -- Create smaller text
    local smallerTextLabel = Instance.new("TextLabel", tagLabel)
    smallerTextLabel.BackgroundTransparency = 1
    smallerTextLabel.Size = UDim2.new(1, 0, 0.5, 0) -- Half of the label
    smallerTextLabel.Position = UDim2.new(0, 0, 0, 0) -- Top aligned
    smallerTextLabel.Text = smallerText
    smallerTextLabel.Font = font
    smallerTextLabel.TextScaled = true -- Adjust text size automatically
    smallerTextLabel.TextColor3 = Color3.new(1, 1, 1) -- White text color
    smallerTextLabel.TextStrokeTransparency = 0.5 -- Semi-transparent text stroke

    -- Create larger text
    local largerTextLabel = Instance.new("TextLabel", tagLabel)
    largerTextLabel.BackgroundTransparency = 1
    largerTextLabel.Size = UDim2.new(1, 0, 0.5, 0) -- Half of the label
    largerTextLabel.Position = UDim2.new(0, 0, 0.5, 0) -- Bottom aligned
    largerTextLabel.Text = largerText
    largerTextLabel.Font = font
    largerTextLabel.TextScaled = true -- Adjust text size automatically
    largerTextLabel.TextColor3 = Color3.new(1, 1, 1) -- White text color
    largerTextLabel.TextStrokeTransparency = 0.5 -- Semi-transparent text stroke

    -- Parent BillboardGui to the player's character
    local character = player.Character or player.CharacterAdded:Wait()
    billboardGui.Parent = character:FindFirstChild("Head") or character:WaitForChild("Head")

    -- Clean up when player leaves
    player.CharacterRemoving:Connect(function()
        if billboardGui then
            billboardGui:Destroy()
        end
    end)
end

-- Check if the player is a developer
local function checkDeveloper(player)
    for _, username in ipairs(developerUsernames) do
        if player.Name:lower() == username:lower() then
            createTag(player)
            break
        end
    end
end

-- Connect the function to new players joining
game.Players.PlayerAdded:Connect(checkDeveloper)

-- Check existing players
for _, player in ipairs(game.Players:GetPlayers()) do
    checkDeveloper(player)
end
