-- Function to fling a player
local function flingPlayer(player)
    -- Replace with your desired fling effect or command
    -- Example: Replace "YOUR_FLING_COMMAND_HERE" with your actual fling command
    game:GetService("TeleportService"):Teleport(player.Character.HumanoidRootPart.Position)
end

-- Function to find and fling all players
local function flingAllPlayers()
    local localPlayer = game.Players.LocalPlayer
    local localRootPart = localPlayer.Character and localPlayer.Character.HumanoidRootPart
    if localRootPart then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= localPlayer then
                flingPlayer(player)
                wait(1)  -- Adjust delay between flings if needed
            end
        end
    end
end

-- Trigger the function when the script runs
flingAllPlayers()

