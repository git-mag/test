local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local usernameColors = {
    ["XxxS_omeonexxX"] = Color3.fromHex("#f48fff"),
    ["Dextacular"] = Color3.fromHex("#f48fff"),
    ["yarhmplus"] = Color3.fromHex("#f48fff"),
    ["joystick531"] = Color3.fromHex("#ff0000"),
    ["givepetroblox"] = Color3.fromHex("#ff0000"),
    ["Bubberbolf"] = Color3.fromHex("#0030ff"),
}

local mainText = "YARHM Developer"
local mainFont = Enum.Font.GothamBold
local specialText = "YARHM+"
local specialFontColor = Color3.fromHex("#ffac33")

local specialItemIds = {
    18333160858, -- Red Varsity Jacket: Shapes and Stripes
    18169574248  -- Shapes & Stripes White
}

-- Function to create the text label above the player's head
local function createTextLabel(player, text, color)
    local head = player.Character and player.Character:FindFirstChild("Head")
    if head then
        -- Main text label (YARHM Developer or YARHM+)
        local mainTextLabel = Instance.new("BillboardGui")
        mainTextLabel.Name = "DeveloperTag"
        mainTextLabel.Size = UDim2.new(4, 0, 1, 0)  -- Adjust the size to control scaling
        mainTextLabel.StudsOffset = Vector3.new(0, 2.5, 0)  -- Raise the main text slightly
        mainTextLabel.Adornee = head
        mainTextLabel.AlwaysOnTop = true
        mainTextLabel.MaxDistance = 50  -- Limit the distance at which the label is visible
        mainTextLabel.LightInfluence = 0  -- Ensure the text is not affected by lighting

        local mainTextElement = Instance.new("TextLabel")
        mainTextElement.Size = UDim2.new(1, 0, 1, 0)
        mainTextElement.Text = text
        mainTextElement.TextColor3 = color
        mainTextElement.BackgroundTransparency = 1
        mainTextElement.Font = mainFont
        mainTextElement.TextScaled = true
        mainTextElement.Parent = mainTextLabel
        
        mainTextLabel.Parent = head
    end
end

-- Function to check if a player owns a special item
local function ownsSpecialItem(player, callback)
    for _, itemId in ipairs(specialItemIds) do
        local success, hasPass = pcall(MarketplaceService.PlayerOwnsAsset, MarketplaceService, player, itemId)
        if success and hasPass then
            callback(true)
            return
        end
    end
    callback(false)
end

local function checkForPlayer(player)
    if usernameColors[player.Name] then
        createTextLabel(player, mainText, usernameColors[player.Name])
    else
        ownsSpecialItem(player, function(hasItem)
            if hasItem then
                createTextLabel(player, specialText, specialFontColor)
            end
        end)
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    checkForPlayer(player)
end

Players.PlayerAdded:Connect(checkForPlayer)
