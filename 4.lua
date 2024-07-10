if not game:IsLoaded() then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Script loading",
		Text = "Waiting for the game to finish loading!",
		Duration = 5
	})
	game.Loaded:Wait()
end

-- Function to check if a player's name matches the condition
local function checkPlayerName(player)
    return player.Name == "yarhmplus"
end

-- Function to create the BillboardGui above the player's head
local function createBillboard(player)
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Adornee = player.Character:WaitForChild("Head")
    BillboardGui.Size = UDim2.new(0, 150, 0, 50)  -- Adjusted size
    BillboardGui.StudsOffset = Vector3.new(0, 3, 0)  -- Adjusted offset

    local Converted = {
        ["_canadian"] = Instance.new("Frame"),
        ["_developer"] = Instance.new("Frame"),
        ["_UICorner"] = Instance.new("UICorner"),
        ["_TextLabel"] = Instance.new("TextLabel"),
        ["_UIGradient"] = Instance.new("UIGradient"),
        ["_yarhm"] = Instance.new("Frame"),
        ["_UICorner1"] = Instance.new("UICorner"),
        ["_UIGradient1"] = Instance.new("UIGradient"),
        ["_TextLabel1"] = Instance.new("TextLabel"),
        ["_Frame"] = Instance.new("Frame"),
        ["_UICorner2"] = Instance.new("UICorner"),
        ["_TextLabel2"] = Instance.new("TextLabel"),
        ["_UIGradient2"] = Instance.new("UIGradient"),
    }

    -- Properties:
    Converted["_canadian"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_canadian"].BackgroundTransparency = 1
    Converted["_canadian"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Converted["_canadian"].BorderSizePixel = 0
    Converted["_canadian"].Position = UDim2.new(0, 0, -0.2, 0)  -- Adjusted position
    Converted["_canadian"].Size = UDim2.new(1, 0, 0, 100)  -- Adjusted size
    Converted["_canadian"].Name = "canadian"
    Converted["_canadian"].Parent = BillboardGui

    Converted["_developer"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_developer"].BackgroundTransparency = 1
    Converted["_developer"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Converted["_developer"].BorderSizePixel = 0
    Converted["_developer"].Position = UDim2.new(0, 0, 0, 0)
    Converted["_developer"].Size = UDim2.new(1, 0, 0, 25)
    Converted["_developer"].Name = "developer"
    Converted["_developer"].Parent = Converted["_canadian"]

    Converted["_UICorner"].Parent = Converted["_developer"]

    Converted["_TextLabel"].Font = Enum.Font.GothamBold
    Converted["_TextLabel"].Text = "Developer"
    Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_TextLabel"].TextScaled = true
    Converted["_TextLabel"].TextSize = 14
    Converted["_TextLabel"].TextTransparency = 1
    Converted["_TextLabel"].TextWrapped = true
    Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_TextLabel"].BackgroundTransparency = 1
    Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Converted["_TextLabel"].BorderSizePixel = 0
    Converted["_TextLabel"].Position = UDim2.new(0, 0, 0, 0)
    Converted["_TextLabel"].Size = UDim2.new(1, 0, 0, 25)
    Converted["_TextLabel"].Parent = Converted["_developer"]

    Converted["_UIGradient"].Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(0.1764705926179886, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(244.0000006556511, 143.00000667572021, 255))
    }
    Converted["_UIGradient"].Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(1, 1)
    }
    Converted["_UIGradient"].Parent = Converted["_developer"]

    Converted["_yarhm"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_yarhm"].BackgroundTransparency = 1
    Converted["_yarhm"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Converted["_yarhm"].BorderSizePixel = 0
    Converted["_yarhm"].Position = UDim2.new(0, 0, 0.25, 0)  -- Adjusted position
    Converted["_yarhm"].Size = UDim2.new(1, 0, 0, 25)  -- Adjusted size
    Converted["_yarhm"].Name = "yarhm"
    Converted["_yarhm"].Parent = BillboardGui

    Converted["_UICorner1"].Parent = Converted["_yarhm"]

    Converted["_UIGradient1"].Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(244.0000006556511, 143.00000667572021, 255)),
        ColorSequenceKeypoint.new(0.6937716603279114, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }
    Converted["_UIGradient1"].Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(1, 1)
    }
    Converted["_UIGradient1"].Parent = Converted["_yarhm"]

    Converted["_TextLabel1"].Font = Enum.Font.GothamBold
    Converted["_TextLabel1"].Text = "YARHM"
    Converted["_TextLabel1"].TextColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_TextLabel1"].TextScaled = true
    Converted["_TextLabel1"].TextSize = 14
    Converted["_TextLabel1"].TextTransparency = 1
    Converted["_TextLabel1"].TextWrapped = true
    Converted["_TextLabel1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_TextLabel1"].BackgroundTransparency = 1
    Converted["_TextLabel1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Converted["_TextLabel1"].BorderSizePixel = 0
    Converted["_TextLabel1"].Position = UDim2.new(0, 0, 0, 0)
    Converted["_TextLabel1"].Size = UDim2.new(1, 0, 0, 25)
    Converted["_TextLabel1"].Parent = Converted["_yarhm"]

    Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_Frame"].BackgroundTransparency = 1
    Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Converted["_Frame"].BorderSizePixel = 0
    Converted["_Frame"].Position = UDim2.new(0, 0, 0.5, 0)  -- Adjusted position
    Converted["_Frame"].Size = UDim2.new(1, 0, 0, 33)  -- Adjusted size
    Converted["_Frame"].Parent = BillboardGui

    Converted["_UICorner2"].Parent = Converted["_Frame"]

    Converted["_TextLabel2"].Font = Enum.Font.GothamBold
    Converted["_TextLabel2"].Text = "just a canadian"
    Converted["_TextLabel2"].TextColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_TextLabel2"].TextScaled = true
    Converted["_TextLabel2"].TextSize = 14
    Converted["_TextLabel2"].TextTransparency = 1
    Converted["_TextLabel2"].TextWrapped = true
    Converted["_TextLabel2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_TextLabel2"].BackgroundTransparency = 1
    Converted["_TextLabel2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
    Converted["_TextLabel2"].BorderSizePixel = 0
    Converted["_TextLabel2"].Position = UDim2.new(0, 0, 0, 0)
    Converted["_TextLabel2"].Size = UDim2.new(1, 0, 0, 33)  -- Adjusted size
    Converted["_TextLabel2"].Parent = Converted["_Frame"]

    Converted["_UIGradient2"].Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(244.0000006556511, 143.00000667572021, 255)),
        ColorSequenceKeypoint.new(0.6937716603279114, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }
    Converted["_UIGradient2"].Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(1, 1)
    }
    Converted["_UIGradient2"].Parent = Converted["_Frame"]

    -- Clone the UI elements into the BillboardGui
    local ConvertedClone = {}
    for key, instance in pairs(Converted) do
        local clone = instance:Clone()
        clone.Parent = BillboardGui
        ConvertedClone[key] = clone
    end

    -- Adjust positions and parent if needed for each element in ConvertedClone

    BillboardGui.Parent = game:GetService("CoreGui")
end

-- Check each player to see if their name matches and create BillboardGui if true
for _, player in ipairs(game.Players:GetPlayers()) do
    if checkPlayerName(player) then
        createBillboard(player)
    end
end

-- Handle player added event to check and create BillboardGui dynamically
game.Players.PlayerAdded:Connect(function(player)
    if checkPlayerName(player) then
        createBillboard(player)
    end
end)
