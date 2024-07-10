-- Assuming you have the necessary setup and functions defined already

local Players = game:GetService("Players")

local function flingPlayer(player)
    local oldcframe = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local target = player.Character.HumanoidRootPart.CFrame
    
    -- Perform the fling effect
    for i = 1, 10 do
        wait(0.017)
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target * CFrame.new(0, 0, 4)
        wait(0.01)
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target * CFrame.new(0, 0, -2)
        wait(0.01)
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target
        wait(0.01)
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target * CFrame.new(0, 0, -3)
        wait(0.01)
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target * CFrame.new(0, 0, 2)
        wait(0.01)
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target
        wait(0.01)
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target * CFrame.new(0, 0, -1)
        wait(0.01)
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target * CFrame.new(0, 0, -1)
    end
    
    -- Restore original position
    wait(0.3)
    Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
end

-- Function to fling all players
local function flingAllPlayers()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            flingPlayer(player)
        end
    end
end

-- Example usage:
flingAllPlayers()

