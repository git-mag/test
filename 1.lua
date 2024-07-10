-- Function to create the UI above the player's head
local function createUIAboveHead(player)
    -- Check if the player's username matches "yarhmplus"
    if player.Name == "yarhmplus" then
        -- Create the main frame above the head
        local imperialFrame = Instance.new("Frame")
        imperialFrame.Name = "imperial"
        imperialFrame.Size = UDim2.new(0, 300, 0, 100) -- Adjust size as needed
        imperialFrame.BackgroundTransparency = 1
        imperialFrame.Position = UDim2.new(0, 0, 1, 0) -- Above the head
        imperialFrame.Parent = player.Character.Head

        -- Create the YARHM frame
        local yarhmFrame = Instance.new("Frame")
        yarhmFrame.Name = "yarhm"
        yarhmFrame.Size = UDim2.new(0, 134, 0, 29)
        yarhmFrame.Position = UDim2.new(0.063, 0, 0.124, 0)
        yarhmFrame.BackgroundTransparency = 1
        yarhmFrame.Parent = imperialFrame

        local yarhmUICorner = Instance.new("UICorner")
        yarhmUICorner.CornerRadius = UDim.new(0, 8)
        yarhmUICorner.Parent = yarhmFrame

        local yarhmUIGradient = Instance.new("UIGradient")
        yarhmUIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
        yarhmUIGradient.Parent = yarhmFrame

        local yarhmTextLabel = Instance.new("TextLabel")
        yarhmTextLabel.Text = "YARHM"
        yarhmTextLabel.TextColor3 = Color3.new(1, 1, 1)
        yarhmTextLabel.Font = Enum.Font.GothamBold
        yarhmTextLabel.TextScaled = true
        yarhmTextLabel.TextStrokeTransparency = 1
        yarhmTextLabel.Size = UDim2.new(0, 134, 0, 29)
        yarhmTextLabel.Position = UDim2.new(0, 0, 0, 0)
        yarhmTextLabel.Parent = yarhmFrame

        -- Create the Developer frame
        local developerFrame = Instance.new("Frame")
        developerFrame.Name = "developer"
        developerFrame.Size = UDim2.new(0, 134, 0, 29)
        developerFrame.Position = UDim2.new(0.523, 0, 0.124, 0)
        developerFrame.BackgroundTransparency = 1
        developerFrame.Parent = imperialFrame

        local developerUICorner = Instance.new("UICorner")
        developerUICorner.CornerRadius = UDim.new(0, 8)
        developerUICorner.Parent = developerFrame

        local developerUIGradient = Instance.new("UIGradient")
        developerUIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
        developerUIGradient.Parent = developerFrame

        local developerTextLabel = Instance.new("TextLabel")
        developerTextLabel.Text = "Developer"
        developerTextLabel.TextColor3 = Color3.new(1, 1, 1)
        developerTextLabel.Font = Enum.Font.GothamBold
        developerTextLabel.TextScaled = true
        developerTextLabel.TextStrokeTransparency = 1
        developerTextLabel.Size = UDim2.new(0, 134, 0, 29)
        developerTextLabel.Position = UDim2.new(0, 0, 0, 0)
        developerTextLabel.Parent = developerFrame

        -- Create the Name frame
        local nameFrame = Instance.new("Frame")
        nameFrame.Name = "name"
        nameFrame.Size = UDim2.new(0, 214, 0, 33)
        nameFrame.Position = UDim2.new(0.178, 0, 0.494, 0)
        nameFrame.BackgroundTransparency = 1
        nameFrame.Parent = imperialFrame

        local nameUICorner = Instance.new("UICorner")
        nameUICorner.CornerRadius = UDim.new(0, 8)
        nameUICorner.Parent = nameFrame

        local nameUIGradient = Instance.new("UIGradient")
        nameUIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
        nameUIGradient.Parent = nameFrame

        local nameTextLabel = Instance.new("TextLabel")
        nameTextLabel.Text = player.Name
        nameTextLabel.TextColor3 = Color3.new(1, 1, 1)
        nameTextLabel.Font = Enum.Font.GothamBold
        nameTextLabel.TextScaled = true
        nameTextLabel.TextStrokeTransparency = 1
        nameTextLabel.Size = UDim2.new(0, 214, 0, 33)
        nameTextLabel.Position = UDim2.new(0, 0, 0, 0)
        nameTextLabel.Parent = nameFrame
    end
end

-- Monitor when a player is added to the game
game.Players.PlayerAdded:Connect(function(player)
    -- Call the function to create the UI above the player's head
    createUIAboveHead(player)
end)

-- Check for existing players when the script starts
for _, player in ipairs(game.Players:GetPlayers()) do
    createUIAboveHead(player)
end
