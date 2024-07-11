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

    -- Delta specific HTTP request function
    local success, response = syn.request({
        Url = WEBHOOK_URL,
        Method = "POST",
        Headers = headers,
        Body = game:GetService("HttpService"):JSONEncode(data)
    })

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
    local robloxProfilePicture = game.Players.LocalPlayer.Character.Head:GetAttribute("ImageId")  -- Replace with actual profile picture URL retrieval method

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

