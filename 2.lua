-- Place this script in a LocalScript inside a part (e.g., StarterPlayerScripts)

local Players = game:GetService("Players")
local usernameToHighlight = "yarhmplus"  -- Change this to the username you want to highlight
local textAboveHead = "YARHM Developer"
local font = Enum.Font.GothamBold
local textColor = Color3.new(1, 1, 1)  -- White text color
local gradientColor = ColorSequence.new(Color3.fromRGB(148, 0, 211), Color3.new(0, 0, 0))  -- Purple to black gradient

-- Function to create the text label above the player's head
local function createTextLabel(player)
    local head = player.Character and player.Character:FindFirstChild("Head")
    if head then
        local textLabel = Instance.new("BillboardGui")
        textLabel.Name = "DeveloperTag"
        textLabel.Size = UDim2.new(0, 200, 0, 50)
        textLabel.StudsOffset = Vector3.new(0, 3, 0)
        textLabel.Adornee = head
        textLabel.AlwaysOnTop = true
        
        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1, 0, 1, 0)
        text.Text = textAboveHead
        text.TextColor3 = textColor
        text.BackgroundTransparency = 1
        text.Font = font
        text.TextScaled = true
        text.Parent = textLabel
        
        local gradient = Instance.new("UIGradient")
        gradient.Rotation = 90
        gradient.Color = gradientColor
        gradient.Parent = text
        
        textLabel.Parent = player.Character.Head
    end
end

-- Check if the player with the specified username is in the game
local function checkForPlayer()
    local player = Players:FindFirstChild(usernameToHighlight)
    if player then
        createTextLabel(player)
    end
end

-- Run the check initially and whenever a player joins
checkForPlayer()
Players.PlayerAdded:Connect(checkForPlayer)
