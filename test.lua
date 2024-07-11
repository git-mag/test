-- Define your Discord webhook URL
local webhookUrl = "https://discord.com/api/webhooks/1260862157113921539/_3IRqBmOtxKgs00ohK5_0kVKUDPsf8FHIlxGXngrzWayntHtH-v_XfiTNL7Ut0s5Y76i"

-- Function to format the current time
local function getCurrentTime()
    local currentTime = os.date("*t")
    local formattedTime = string.format("%02d:%02d:%02d", currentTime.hour, currentTime.min, currentTime.sec)
    local formattedDate = string.format("%02d/%02d/%d", currentTime.month, currentTime.day, currentTime.year)
    return formattedTime, formattedDate
end

-- Function to get the executing player's information
local function getPlayerInformation()
    local player = game.Players.LocalPlayer -- Assuming this script runs on the client side
    if player then
        return {
            name = player.Name,
            profileLink = "https://www.roblox.com/users/" .. player.UserId .. "/profile",
            profilePicture = player.Character and player.Character.Head and player.Character.Head:GetAttribute("HeadImage") or "" -- Adjust this to get the actual profile picture URL
        }
    else
        return {
            name = "Unknown",
            profileLink = "",
            profilePicture = ""
        }
    end
end

-- Function to send the embed to Discord
local function sendEmbedToDiscord()
    -- Get current time and date
    local currentTime, currentDate = getCurrentTime()

    -- Get player information
    local playerInfo = getPlayerInformation()

    -- Constructing the JSON payload for the embed
    local embed = {
        ["author"] = {
            ["name"] = "Script Executed by @" .. playerInfo.name,
            ["url"] = playerInfo.profileLink,
            ["icon_url"] = playerInfo.profilePicture
        },
        ["title"] = "Executed at " .. currentTime .. " on: " .. currentDate,
        ["color"] = tonumber(0xff0000) -- Convert color hex to decimal
    }

    -- Convert the embed table to JSON
    local json = game.HttpService:JSONEncode({ ["embeds"] = { embed } })

    -- Send the HTTP request to Discord webhook
    local response = game.HttpService:PostAsync(webhookUrl, json, Enum.HttpContentType.ApplicationJson)

    -- Check if the request was successful
    if response and response == "{}" then
        print("Embed sent successfully to Discord!")
    else
        warn("Failed to send embed to Discord. Response:", response)
    end
end

-- Call the function to send the embed
sendEmbedToDiscord()
