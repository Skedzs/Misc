return function(Library, FuncsV3, notify)
    local CreditsTab = Library:CreateTab({ ["Name"] = "Credits", ["Icon"] = "users" })

    -- // Credits Tab Content
    local DevSection = CreditsTab:AddSection("Development", true)
    FuncsV3:Label(DevSection, "Author - Nadir", "")
    FuncsV3:Label(DevSection, "UI Library - Speed Hub X", "")

    local CommSection = CreditsTab:AddSection("Community", false)
    FuncsV3:Button(CommSection, "Discord Server", "Click to copy invite link.", function()
        if type(setclipboard) == "function" then
            local ok = pcall(setclipboard, "https://discord.gg/Nvhb3EnMDX")
            if ok and notify then
                notify("Credits", "Discord invite link copied to clipboard!")
            elseif notify then
                notify("Error", "Failed to copy invite link to clipboard.")
            end
        else
            if notify then
                notify("Error", "Your executor does not support setclipboard.")
            end
        end
    end)
end