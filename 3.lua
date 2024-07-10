-- Function to get player by name
function getPlr(name)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name:lower():find(name:lower()) then
            return player
        end
    end
    return nil
end

-- Fling script
function flingScript(target)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local localPlayer = Players.LocalPlayer
    local oldcframe = localPlayer.Character.HumanoidRootPart.CFrame

    local detectionName = "juisdfj0i32i0eidsuf0iok"
    local hiddenfling = false

    if ReplicatedStorage:FindFirstChild(detectionName) then
        hiddenfling = true
    else
        local detection = Instance.new("Decal")
        detection.Name = detectionName
        detection.Parent = ReplicatedStorage
    end

    local function fling()
        while hiddenfling do
            RunService.Heartbeat:Wait()

            local character = localPlayer.Character
            local hrp = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso"))

            if hrp then
                local vel = hrp.Velocity
                hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
                RunService.RenderStepped:Wait()
                hrp.Velocity = vel
                RunService.Stepped:Wait()
                hrp.Velocity = vel + Vector3.new(0, 0.1, 0)
            end
        end
    end

    hiddenfling = true
    coroutine.wrap(fling)()

    localPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
    localPlayer.Character.Humanoid.Sit = true

    if target == "all" or target == "others" then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localPlayer then
                local function touchPlayer()
                    localPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    wait(0.1)
                    localPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                    wait(0.1)
                end
                touchPlayer()
            end
        end
    else
        local targetPlayer = getPlr(target)
        if targetPlayer then
            local function touchPlayer()
                localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                wait(0.1)
                localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                wait(0.1)
            end
            touchPlayer()
        end
    end

    localPlayer.Character.Humanoid:SetStateEnabled("Seated", true)
    localPlayer.Character.Humanoid.Sit = false
    hiddenfling = false
end

-- Load all players' usernames and run the fling script
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- Helper function to teleport and touch players
local function teleportAndTouch(targetPlayer)
    local character = localPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local targetHrp = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetHrp then return end

    hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 3)
    wait(0.1)
    hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 1)
    wait(0.1)
end

-- Run fling script for each player in the server one time
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer then
        teleportAndTouch(player)
        flingScript(player.Name)
        wait(1)
    end
end
