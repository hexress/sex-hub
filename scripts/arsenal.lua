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

local serv = win:Server("Arsenal", "")

local btns = serv:Channel("Aimbot")

btns:Button(
    "Silent Aim",
    function()
            DiscordLib:Notification("Enabled Feature:", "Silent Aim", "Okay")
        local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local target = false
local RunService = game:GetService("RunService")

local features = {
silentaim = true;
fov = 20000;
}

function getnearest()
local nearestmagnitude = math.huge
local nearestenemy = nil
local vector = nil
for i,v in next, Players:GetChildren() do
if v ~= Players.LocalPlayer then
if v.Character and  v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
local vector, onScreen = Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
if onScreen then
local ray = Ray.new(
Camera.CFrame.p,
(v.Character["Head"].Position-Camera.CFrame.p).unit*20000
)
local ignore = {
LocalPlayer.Character,
}
local hit,position,normal=workspace:FindPartOnRayWithIgnoreList(ray,ignore)
if hit and hit:FindFirstAncestorOfClass("Model") and Players:FindFirstChild(hit:FindFirstAncestorOfClass("Model").Name)then
local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
if magnitude < nearestmagnitude and magnitude <= features["fov"] then
nearestenemy = v
nearestmagnitude = magnitude
end
end
end
end
end
end
return nearestenemy
end


local meta = getrawmetatable(game)
setreadonly(meta, false)
local oldNamecall = meta.__namecall
meta.__namecall = newcclosure(function(...)
local method = getnamecallmethod()
local args = {...}
if string.find(method,'Ray') then
if target then
args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (target + Vector3.new(0,(workspace.CurrentCamera.CFrame.Position-target).Magnitude/20000,0) - workspace.CurrentCamera.CFrame.Position).unit * 20000)
end
end
return oldNamecall(unpack(args))
end)


RunService:BindToRenderStep("silentaim",1,function()
if UserInputService:IsMouseButtonPressed(0) and features["silentaim"] and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Players.LocalPlayer.Character.Humanoid.Health > 0 then
local enemy = getnearest()
if enemy and enemy.Character and enemy.Character:FindFirstChild("Humanoid") and enemy.Character.Humanoid.Health > 0 then                
local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character["Head"].Position)
local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
target = workspace[enemy.Name]["Head"].Position
end
else
target = nil
end
end)
    end
)

    btns:Slider(
    "Hitchance",
    50,
    100,
    75,
    function(t)
        print(t)
    end
)

local vsls = serv:Channel("Visuals")

vsls:Button(
    "Player ESP",
    function()
        DiscordLib:Notification("Enabled Feature:", "Player ESP", "Okay")
	assert(Drawing, "missing function/library: drawing");

-- services
local run_service = game:GetService("RunService");
local players = game:GetService("Players");
local workspace = game:GetService("Workspace");

-- variables
local camera = workspace.CurrentCamera;
local get_pivot = workspace.GetPivot;
local wtvp = camera.WorldToViewportPoint;
local viewport_size = camera.ViewportSize;
local localplayer = players.LocalPlayer;
local cache = {};

-- locals
local new_drawing = Drawing.new;
local new_vector2 = Vector2.new;
local new_color3 = Color3.new;
local rad = math.rad;
local tan = math.tan;
local floor = math.floor;

-- functions
local function create_esp(player)
    local esp = {};

    esp.box = new_drawing("Square");
    esp.box.Color = new_color3(23, 23, 23);
    esp.box.Thickness = 1;
    esp.box.Visible = false;

    esp.tracer = new_drawing("Line");
	esp.tracer = new_drawing("Text");
    esp.tracer.Color = new_color3(23, 23, 23);
    esp.tracer.Thickness = 1;
    esp.tracer.Visible = false;

    esp.name = new_drawing("Text");
    esp.name.Color = new_color3(23, 23, 23);
    esp.name.Font = Drawing.Fonts.Plex;
    esp.name.Size = 14;
    esp.name.Center = true;
    esp.name.Visible = false;

    esp.distance = new_drawing("Text");
    esp.distance.Color = new_color3(23, 23, 23);
    esp.distance.Font = Drawing.Fonts.Plex;
    esp.distance.Size = 14;
    esp.distance.Center = true;
    esp.distance.Visible = false;

    cache[player] = esp;
end

local function remove_esp(player)
    for _, drawing in next, cache[player] do
        drawing:Remove();
    end

    cache[player] = nil;
end

local function update_esp()
    for player, esp in next, cache do
        local character = player and player.Character;
        if character and player.Team ~= localplayer.Team then
            local cframe = get_pivot(character);
            local position, visible = wtvp(camera, cframe.Position);

            esp.box.Visible = visible;
            esp.tracer.Visible = visible;
            esp.name.Visible = visible;
            esp.distance.Visible = visible;

            if visible then
                local scale_factor = 1 / (position.Z * tan(rad(camera.FieldOfView * 0.5)) * 2) * 100;
                local width, height = floor(30 * scale_factor), floor(50 * scale_factor);
                local x, y = floor(position.X), floor(position.Y);

                esp.box.Size = new_vector2(width, height);
                esp.box.Position = new_vector2(floor(x - width * 0.5), floor(y - height * 0.5));

                esp.tracer.From = new_vector2(floor(viewport_size.X * 0.5), floor(viewport_size.Y));
                esp.tracer.To = new_vector2(x, floor(y + height * 0.5));

                esp.name.Text = player.Name .. "(gay)";
                esp.name.Position = new_vector2(x, floor(y - height * 0.5 - esp.name.TextBounds.Y));

                esp.distance.Text = floor(position.Z) .. " meters";
                esp.distance.Position = new_vector2(x, floor(y + height * 0.5));
            end
        else
            esp.box.Visible = false;
            esp.tracer.Visible = false;
            esp.name.Visible = false;
            esp.distance.Visible = false;
        end
    end
end

-- initialize
players.PlayerAdded:Connect(create_esp);
players.PlayerRemoving:Connect(remove_esp);
run_service.RenderStepped:Connect(update_esp);

for _, player in next, players:GetPlayers() do
    if player ~= localplayer then
        create_esp(player);
    end
end
    end
)

local misc = serv:Channel("Miscellaneous")

misc:Button(
    "Infinite Jump",
    function()
            DiscordLib:Notification("Enabled Feature:", "Infinite Jump", "Okay")
            local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
    end
)

local site = serv:Channel("cheatglobal.com")

while true do
    local args = {
    [1] = "Trolling42",
    [2] = "S€x Hub Tapping",
    [3] = false,
    [5] = false,
    [6] = true
}

game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(unpack(args))
    wait(10)
end
