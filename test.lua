-- Replace this with your RequestBin endpoint URL
local REQUESTBIN_ENDPOINT = "https://eoglcqg1ojy41u5.m.pipedream.net"

-- Function to send HTTP request to RequestBin (which forwards to Discord)
local function sendToRequestBin(embed)
    local data = {
        embeds = {embed}
    }

    local headers = {
        ["Content-Type"] = "application/json"
    }

    local res, err = game:HttpGet({
        Url = REQUESTBIN_ENDPOINT,
        Method = "POST",
        Headers = headers,
        Body = game:GetService("HttpService"):JSONEncode(data)
    })

    if res then
        print("Embed sent to RequestBin successfully.")
    else
        warn("Failed to send embed to RequestBin:", err)
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
        author = {
            name = "Script Executed by @" .. robloxName,
            url = robloxProfileLink,
            icon_url = robloxProfilePicture
        },
        title = "Executed at " .. getCurrentPDTTime(),
        color = 16711680  -- #ff0000 in decimal
    }

    -- Send the embed to RequestBin (which forwards to Discord)
    sendToRequestBin(embed)
end

-- Execute the script
executeScript()

