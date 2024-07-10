if not game:IsLoaded() then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Script loading",
		Text = "Waiting for the game to finish loading!",
		Duration = 5
	})
	game.Loaded:Wait()
end

game.Players.PlayerAdded:Connect(function(player)
	local username = player.Name

	if username == "yarhmplus" or username == "joystick581" then
		-- Create BillboardGui
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Size = UDim2.new(0, 400, 0, 150)
		billboardGui.StudsOffset = Vector3.new(0, 3, 0)  -- Adjust the height above the head
		billboardGui.Adornee = player.Character.Head

		-- Create frame to hold UI elements
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, 0, 1, 0)
		frame.BackgroundTransparency = 1
		frame.Parent = billboardGui

		-- Clone and set properties for each UI element
		local converted = {
			["_canadian"] = Instance.new("Frame"),
			["_developer"] = Instance.new("Frame"),
			["_yarhm"] = Instance.new("Frame"),
			["_Frame"] = Instance.new("Frame"),
		}

		-- Properties for _canadian
		converted["_canadian"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		converted["_canadian"].BackgroundTransparency = 1
		converted["_canadian"].BorderColor3 = Color3.fromRGB(0, 0, 0)
		converted["_canadian"].BorderSizePixel = 0
		converted["_canadian"].Position = UDim2.new(0, 0, 0.3, 0)
		converted["_canadian"].Size = UDim2.new(0, 400, 0, 120)
		converted["_canadian"].Name = "canadian"
		converted["_canadian"].Parent = frame

		-- Properties for _developer
		converted["_developer"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		converted["_developer"].BackgroundTransparency = 1
		converted["_developer"].BorderColor3 = Color3.fromRGB(0, 0, 0)
		converted["_developer"].BorderSizePixel = 0
		converted["_developer"].Position = UDim2.new(0.1, 0, 0.1, 0)
		converted["_developer"].Size = UDim2.new(0, 200, 0, 40)
		converted["_developer"].Name = "developer"
		converted["_developer"].Parent = converted["_canadian"]

		local UICorner = Instance.new("UICorner")
		UICorner.Parent = converted["_developer"]

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.Text = "Developer"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14
		TextLabel.TextTransparency = 1
		TextLabel.TextWrapped = true
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(-0.000928280933, 0, 0.0729443803, 0)
		TextLabel.Size = UDim2.new(0, 200, 0, 40)
		TextLabel.Parent = converted["_developer"]

		local UIGradient = Instance.new("UIGradient")
		UIGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(0.1764705926179886, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(244.0000006556511, 143.00000667572021, 255))
		}
		UIGradient.Transparency = NumberSequence.new{
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 1)
		}
		UIGradient.Parent = converted["_developer"]

		-- Properties for _yarhm
		converted["_yarhm"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		converted["_yarhm"].BackgroundTransparency = 1
		converted["_yarhm"].BorderColor3 = Color3.fromRGB(0, 0, 0)
		converted["_yarhm"].BorderSizePixel = 0
		converted["_yarhm"].Position = UDim2.new(0.1, 0, 0.5, 0)
		converted["_yarhm"].Size = UDim2.new(0, 200, 0, 40)
		converted["_yarhm"].Name = "yarhm"
		converted["_yarhm"].Parent = converted["_canadian"]

		local UICorner1 = Instance.new("UICorner")
		UICorner1.Parent = converted["_yarhm"]

		local UIGradient1 = Instance.new("UIGradient")
		UIGradient1.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(244.0000006556511, 143.00000667572021, 255)),
			ColorSequenceKeypoint.new(0.6937716603279114, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
		}
		UIGradient1.Transparency = NumberSequence.new{
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 1)
		}
		UIGradient1.Parent = converted["_yarhm"]

		local TextLabel1 = Instance.new("TextLabel")
		TextLabel1.Font = Enum.Font.GothamBold
		TextLabel1.Text = "YARHM"
		TextLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel1.TextScaled = true
		TextLabel1.TextSize = 14
		TextLabel1.TextTransparency = 1
		TextLabel1.TextWrapped = true
		TextLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel1.BackgroundTransparency = 1
		TextLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel1.BorderSizePixel = 0
		TextLabel1.Position = UDim2.new(-0.000928280933, 0, 0.0729443803, 0)
		TextLabel1.Size = UDim2.new(0, 200, 0, 40)
		TextLabel1.Parent = converted["_yarhm"]

		-- Properties for _Frame
		converted["_Frame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		converted["_Frame"].BackgroundTransparency = 1
		converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
		converted["_Frame"].BorderSizePixel = 0
		converted["_Frame"].Position = UDim2.new(0.1, 0, 0.7, 0)
		converted["_Frame"].Size = UDim2.new(0, 200, 0, 40)
		converted["_Frame"].Name = "Frame"
		converted["_Frame"].Parent = converted["_canadian"]

		local UICorner2 = Instance.new("UICorner")
		UICorner2.Parent = converted["_Frame"]

		local TextLabel2 = Instance.new("TextLabel")
		TextLabel2.Font = Enum.Font.GothamBold
		TextLabel2.Text = "just a canadian "
		TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel2.TextScaled = true
		TextLabel2.TextSize = 14
		TextLabel2.TextTransparency = 1
		TextLabel2.TextWrapped = true
		TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel2.BackgroundTransparency = 1
		TextLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel2.BorderSizePixel = 0
		TextLabel2.Position = UDim2.new(0, 0, 0, 0)
		TextLabel2.Size = UDim2.new(0, 200, 0, 40)
		TextLabel2.Parent = converted["_Frame"]

		local UIGradient2 = Instance.new("UIGradient")
		UIGradient2.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(244.0000006556511, 143.00000667572021, 255)),
			ColorSequenceKeypoint.new(0.6937716603279114, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
		}
		UIGradient2.Transparency = NumberSequence.new{
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 1)
		}
		UIGradient2.Parent = converted["_Frame"]

		-- Parent UI elements to the frame
		for _, instance in pairs(converted) do
			instance.Parent = frame
		end

		-- Parent BillboardGui to player's head
		billboardGui.Parent = player.Character.Head
	end
end)
