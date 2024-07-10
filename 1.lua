local module = {}
module["gameId"] = 0 -- Restrict module to a certain game ID only. 0 allows all games

module["Name"] = "Player Teleport List"

module[1] = {
    Type = "ButtonGrid",
    Toggleable = false,
    Args = {1, {}}
}

local function updatePlayerList()
    local Players = game:GetService("Players")
    local playerButtons = module[1].Args[2]

    -- Clear existing buttons
    for key in pairs(playerButtons) do
        playerButtons[key] = nil
    end

    -- Add current players
    for _, player in pairs(Players:GetPlayers()) do
        playerButtons[player.Name] = function(Self)
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local playerRoot = Players.LocalPlayer.Character.HumanoidRootPart
                local targetRoot = character.HumanoidRootPart
                playerRoot.CFrame = targetRoot.CFrame
            end
        end
    end
end

local Players = game:GetService("Players")

-- Connect player added/removed events
Players.PlayerAdded:Connect(function()
    updatePlayerList()
end)

Players.PlayerRemoving:Connect(function()
    updatePlayerList()
end)

-- Initial population of the player list
updatePlayerList()

_G.Modules[#_G.Modules + 1] = module
