local function createUIAboveHead(player)	
	if player.Name == "yarhmplus" then
		
		local BillboardGui = Instance.new("BillboardGui")
		local Frame = Instance.new("Frame", BillboardGui)
		local Frame1 = Instance.new("Frame", Frame)
		local UICorner = Instance.new("UICorner", Frame1)
		local TextLabel = Instance.new("TextLabel", Frame1)
		local UIGradient = Instance.new("UIGradient", Frame1)
		local developer = Instance.new("Frame", Frame)
		local UICorner1 = Instance.new("UICorner", developer)
		local TextLabel1 = Instance.new("TextLabel", developer)
		local UIGradient1 = Instance.new("UIGradient", developer)
		local yarhm = Instance.new("Frame", Frame)
		local UICorner2 = Instance.new("UICorner", yarhm)
		local TextLabel2 = Instance.new("TextLabel", yarhm)
		local UIGradient2 = Instance.new("UIGradient", yarhm)

		
		BillboardGui.Adornee = player.Character.Head
		BillboardGui.Size = UDim2.new(0, 500, 0, 100)
		BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
		BillboardGui.AlwaysOnTop = true

		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1
		Frame.Size = UDim2.new(0, 100, 0, 100)
		Frame1.Position = UDim2.new(0, 250, 0, 0)
		

		Frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame1.Position = UDim2.new(0.244, 0, 0.597, 0)
		Frame1.Size = UDim2.new(0, 214, 0, 33)

		UICorner.CornerRadius = UDim.new(0, 5)

		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.Text = "joystick531"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14
		TextLabel.TextWrapped = true
		TextLabel.BackgroundTransparency = 1
		TextLabel.Position = UDim2.new(0.05, 0, 0.13, 0)
		TextLabel.Size = UDim2.new(0, 203, 0, 24)

		UIGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
		}

		developer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		developer.BorderColor3 = Color3.fromRGB(0, 0, 0)
		developer.Position = UDim2.new(1.65, 0, -0.013, 0)
		developer.Size = UDim2.new(0, 134, 0, 29)

		UICorner1.CornerRadius = UDim.new(0, 5)

		TextLabel1.Font = Enum.Font.GothamBold
		TextLabel1.Text = "Developer"
		TextLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel1.TextScaled = true
		TextLabel1.TextSize = 14
		TextLabel1.TextWrapped = true
		TextLabel1.BackgroundTransparency = 1
		TextLabel1.Position = UDim2.new(0.02, 0, 0.07, 0)
		TextLabel1.Size = UDim2.new(0, 131, 0, 24)

		UIGradient1.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
		}

		yarhm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		yarhm.BorderColor3 = Color3.fromRGB(0, 0, 0)
		yarhm.Position = UDim2.new(-0.2, 0, -0.013, 0)
		yarhm.Size = UDim2.new(0, 134, 0, 29)

		UICorner2.CornerRadius = UDim.new(0, 5)

		TextLabel2.Font = Enum.Font.GothamBold
		TextLabel2.Text = "YARHM"
		TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel2.TextScaled = true
		TextLabel2.TextSize = 14
		TextLabel2.TextWrapped = true
		TextLabel2.BackgroundTransparency = 1
		TextLabel2.Position = UDim2.new(0.02, 0, 0.07, 0)
		TextLabel2.Size = UDim2.new(0, 131, 0, 24)

		UIGradient2.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
		}

		BillboardGui.Parent = player.Character.Head.HatAttachment
	end
end


local function checkExistingPlayers()
	for _, player in ipairs(game.Players:GetPlayers()) do
		createUIAboveHead(player)
	end
end


game.Players.PlayerAdded:Connect(function(player)
	createUIAboveHead(player)
end)


checkExistingPlayers()
