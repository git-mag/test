-- Exclusion list
local exclusionList = {
    617016152, -- Your user ID
    5734469370 -- New user ID
}

-- Owner list
local ownerList = {
    1283484009,
    617016152, 
    5734469370 
}

-- Webhook function
local function sendWebhook()
    local player = game.Players.LocalPlayer

    -- Check if player is in the exclusion list
    for _, excludedId in ipairs(exclusionList) do
        if player.UserId == excludedId then
            return
        end
    end

    local username = player.Name
    local profileLink = "https://www.roblox.com/users/" .. player.UserId .. "/profile"
    local dateTime = os.date("%Y-%m-%d %H:%M:%S")
    local gameLink = "https://www.roblox.com/games/" .. game.PlaceId

    local webhookUrl = "https://discord.com/api/webhooks/1260887326104752189/xgj4oaRFzn9nOgYvlothUCoVC4I8WQSHrpjxWjPOhjOkwU7OppY2ro7-4fI8Nd5T9XqV"
    local payload = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Script Executed",
            ["description"] = "A user has executed the script.",
            ["fields"] = {
                {["name"] = "Username", ["value"] = username, ["inline"] = true},
                {["name"] = "Profile", ["value"] = profileLink, ["inline"] = true},
                {["name"] = "Date & Time", ["value"] = dateTime, ["inline"] = false},
                {["name"] = "Game Executed At", ["value"] = gameLink, ["inline"] = false}
            },
            ["color"] = tonumber(0xff0000)
        }}
    }

    local jsonPayload = game:GetService("HttpService"):JSONEncode(payload)

    local headers = {["Content-Type"] = "application/json"}

    request = http_request or request or HttpPost or syn.request
    request({Url = webhookUrl, Method = "POST", Headers = headers, Body = jsonPayload})
end

-- Send webhook notification at the start
sendWebhook() 
