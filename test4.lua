-- Discord webhook URL
local WEBHOOK_URL = "https://discord.com/api/webhooks/1260867644974829652/lSzO_J8XfbJ8FI1rlQCAruzPOrpT8prcIX9pwjgLhq9K43lH1d2qOJ4QR8ifIgSKMZ7Y"


-- Function to send HTTP request to Discord webhook
local function sendToDiscord(embed)
    local data = {
        ["embeds"] = {embed}
    }

    local headers = {
        ["Content-Type"] = "application/json"
    }

    -- Make HTTP request using Roblox HttpService
    local success, response = pcall(function()
        return game:GetService("HttpService"):PostAsync(WEBHOOK_URL, game:GetService("HttpService"):JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("Embed sent to Discord successfully.")
    else
        warn("Failed to send embed to Discord:", response)
    end
end

-- Function to get current PDT time in military format
local function getCurrentPDTTime()
    local pdtOffset = -7  -- PDT offset from UTC is -7 hours
    local currentTime = os.time() + (pdtOffset * 3600)
    return os.date("!%H:%M:%S on %m/%d/%Y", currentTime)
end

-- Function to execute the script
local function executeScript()
    -- Replace these variables with actual Roblox user information
    local robloxName = game.Players.LocalPlayer.Name
    local robloxProfileLink = "https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile"
    local robloxProfilePicture = "https://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&userid=" .. game.Players.LocalPlayer.UserId  -- Example URL, replace with your method to fetch profile picture

    local embed = {
        ["author"] = {
            ["name"] = "Script Executed by @" .. robloxName,
            ["url"] = robloxProfileLink,
            ["icon_url"] = robloxProfilePicture
        },
        ["title"] = "Executed at " .. getCurrentPDTTime(),
        ["color"] = 16711680  -- #ff0000 in decimal
    }

    sendToDiscord(embed)
end

-- Execute the script
executeScript()
