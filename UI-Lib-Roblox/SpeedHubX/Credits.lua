return function(Library, FuncsV3, notify)
    local CreditsTab = Library:CreateTab({ ["Name"] = "Credits", ["Icon"] = "users" })

    -- // Credits Tab Content
    local DevSection = CreditsTab:AddSection("Development", true)
    FuncsV3:Label(DevSection, "Author - Nadir", "")
    FuncsV3:Label(DevSection, "UI Library - Speed Hub X", "")

    local CommSection = CreditsTab:AddSection("Community", false)
    FuncsV3:Button(CommSection, "Discord Server", "Click to copy invite link.", function()
        if setclipboard then
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Skedzs/Misc/refs/heads/main/Credits/DiscordServer"))()
            end)
            if notify then notify("Credits", "Discord invite link copied to clipboard!") end
        else
            if notify then notify("Error", "Your executor does not support setclipboard.") end
        end
    end)
end