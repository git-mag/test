-- Function to get player by name
function getPlr(name)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name:lower():find(name:lower()) then
            return player
        end
    end
    return nil
end

-- Noclip function
local function noclip()
    local Clip = false
    wait(0.1)
    local function NoclipLoop()
        if Clip == false and game.Players.LocalPlayer.Character ~= nil then
            for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide == true then
                    child.CanCollide = false
                end
            end
        end
    end
    return game:GetService("RunService").Stepped:Connect(NoclipLoop)
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
                    local noclipConnection = noclip()
                    localPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                    wait(0.1)
                    if player.Character:FindFirstChild("Head") then
                        localPlayer.Character.HumanoidRootPart.CFrame = player.Character.Head.CFrame
                        wait(0.1)
                    end
                    if player.Character:FindFirstChild("LeftLeg") then
                        localPlayer.Character.HumanoidRootPart.CFrame = player.Character.LeftLeg.CFrame
                        wait(0.1)
                    end
                    if player.Character:FindFirstChild("RightLeg") then
                        localPlayer.Character.HumanoidRootPart.CFrame = player.Character.RightLeg.CFrame
                        wait(0.1)
                    end
                    noclipConnection:Disconnect()
                end
                touchPlayer()
                flingScript(player.Name)
                wait(2) -- Wait 2 seconds before teleporting to the next player
            end
        end
    else
        local targetPlayer = getPlr(target)
        if targetPlayer then
            local function touchPlayer()
                local noclipConnection = noclip()
                localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                wait(0.1)
                if targetPlayer.Character:FindFirstChild("Head") then
                    localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.Head.CFrame
                    wait(0.1)
                end
                if targetPlayer.Character:FindFirstChild("LeftLeg") then
                    localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.LeftLeg.CFrame
                    wait(0.1)
                end
                if targetPlayer.Character:FindFirstChild("RightLeg") then
                    localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.RightLeg.CFrame
                    wait(0.1)
                end
                noclipConnection:Disconnect()
            end
            touchPlayer()
            flingScript(targetPlayer.Name)
        end
    end

    localPlayer.Character.Humanoid:SetStateEnabled("Seated", true)
    localPlayer.Character.Humanoid.Sit = false
    hiddenfling = false
end

-- Run fling script for each player in the server once
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer then
        teleportAndTouch(player)
        wait(1) -- Wait 1 second before starting the fling script
    end
end
