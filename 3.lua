-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Noclip variables
local Clip = true
local Noclipping = nil
local floatName = "FloatingName"

-- Fling variables
local hiddenfling = false
local oldCFrame

-- Teleport variables
local currentIndex = 0
local allPlayers = {}

local function getRoot(char)
    local rootPart = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
    return rootPart
end

local function noclip()
    Clip = false
    wait(0.1)
    local function NoclipLoop()
        if Clip == false and Players.LocalPlayer.Character ~= nil then
            for _, child in pairs(Players.LocalPlayer.Character:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                    child.CanCollide = false
                end
            end
        end
    end
    Noclipping = RunService.Stepped:Connect(NoclipLoop)
end

local function clip()
    if Noclipping then
        Noclipping:Disconnect()
    end
    Clip = true
end

local function toggleNoclip()
    if Clip then
        noclip()
    else
        clip()
    end
end

-- Function to toggle the fling behavior
local function toggleFling()
    hiddenfling = not hiddenfling
    if hiddenfling then
        -- Save the initial position of the player
        oldCFrame = Players.LocalPlayer.Character.HumanoidRootPart.CFrame

        -- Function to perform the fling repeatedly while fling is active
        local function fling()
            local hrp, c, vel, movel = nil, nil, nil, 0.1
            while hiddenfling do
                RunService.Heartbeat:Wait()
                local lp = Players.LocalPlayer
                while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
                    RunService.Heartbeat:Wait()
                    c = lp.Character
                    hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
                end
                if hiddenfling then
                    -- Fling logic
                    vel = hrp.Velocity
                    hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
                    RunService.RenderStepped:Wait()
                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel
                    end
                    RunService.Stepped:Wait()
                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel + Vector3.new(0, movel, 0)
                        movel = movel * -1
                    end
                end
            end
        end
        -- Start the fling function
        fling()
    else
        -- Restore the player to their original position
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame
    end
end

-- Function to teleport to each player in the game once
local function teleportToAllPlayers()
    -- Reset the list of players and current index
    allPlayers = Players:GetPlayers()

    -- Remove the local player from the list of players to teleport to
    for i, player in ipairs(allPlayers) do
        if player == Players.LocalPlayer then
            table.remove(allPlayers, i)
            break
        end
    end

    -- Iterate through all players and teleport to each one
    local function teleportToNextPlayer()
        currentIndex = currentIndex + 1
        if currentIndex > #allPlayers then
            print("Teleported to all players.")
            return
        end

        local targetPlayer = allPlayers[currentIndex]
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetRootPart = targetPlayer.Character.HumanoidRootPart
            local localPlayerRootPart = getRoot(Players.LocalPlayer.Character)

            if localPlayerRootPart then
                -- Teleport to the target player
                localPlayerRootPart.CFrame = targetRootPart.CFrame
            end
        end

        -- Set a delay before teleporting to the next player
        wait(2)  -- Adjust the delay as needed
        teleportToNextPlayer()
    end

    teleportToNextPlayer()
end

-- Connect toggle functions to key inputs
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.N then
            toggleNoclip()
        elseif input.KeyCode == Enum.KeyCode.F then
            toggleFling()
        elseif input.KeyCode == Enum.KeyCode.T then
            teleportToAllPlayers()
        end
    end
end)

-- Initialize with noclip and fling functionalities
toggleNoclip()
toggleFling()

