local function createUIAboveHead(player)
	-- Check if the player's username matches "yarhmplus"
	if player.Name == "yarhmplus" then



		-- Instances:

local Converted = {
	["_BillboardGui"] = Instance.new("BillboardGui");
	["_Frame"] = Instance.new("Frame");
	["_Frame1"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_TextLabel"] = Instance.new("TextLabel");
	["_UIGradient"] = Instance.new("UIGradient");
	["_developer"] = Instance.new("Frame");
	["_UICorner1"] = Instance.new("UICorner");
	["_TextLabel1"] = Instance.new("TextLabel");
	["_UIGradient1"] = Instance.new("UIGradient");
	["_yarhm"] = Instance.new("Frame");
	["_UICorner2"] = Instance.new("UICorner");
	["_TextLabel2"] = Instance.new("TextLabel");
	["_UIGradient2"] = Instance.new("UIGradient");
}

-- Properties:

Converted["_BillboardGui"].Active = true
Converted["_BillboardGui"].AlwaysOnTop = true
Converted["_BillboardGui"].ClipsDescendants = true
Converted["_BillboardGui"].ExtentsOffset = Vector3.new(100, 100, 100)
Converted["_BillboardGui"].LightInfluence = 1
Converted["_BillboardGui"].MaxDistance = 20
Converted["_BillboardGui"].Size = UDim2.new(0, 500, 0, 100)
Converted["_BillboardGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_BillboardGui"].Parent = game.Workspace.R15Rig.Head.HatAttachment

Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Frame"].BackgroundTransparency = 1
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(0, 120, 0, 0)
Converted["_Frame"].Size = UDim2.new(0, 100, 0, 100)
Converted["_Frame"].Parent = Converted["_BillboardGui"]

Converted["_Frame1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Frame1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame1"].BorderSizePixel = 0
Converted["_Frame1"].Position = UDim2.new(0.243936911, 0, 0.597042918, 0)
Converted["_Frame1"].Size = UDim2.new(0, 214, 0, 33)
Converted["_Frame1"].Parent = Converted["_Frame"]

Converted["_UICorner"].Parent = Converted["_Frame1"]

Converted["_TextLabel"].Font = Enum.Font.GothamBold
Converted["_TextLabel"].Text = "joystick531"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextScaled = true
Converted["_TextLabel"].TextSize = 14
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Position = UDim2.new(0.0494966581, 0, 0.129369557, 0)
Converted["_TextLabel"].Size = UDim2.new(0, 203, 0, 24)
Converted["_TextLabel"].Parent = Converted["_Frame1"]

Converted["_UIGradient"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
Converted["_UIGradient"].Parent = Converted["_Frame1"]

Converted["_developer"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_developer"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_developer"].BorderSizePixel = 0
Converted["_developer"].Position = UDim2.new(1.65100002, 0, -0.0130000003, 0)
Converted["_developer"].Size = UDim2.new(0, 134, 0, 29)
Converted["_developer"].Name = "developer"
Converted["_developer"].Parent = Converted["_Frame"]

Converted["_UICorner1"].Parent = Converted["_developer"]

Converted["_TextLabel1"].Font = Enum.Font.GothamBold
Converted["_TextLabel1"].Text = "Developer"
Converted["_TextLabel1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].TextScaled = true
Converted["_TextLabel1"].TextSize = 14
Converted["_TextLabel1"].TextWrapped = true
Converted["_TextLabel1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].BackgroundTransparency = 1
Converted["_TextLabel1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel1"].BorderSizePixel = 0
Converted["_TextLabel1"].Position = UDim2.new(0.0214597788, 0, 0.0729446411, 0)
Converted["_TextLabel1"].Size = UDim2.new(0, 131, 0, 24)
Converted["_TextLabel1"].Parent = Converted["_developer"]

Converted["_UIGradient1"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
Converted["_UIGradient1"].Parent = Converted["_developer"]

Converted["_yarhm"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_yarhm"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_yarhm"].BorderSizePixel = 0
Converted["_yarhm"].Position = UDim2.new(-0.200000003, 0, -0.0130000003, 0)
Converted["_yarhm"].Size = UDim2.new(0, 134, 0, 29)
Converted["_yarhm"].Name = "yarhm"
Converted["_yarhm"].Parent = Converted["_Frame"]

Converted["_UICorner2"].Parent = Converted["_yarhm"]

Converted["_TextLabel2"].Font = Enum.Font.GothamBold
Converted["_TextLabel2"].Text = "YARHM"
Converted["_TextLabel2"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel2"].TextScaled = true
Converted["_TextLabel2"].TextSize = 14
Converted["_TextLabel2"].TextWrapped = true
Converted["_TextLabel2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel2"].BackgroundTransparency = 1
Converted["_TextLabel2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel2"].BorderSizePixel = 0
Converted["_TextLabel2"].Position = UDim2.new(0.0214597788, 0, 0.0729449019, 0)
Converted["_TextLabel2"].Size = UDim2.new(0, 131, 0, 24)
Converted["_TextLabel2"].Parent = Converted["_yarhm"]

Converted["_UIGradient2"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
Converted["_UIGradient2"].Parent = Converted["_yarhm"]

		}
		end
		end

		local function checkExistingPlayers()
	for _, player in ipairs(game.Players:GetPlayers()) do
		createUIAboveHead(player)
	end
end

-- Monitor when a player is added to the game
game.Players.PlayerAdded:Connect(function(player)
	createUIAboveHead(player)
end)

-- Check for existing players when the script starts
checkExistingPlayers()

