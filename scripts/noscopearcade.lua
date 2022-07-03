game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "sêx hub loaded",
Text = "www.cheatglobal.com", 

Button1 = "ok",
Duration = 10 
})

wait(1)

local DiscordLib =
    loadstring(game:HttpGet "https://raw.githubusercontent.com/hexress/sex-hub/main/uilib")()

local win = DiscordLib:Window("sêx hub")

local serv = win:Server("No-Scope Arcade", "")

local btns = serv:Channel("Aimbot")

btns:Button(
    "Silent Aim (High Ban Risk)",
    function()
            DiscordLib:Notification("Enabled Feature:", "Silent Aim", "Okay")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hexress/sex-hub/main/scripts/special/Silent%20Aim.lua"))();
    end
)

local vsls = serv:Channel("Visuals")

vsls:Button(
    "Player ESP",
    function()
        DiscordLib:Notification("Enabled Feature:", "Player ESP", "Okay")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hexress/sex-hub/main/scripts/special/Player%20ESP.lua"))();
    end
)

local msc = serv:Channel("Miscellaneous")

msc:Button(
    "Fly (Press X For Toggle)",
    function()
            DiscordLib:Notification("Enabled Feature:", "Fly", "Okay")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hexress/sex-hub/main/scripts/special/Fly.lua"))();
    end
)

msc:Button(
    "Airjump",
    function()
            DiscordLib:Notification("Enabled Feature:", "Airjump", "Okay")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hexress/sex-hub/main/scripts/special/Airjump.lua"))();
    end
)

msc:Button(
    "Noclip",
    function()
            DiscordLib:Notification("Enabled Feature:", "Noclip", "Okay")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hexress/sex-hub/main/scripts/special/Noclip.lua"))();
    end
)

local site = serv:Channel("cheatglobal.com")
