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

local serv = win:Server("Phantom Forces", "")

local btns = serv:Channel("Aimbot")

btns:Button(
    "Soon",
    function()
            DiscordLib:Notification("Aimbot", "Soon", "Okay")
    end
)

local vsls = serv:Channel("Visuals")

vsls:Button(
    "Outline ESP",
    function()
        DiscordLib:Notification("Enabled Feature:", "Outline ESP", "Okay")
        -- Settings --

local settings = {
   
    fillcolor = Color3.fromRGB(255, 255, 255);
    filltransparency = .75;
    
    outlinecolor = Color3.fromRGB(255, 255, 255);
    outlinetransparency = 0;
    
 }
 
 -- Script --
 
 local plr = game:service'Players'.LocalPlayer
 local highlights = Instance.new('Folder', game:service'CoreGui')
 
 local function addhighlight(object)
    local highlight = Instance.new('Highlight', highlights)
    highlight.Adornee = object
    
    highlight.FillColor = settings.fillcolor
    highlight.FillTransparency = settings.filltransparency
    
    highlight.OutlineColor = settings.outlinecolor
    highlight.OutlineTransparency = settings.outlinetransparency
    
    highlight.Adornee.Changed:Connect(function()
        if not highlight.Adornee or not highlight.Adornee.Parent then
            highlight:Destroy()    
        end
    end)
    
    return highlight
 end
 
 local function addtoplayer(object)
    if object:IsA'Model' and object.Name == 'Player' and object.Parent.Name ~= tostring(plr.TeamColor) then
        addhighlight(object)
    end
 end
 
 for i,v in pairs(workspace.Players:GetDescendants()) do
    addtoplayer(v)
 end
 
 workspace.Players.DescendantAdded:Connect(function(v)
    addtoplayer(v)
 end)
    end
)

local exp = serv:Channel("Exploit")

exp:Button(
    "Unlock All Weapons",
    function()
            DiscordLib:Notification("Unlock All Weapons", "Successfully Unlocked", "Okay")
            -- made by siper#9938

-- modules
local network, char, loadgun, loadknife; do
    for _, object in next, getgc(true) do
        if (typeof(object) == "table") then
            if (rawget(object, "send")) then
                network = object;
            elseif (rawget(object, "setbasewalkspeed")) then
                char = object;
            end
        elseif (typeof(object) == "function") then
            local name = debug.getinfo(object).name;

            if (name == "loadgun") then
                loadgun = object;
            elseif (name == "loadknife") then
                loadknife = object;
            end
        end
    end
end

-- services
local replicatedStorage = game:GetService("ReplicatedStorage");

-- cache
local content = replicatedStorage:WaitForChild("Content");
local productionContent = content:WaitForChild("ProductionContent");
local attachmentModules = productionContent:WaitForChild("AttachmentModules");
local gunModules = productionContent:WaitForChild("GunModules");

-- stored data
local gunIgnore = {"JUGGUN", "HK417Old", "PAINTBALL GUN", "RAILGUN OLD", "PPK12", "SVK12E", "MG42"};
local weaponData = {};
local attachmentData = {};
local primaryClasses = { "ASSAULT", "BATTLE", "CARBINE", "SHOTGUN", "PDW", "DMR", "LMG", "SNIPER" };
local generalClassData = {
    ["ASSAULT"] = "AK12",
    ["BATTLE"] = "AK12",
    ["CARBINE"] = "M4A1",
    ["SHOTGUN"] = "KSG 12",
    ["PDW"] = "MP5K",
    ["DMR"] = "INTERVENTION",
    ["LMG"] = "COLT LMG",
    ["SNIPER"] = "INTERVENTION",
    ["PISTOL"] = "M9",
    ["MACHINE PISTOL"] = "M9",
    ["REVOLVER"] = "M9",
    ["OTHER"] = "M9",
    ["FRAGMENTATION"] = "M67 FRAG",
    ["HIGH EXPLOSIVE"] = "M67 FRAG",
    ["IMPACT"] = "M67 FRAG",
    ["ONE HAND BLADE"] = "KNIFE",
    ["TWO HAND BLADE"] = "KNIFE",
    ["ONE HAND BLUNT"] = "MAGLITE CLUB",
    ["TWO HAND BLUNT"] = "HOCKEY STICK",
};
local weapons = {};

-- hooks
do
    local oldNetworkSend = network.send; network.send = function(self, name, ...)
        local args = {...};

        if (name == "changewep") then
            weaponData[args[1]] = args[2];
            args[2] = generalClassData[weapons[args[2]].type];
        end

        if (name == "changeatt") then
            attachmentData[args[2]] = args[3];
            return
        end

        return oldNetworkSend(self, name, unpack(args));
    end

    local oldLoadgrenade = char.loadgrenade; char.loadgrenade = function(self, name, ...)
        name = weaponData["Grenade"] or name;
        return oldLoadgrenade(self, name, ...);
    end;

    local oldLoadknife; oldLoadknife = hookfunction(loadknife, function(name, ...)
        name = weaponData["Knife"] or name;
        return oldLoadknife(name, ...);
    end);

    local oldLoadgun; oldLoadgun = hookfunction(loadgun, function(name, magsize, sparerounds, attachments, ...)
        local gunData = weapons[name];
        local newName = table.find(primaryClasses, gunData.type) and weaponData["Primary"] or weaponData["Secondary"];

        name = (newName and newName or name);

        local attachs = attachmentData[name];

        if (attachs) then
            attachments = attachs;
        end

        return oldLoadgun(name, magsize, sparerounds, attachments, ...);
    end);
end

-- init
do
    for _, module in next, gunModules:GetChildren() do
        if (not table.find(gunIgnore, module.Name)) then
            local data = require(module);
            weapons[module.Name] = data;
        end
    end

    for _, module in next, attachmentModules:GetChildren() do
        local data = require(module);
        data.unlockkills = 0;
    end

    for _, module in next, gunModules:GetChildren() do
        if (not table.find(gunIgnore, module.Name)) then
            local data = require(module);
            data.unlockrank = 0;
            data.adminonly = false;
            data.supertest = false;
            data.exclusiveunlock = false;
            data.hideunlessowned = false;
            data.adminonly = false;
        end
    end
end
    end
)

exp:Button(
    "Fly (Press X To Toggle)",
    function()
            DiscordLib:Notification("Enabled Feature:", "Fly", "Okay")
        		local User = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
local GuiService = game:GetService("StarterGui")
local mouse = game.Players.LocalPlayer:GetMouse()

local holdingWKey = false
local holdingSKey = false
local holdingAKey = false
local holdingDKey = false
local holdingSpaceKey = false
local holdingControlKey = false

Speed_1 = -1

mouse.KeyDown:connect(function(key)
   if key == "-" then
       Speed_1 = Speed_1 + 0.2
       
   end
end)

mouse.KeyDown:connect(function(key)
   if key == "=" then
       Speed_1 = Speed_1 - 0.2
       
   end
end)

mouse.KeyDown:connect(function(key)
   if key == "x" then
       if startup  == true then
           startup = false
           
       else
           startup = true
           local brick = Instance.new("Part", workspace)
           brick.Size = Vector3.new(3, 2, 3)
           brick.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -4, 0)
           brick.Transparency = 1
           brick.Anchored = true
           brick.Name = "Brick"
           mouse.KeyDown:connect(function(key)
               if key == "x" then
                   brick:remove()
               end
           end)
           for i = 1, math.huge do
               brick.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -4, 0)
               wait(0)
           end
       end
   end
end)

game:GetService('RunService').Stepped:connect(function()
   if startup then
       if WHeld == true then
         player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,Speed_1)

       end
   end
end)

game:GetService('RunService').Stepped:connect(function()
   if startup then
   if SHeld == true then
        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-Speed_1)
   end
   end
end)

game:GetService('RunService').Stepped:connect(function()
   if startup then
   if AHeld == true then
   player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(Speed_1,0,0)
   end
   end
end)


game:GetService('RunService').Stepped:connect(function()
   if startup then
   if DHeld == true then
   player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(-Speed_1,0,0)
   end
   end
end)


game:GetService('RunService').Stepped:connect(function()
   if startup then
   if SpaceHeld == true then
    player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,-Speed_1,0)
   end
   end
end)

game:GetService('RunService').Stepped:connect(function()
   if startup then
    if ControlHeld == true then
    player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,Speed_1,0)
       end
   end

end)

User.InputBegan:Connect(function(inputObject)
   if(inputObject.KeyCode==Enum.KeyCode.W) then
       holdingWKey = true WHeld = true
   end
   
   if(inputObject.KeyCode==Enum.KeyCode.S) then
       holdingSKey = true SHeld = true
   end

   if(inputObject.KeyCode==Enum.KeyCode.A) then
       holdingAKey = true AHeld = true
   end

   if(inputObject.KeyCode==Enum.KeyCode.D) then
       holdingDKey = true DHeld = true
   end
   if(inputObject.KeyCode==Enum.KeyCode.LeftControl) then
       holdingControlKey = true ControlHeld = true
   end

   if(inputObject.KeyCode==Enum.KeyCode.Space) then
       holdingSpaceKey = true SpaceHeld= true
   end

   if(inputObject.KeyCode==Enum.KeyCode.W) then
       holdingUKey = true WHeld = true
   end
end)

User.InputEnded:Connect(function(inputObject)
   if(inputObject.KeyCode==Enum.KeyCode.W) then
       holdingWKey = false WHeld = false
   end

   if(inputObject.KeyCode==Enum.KeyCode.S) then
       holdingSKey = false SHeld = false    
   end

   if(inputObject.KeyCode==Enum.KeyCode.A) then
       holdingAKey = false AHeld = false    
   end

   if(inputObject.KeyCode==Enum.KeyCode.D) then
       holdingDKey = false DHeld = false    
   end

   if(inputObject.KeyCode==Enum.KeyCode.LeftControl) then
       holdingShiftKey = false ControlHeld = false    
   end

   if(inputObject.KeyCode==Enum.KeyCode.Space) then
       holdingSpaceKey = false SpaceHeld = false
   end
end)
    end
)

exp:Button(
    "Airjump",
    function()
            DiscordLib:Notification("Enabled Feature:", "Airjump", "Okay")
            local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
    end
)

local site = serv:Channel("cheatglobal.com")
