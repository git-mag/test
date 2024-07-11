local usernameColors = {
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

local specialUsernamesURL = "https://raw.githubusercontent.com/git-mag/test/main/names.txt"

local function createTextLabel(player, text, color)
    local head = player.Character and player.Character:FindFirstChild("Head")
    if head then
        -- Remove any existing tags to avoid duplicates
        local existingTag = head:FindFirstChild("DeveloperTag")
        if existingTag then
            existingTag:Destroy()
        end
        
        local mainTextLabel = Instance.new("BillboardGui")
        mainTextLabel.Parent = tagsFolder
        mainTextLabel.Name = "DeveloperTag"
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
    player.CharacterAdded:Connect(function(character)
        -- Wait for 10 seconds before reapplying the tag
        task.wait(10)
        checkForPlayer(player, specialUsernames)
    end)
end

fetchSpecialUsernames(function(specialUsernames)
    local function handlePlayer(player)
        checkForPlayer(player, specialUsernames)
        onCharacterAdded(player, specialUsernames)
    end

    for _, player in ipairs(Players:GetPlayers()) do
        handlePlayer(player)
    end

    Players.PlayerAdded:Connect(handlePlayer)
end)
