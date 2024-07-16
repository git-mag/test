local tagsFolder = Instance.new("Folder", script.Parent)
tagsFolder.Name = "TagsFolder"

local Players = game:GetService("Players")

local usernameColors = {
    ["XxxS_omeonexxX"] = Color3.fromHex("#f48fff"),
    ["Dextacular"] = Color3.fromHex("#f48fff"),
    ["yarhmplus"] = Color3.fromHex("#f48fff"),
    ["joystick531"] = Color3.fromHex("#ff0000"),
    ["givepetroblox"] = Color3.fromHex("#ff0000"),
    ["Bubberbolf"] = Color3.fromHex("#0030ff"),
}

local specialUsernameColors = {
    ["Joy58293"] = Color3.fromHex("#ffac33"),
    ["mrbeast96234"] = Color3.fromHex("#ffac33"),
    ["jimmmm"] = Color3.fromHex("#ffac33"),
}

local mainText = "YARHM Developer"
local mainFont = Enum.Font.GothamBold
local specialText = "YARHM+"
local specialFont = Enum.Font.GothamBold

local function createTextLabel(player, text, color)
    local head = player.Character and player.Character:FindFirstChild("Head")
    if head then
        -- Remove any existing tags to avoid duplicates
        local existingTag = head:FindFirstChild("DeveloperTag") or head:FindFirstChild("SpecialTag")
        if existingTag then
            existingTag:Destroy()
        end

        local mainTextLabel = Instance.new("BillboardGui")
        mainTextLabel.Parent = tagsFolder
        mainTextLabel.Name = text == mainText and "DeveloperTag" or "SpecialTag"
        mainTextLabel.Size = UDim2.new(5, 0, 1, 0)
        mainTextLabel.StudsOffset = Vector3.new(0, 2, 0)
        mainTextLabel.Adornee = head
        mainTextLabel.AlwaysOnTop = false
        mainTextLabel.MaxDistance = math.huge
        mainTextLabel.LightInfluence = 0
        if player.Name == "joystick531" then
            mainTextLabel.Brightness = 5
        end

        local mainTextElement = Instance.new("TextLabel")
        mainTextElement.Size = UDim2.new(1, 0, 1, 0)
        mainTextElement.Text = text
        mainTextElement.TextColor3 = color
        mainTextElement.BackgroundTransparency = 1
        mainTextElement.Font = mainFont
        mainTextElement.TextScaled = true
        mainTextElement.Parent = mainTextLabel
    end
end

local function showWelcomeMessage(player, color)
    local welcomeMessage = Instance.new("TextLabel")
    welcomeMessage.Parent = tagsFolder
    welcomeMessage.Size = UDim2.new(0.3, 0, 0.1, 0)
    welcomeMessage.Position = UDim2.new(0.35, 0, 0, 0)
    welcomeMessage.Text = player.Name .. " has joined the game!"
    welcomeMessage.TextColor3 = color
    welcomeMessage.BackgroundTransparency = 1
    welcomeMessage.Font = mainFont
    welcomeMessage.TextScaled = true

    task.wait(10)
    welcomeMessage:Destroy()
end

local function checkForPlayer(player)
    if usernameColors[player.Name] then
        createTextLabel(player, mainText, usernameColors[player.Name])
        showWelcomeMessage(player, usernameColors[player.Name])
    elseif specialUsernameColors[player.Name] then
        createTextLabel(player, specialText, specialUsernameColors[player.Name])
    end
end

local function onCharacterAdded(player)
    player.CharacterAdded:Connect(function(character)
        -- Wait for 10 seconds before reapplying the tag
        task.wait(10)
        checkForPlayer(player)
    end)
end

local function handlePlayer(player)
    checkForPlayer(player)
    onCharacterAdded(player)
end

for _, player in ipairs(Players:GetPlayers()) do
    handlePlayer(player)
end

Players.PlayerAdded:Connect(handlePlayer)

table.insert(module, {
    Type = "Toggle",
    Args = {"Hide YARHM+/Developer tags", function(Self, state)
        for _, tag in ipairs(tagsFolder:GetChildren()) do
            tag.Enabled = not state
        end
    end,}
})
