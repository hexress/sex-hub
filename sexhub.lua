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

local serv = win:Server("Main", "")

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
fov = 500;
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
(v.Character["Head"].Position-Camera.CFrame.p).unit*500
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
args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (target + Vector3.new(0,(workspace.CurrentCamera.CFrame.Position-target).Magnitude/500,0) - workspace.CurrentCamera.CFrame.Position).unit * 500)
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

local vsls = serv:Channel("Visuals")

vsls:Button(
    "Player ESP",
    function()
        DiscordLib:Notification("Enabled Feature:", "Player ESP", "Okay")
        --hexin allahını sikem
Tracers = true
Boxes = true
CheckTeams = true

TracerColor = Color3.fromRGB(23, 23, 23)
BoxesColor = Color3.fromRGB(23, 23, 23)

SelectedPart = "HumanoidRootPart"

local tracing = {}
local tracer = {
	create = function()
		local esptracer = Drawing.new("Line")
		esptracer.Visible = true
		esptracer.Transparency = .5
		esptracer.Thickness = 1
		esptracer.From = Vector2.new(game:GetService("Workspace").CurrentCamera.ViewportSize.X / 2, game:GetService("Workspace").CurrentCamera.ViewportSize.Y)
		return esptracer
	end
}


local box = {
	create = function()
		local espbox = Drawing.new("Square")
		espbox.Transparency = 0.4
		espbox.Thickness = 2
		espbox.Visible = true
		return espbox
	end
}

game:GetService("RunService").Stepped:Connect(function()
	spawn(function()
		for i, v in pairs((game:GetService("Players")):GetChildren()) do
			if v.Name ~= game:GetService("Players").LocalPlayer.Name and v.Character and v.Character:FindFirstChild(SelectedPart) and v.Character and Tracers then
				if not tracing[v.Name] then
					tracing[v.Name] = {
						v.Character
					}
				end
				local camPos, isVis = game:GetService("Workspace").CurrentCamera:WorldToScreenPoint(v.Character[SelectedPart].Position)
				if not CheckTeams then
					if Tracers then
						if tracing[v.Name][2] then
							tracing[v.Name][2].Visible = isVis and Tracers
							tracing[v.Name][2].Color = TracerColor
							tracing[v.Name][2].To = Vector2.new(camPos.X, camPos.Y + (game:GetService("GuiService")):GetGuiInset().Y)
							tracing[v.Name][2].From = Vector2.new(game:GetService("Players").LocalPlayer:GetMouse().X, game:GetService("Players").LocalPlayer:GetMouse().Y + (game:GetService("GuiService")):GetGuiInset().Y)
						else
							tracing[v.Name][2] = tracer.create()
							tracing[v.Name][2].Visible = isVis and Tracers
							tracing[v.Name][2].To = Vector2.new(camPos.X, camPos.Y + (game:GetService("GuiService")):GetGuiInset().Y)
							tracing[v.Name][2].From = Vector2.new(game:GetService("Players").LocalPlayer:GetMouse().X, game:GetService("Players").LocalPlayer:GetMouse().Y + (game:GetService("GuiService")):GetGuiInset().Y)
							tracing[v.Name][2].Color = TracerColor
						end
					else
						if tracing[v.Name][2] then
							tracing[v.Name][2]:Remove()
							tracing[v.Name][2] = nil
						end
					end
					if Boxes then
						if tracing[v.Name][3] then
							tracing[v.Name][3].Visible = isVis and Boxes
							tracing[v.Name][3].Size = Vector2.new(2000 / camPos.Z, 4500 / camPos.Z)
							tracing[v.Name][3].Color = BoxesColor
							tracing[v.Name][3].Position = Vector2.new(camPos.X - tracing[v.Name][3].Size.X / 2, camPos.Y + game:GetService("GuiService"):GetGuiInset().Y - tracing[v.Name][3].Size.Y / 2)
						else
							tracing[v.Name][3] = box.create()
							tracing[v.Name][3].Visible = isVis and Boxes
							tracing[v.Name][3].Size = Vector2.new(2000 / camPos.Z, 4500 / camPos.Z)
							tracing[v.Name][3].Color = BoxesColor
							tracing[v.Name][3].Position = Vector2.new(camPos.X - tracing[v.Name][3].Size.X / 2, camPos.Y + game:GetService("GuiService"):GetGuiInset().Y - tracing[v.Name][3].Size.Y / 2)
						end
					else
						if tracing[v.Name][3] then
							tracing[v.Name][3]:Remove()
							tracing[v.Name][3] = nil
						end
					end
				elseif CheckTeams then
					if v.TeamColor ~= game:GetService("Players").LocalPlayer.TeamColor then
						if Tracers then
							if tracing[v.Name][2] then
								tracing[v.Name][2].Visible = isVis and Tracers
								tracing[v.Name][2].Color = TracerColor
								tracing[v.Name][2].To = Vector2.new(camPos.X, camPos.Y + (game:GetService("GuiService")):GetGuiInset().Y)
								tracing[v.Name][2].From = Vector2.new(game:GetService("Players").LocalPlayer:GetMouse().X, game:GetService("Players").LocalPlayer:GetMouse().Y + (game:GetService("GuiService")):GetGuiInset().Y)
							else
								tracing[v.Name][2] = tracer.create()
								tracing[v.Name][2].Visible = isVis and Tracers
								tracing[v.Name][2].To = Vector2.new(camPos.X, camPos.Y + (game:GetService("GuiService")):GetGuiInset().Y)
								tracing[v.Name][2].From = Vector2.new(game:GetService("Players").LocalPlayer:GetMouse().X, game:GetService("Players").LocalPlayer:GetMouse().Y + (game:GetService("GuiService")):GetGuiInset().Y)
								tracing[v.Name][2].Color = TracerColor
							end
						else
							if tracing[v.Name][2] then
								tracing[v.Name][2]:Remove()
								tracing[v.Name][2] = nil
							end
						end
						if Boxes then
							if tracing[v.Name][3] then
								tracing[v.Name][3].Visible = isVis and Boxes
								tracing[v.Name][3].Size = Vector2.new(2000 / camPos.Z, 4500 / camPos.Z)
								tracing[v.Name][3].Color = BoxesColor
								tracing[v.Name][3].Position = Vector2.new(camPos.X - tracing[v.Name][3].Size.X / 2, camPos.Y + game:GetService("GuiService"):GetGuiInset().Y - tracing[v.Name][3].Size.Y / 2)
							else
								tracing[v.Name][3] = box.create()
								tracing[v.Name][3].Visible = isVis and Boxes
								tracing[v.Name][3].Size = Vector2.new(2000 / camPos.Z, 4500 / camPos.Z)
								tracing[v.Name][3].Color = BoxesColor
								tracing[v.Name][3].Position = Vector2.new(camPos.X - tracing[v.Name][3].Size.X / 2, camPos.Y + game:GetService("GuiService"):GetGuiInset().Y - tracing[v.Name][3].Size.Y / 2)
							end
						else
							if tracing[v.Name][3] then
								tracing[v.Name][3]:Remove()
								tracing[v.Name][3] = nil
							end
						end
					end
				end
			else
				if tracing[v.Name] then
					if tracing[v.Name][2] then
						tracing[v.Name][2]:Remove()
						tracing[v.Name][2] = nil
					end
					if tracing[v.Name][3] then
						tracing[v.Name][3]:Remove()
						tracing[v.Name][3] = nil
					end
				end
			end
		end
	end)
end)
game:GetService("Players").PlayerRemoving:Connect(function(remove_player)
	if tracing[remove_player.Name] then
		if tracing[remove_player.Name][2] then
			tracing[remove_player.Name][2]:Remove()
			tracing[remove_player.Name][2] = nil
		end
		if tracing[remove_player.Name][3] then
			tracing[remove_player.Name][3]:Remove()
			tracing[remove_player.Name][3] = nil
		end
		tracing[remove_player.Name] = nil
	end
end)

OpenSourceESP = {}
function OpenSourceESP:Tracers(bool, color)
	Tracers = bool
	TracerColor = color
end
function OpenSourceESP:Boxes(bool, color)
	Boxes = bool
	BoxesColor = color
end
function OpenSourceESP:TeamCheck(bool)
	CheckTeams = bool
end

return OpenSourceESP
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
