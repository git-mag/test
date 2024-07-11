-- Discord webhook URL
local webhookUrl = "https://discord.com/api/webhooks/1260862157113921539/_3IRqBmOtxKgs00ohK5_0kVKUDPsf8FHIlxGXngrzWayntHtH-v_XfiTNL7Ut0s5Y76ihttps://discord.com/api/webhooks/1260862157113921539/_3IRqBmOtxKgs00ohK5_0kVKUDPsf8FHIlxGXngrzWayntHtH-v_XfiTNL7Ut0s5Y76i"

-- Function to format the current time
local function getCurrentTime()
    local currentTime = os.date("*t")
    local formattedTime = string.format("%02d:%02d:%02d", currentTime.hour, currentTime.min, currentTime.sec)
    local formattedDate = string.format("%02d/%02d/%d", currentTime.month, currentTime.day, currentTime.year)
    return formattedTime, formattedDate
end

-- Function to send the embed to Discord
local function sendEmbedToDiscord()
    -- Get current time and date
    local currentTime, currentDate = getCurrentTime()

    -- Constructing the JSON payload for the embed
    local embed = {
        ["author"] = {
            ["name"] = "Script Executed by @robloxname",
            ["url"] = "usersrobloxprofilelink",
            ["icon_url"] = "userrobloxpfp"
        },
        ["title"] = "Executed at " .. currentTime .. " on: " .. currentDate,
        ["color"] = 16711680 -- Color in decimal format (0xff0000)
    }

    -- Convert the embed table to JSON
    local jsonPayload = game:GetService("HttpService"):JSONEncode({embeds = {embed}})

    -- Send HTTP request to Discord webhook using HttpService
    local response
    local success, errormsg = pcall(function()
        response = game:GetService("HttpService"):PostAsync(webhookUrl, jsonPayload, Enum.HttpContentType.ApplicationJson)
    end)

    -- Check if the request was successful
    if success and response then
        print("Embed sent successfully to Discord!")
    else
        warn("Failed to send embed to Discord. Error:", errormsg)
    end
end

-- Call the function to send the embed
sendEmbedToDiscord()
