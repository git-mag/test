cmd.add({"flingall"}, {"flingall", "fling all players"}, function(...)
    local oldcframe = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local function flingPlayer(player)
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local vel = hrp.Velocity
            hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
            game:GetService("RunService").RenderStepped:Wait()
            hrp.Velocity = vel
            game:GetService("RunService").Stepped:Wait()
            hrp.Velocity = vel + Vector3.new(0, 0.1, 0)
            wait(0.017)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, 4)
            wait(0.01)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, -2)
            wait(0.01)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame
            wait(0.01)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, -3)
            wait(0.01)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, 2)
            wait(0.01)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame
            wait(0.01)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, -1)
            wait(0.01)
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, -1)
        end
    end
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            flingPlayer(player)
        end
    end
    
    wait(0.3)
    Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
    wait(0.13)
end)
