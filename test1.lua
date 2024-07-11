-- LuaSocket library for HTTP requests
local socket = require("socket")
local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require("json")

-- Discord webhook URL
local webhookUrl = "https://discord.com/api/webhooks/1260862157113921539/_3IRqBmOtxKgs00ohK5_0kVKUDPsf8FHIlxGXngrzWayntHtH-v_XfiTNL7Ut0s5Y76i"

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
        ["color"] = tonumber(0xff0000) -- Convert color hex to decimal
    }

    -- Convert the embed table to JSON
    local jsonPayload = json.encode({embeds = {embed}})

    -- HTTP request to Discord webhook
    local response_body = {}
    local res, code, response_headers = http.request {
        url = webhookUrl,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json",
            ["Content-Length"] = #jsonPayload
        },
        source = ltn12.source.string(jsonPayload),
        sink = ltn12.sink.table(response_body)
    }

    -- Check if the request was successful
    if code == 200 then
        print("Embed sent successfully to Discord!")
    else
        print("Failed to send embed to Discord. Response code:", code)
    end
end

-- Call the function to send the embed
sendEmbedToDiscord()
