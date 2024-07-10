local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to handle noclip
local function enableNoclip()
    LocalPlayer.Character.Humanoid:ChangeState(11) -- 11 is the "NoPhysics" state
    LocalPlayer.Character.Humanoid:UnequipTools()
    LocalPlayer.Character.Head.CanCollide = false
    LocalPlayer.Character.UpperTorso.CanCollide = false
    LocalPlayer.Character.LowerTorso.CanCollide = false
    LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end

local function disableNoclip()
    LocalPlayer.Character.Humanoid:ChangeState(8) -- Revert to "GettingUp" state to reset collisions
    LocalPlayer.Character.Head.CanCollide = true
    LocalPlayer.Character.UpperTorso.CanCollide = true
    LocalPlayer.Character.LowerTorso.CanCollide = true
    LocalPlayer.Character.HumanoidRootPart.CanCollide = true
end

local function teleportAndFling(targetPlayer)
    -- Enable noclip before teleporting
    enableNoclip()

    -- Perform the fling teleportation
    local oldCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
    for i = 1, 10 do
        wait(0.017)
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
        wait(0.01)
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
        wait(0.01)
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        wait(0.01)
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
        wait(0.01)
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
        wait(0.01)
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        wait(0.01)
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -1)
        wait(0.01)
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -1)
    end

    LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame

    -- Disable noclip after teleporting
    disableNoclip()
end

-- Main function to teleport to each player
local function teleportToAllPlayers()
    for _, targetPlayer in pairs(Players:GetPlayers()) do
        if targetPlayer ~= LocalPlayer then
            teleportAndFling(targetPlayer)
            wait(2) -- 2 second delay between teleportations
        end
    end
end

-- Call the main function
teleportToAllPlayers()

