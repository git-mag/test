local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local usernameColors = {
    ["Xxxs_omeonexxx"] = Color3.fromHex("#ff0000"),
    ["Dextacular"] = Color3.fromHex("#f48fff"),
    ["yarhmplus"] = Color3.fromHex("#ff0000"),
    ["joystick531"] = Color3.fromHex("#ff0000"),
    ["givepetroblox"] = Color3.fromHex("#ff0000"),
    ["Bubberbolf"] = Color3.fromHex("#0030ff"),
}

local mainText = "YARHM Developer"
local mainFont = Enum.Font.GothamBold
local specialText = "YARHM+"
local specialFontColor = Color3.fromHex("#ffac33")

local specialUsernamesURL = "https://raw.githubusercontent.com/git-mag/test/main/names.txt"

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
        if player.Name == "joystick531" then
		mainTextLabel.Brightness = 5

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

-- Function to fetch the special usernames from the remote file
local function fetchSpecialUsernames(callback)
    local success, response = pcall(function()
        return HttpService:GetAsync(specialUsernamesURL)
    end)

    if success then
        local specialUsernames = {}
        for line in response:gmatch("[^\r\n]+") do
            table.insert(specialUsernames, line)
        end
        callback(specialUsernames)
    else
        warn("Failed to fetch special usernames: " .. response)
        callback({})
    end
end

local function checkForPlayer(player, specialUsernames)
    if usernameColors[player.Name] then
        createTextLabel(player, mainText, usernameColors[player.Name])
    elseif table.find(specialUsernames, player.Name) then
        createTextLabel(player, specialText, specialFontColor)
    end
end

local function onCharacterAdded(player, specialUsernames)
    player.CharacterAdded:Connect(function()
        checkForPlayer(player, specialUsernames)
    end)
end

fetchSpecialUsernames(function(specialUsernames)
    for _, player in ipairs(Players:GetPlayers()) do
        checkForPlayer(player, specialUsernames)
        onCharacterAdded(player, specialUsernames)
    end

    Players.PlayerAdded:Connect(function(player)
        checkForPlayer(player, specialUsernames)
        onCharacterAdded(player, specialUsernames)
    end)
end)
