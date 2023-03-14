local UiLib = loadstring(game:HttpGet("https://pastebin.com/raw/njPmqnJQ"))()
local Window = UiLib:CreateWindow("Chaos but none asked")
local Page1 = Window:CreatePage("enter it lol don't ask y")
local Page2 = Window:CreatePage("Teleports")
local Page3 = Window:CreatePage("Local Player")
local Themes = Window:CreatePage("Themes")
local Credits =	Window:CreatePage("Credits? nah im not givin credit")
local Selected = "Blood Dagger"
local Range = 10
local On = false
local On2 = false
local On3 = false
local On4 = false
local On5 = false
local On6 = false
local On7 = false
local On8 = false
local On9 = false

_G.IgnoreList = {}


Credits:NewTextFrame("Not anton#0004 | Ui library and scripting")
Credits:NewTextFrame("cum")

Themes:NewColorPicker(Color3.fromRGB(0,255,0), "Topbar color", function(Color)
	Window:Theme(Color, "TopBar")
end)

Themes:NewColorPicker(Color3.fromRGB(0,0,255), "Tabs color", function(Color)
	Window:Theme(Color, "Tabs")
end)

Themes:NewColorPicker(Color3.fromRGB(0,255,0), "Background color", function(Color)
	Window:Theme(Color, "BackGround")
end)

Themes:NewColorPicker(Color3.fromRGB(0,0,255), "Text color", function(Color)
	Window:Theme(Color, "Text")
end)

Themes:NewColorPicker(Color3.fromRGB(0,0,0), "Shadow color", function(Color)
	Window:Theme(Color, "Shadow")
end)

Page1:NewDropDown({"Blood Dagger", "Emerald Sword", "Pencil"}, "Weapon", function(e)
	Selected = e
end)

Page1:NewSlider("Kill aura range", 100, 10, function(RangeValue)
	Range = RangeValue
end)

Themes:NewButton("Reset all", function()
	Window:Theme("a", "Reset")
end)

Page1:NewToggle("idc bout dis one", function(a)
	On2 = a
end)

Page1:NewToggle("MINI GUN GO BRRRR", function(a)
	On3 = a
end)

Page1:NewToggle("wat how i have itdm", function(a)
	On4 = a
end)

Page1:NewToggle("basically nuke", function(a)
	On5 = a
end)

Page1:NewToggle("Spike h e l l ", function(a)
	On6 = a
end)

Page1:NewToggle("Fast hit gaming", function(a)
	On7 = a
end)

Page1:NewToggle("ooo wat does it do", function(a)
	On8 = a
end)

Page1:NewToggle("Kill aura? not lol", function(a)
	On8 = a
end)

Page1:NewButton("i have a sword i fear nothin ", function()
	if game.Players.LocalPlayer.Character:FindFirstChild("Loaded") then
		game.Players.LocalPlayer.Character.Loaded:Destroy()
	end
	game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Menu Screen").RemoteEvent:FireServer("Emerald Greatsword")
	game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Menu Screen").Enabled = false
end)

Page1:NewButton("B l o o d", function()
	if game.Players.LocalPlayer.Character:FindFirstChild("Loaded") then
		game.Players.LocalPlayer.Character.Loaded:Destroy()
	end
	game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Menu Screen").Enabled = false
	game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Menu Screen").RemoteEvent:FireServer("Blood Dagger")
end)

Page2:NewButton("House", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-184, 63, -34)
end)

Page2:NewButton("House Top", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-178, 91, -29)
end)

Page2:NewButton("Tower 1", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(55, 113, -37)
end)

Page2:NewButton("Tower 2", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(61, 114, 188)
end)

Page2:NewButton("Tower 3", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-433, 87, -17)
end)

Page2:NewButton("Bridge", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(64, 82, 76)
end)

Page2:NewButton("Beach", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(95, 60, 76)
end)

Page3:NewButton("Bypass wait() (Effects dash and gun)", function()
	originalfunction = hookfunction(wait, function(seconds)
		if seconds == 2 then return end
		return originalfunction(seconds)
	end)
end)

Page3:NewSlider("Speed", 200, 16, function(Speed)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
end)

Page3:NewSlider("Jump Power", 250, 50, function(JumpPower)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
end)

Page3:NewButton("Tp Tool", function()
	local TpTool = Instance.new("Tool")
	TpTool.Name = "Teleport Tool"
	TpTool.RequiresHandle = false
	TpTool.Parent = game.Players.LocalPlayer.Backpack
	TpTool.Activated:Connect(function()
		local Char = game.Players.LocalPlayer.Character or workspace:FindFirstChild(game.Players.LocalPlayer.Name)
		local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
		if not Char or not HRP then
			return
		end
		HRP.CFrame = CFrame.new(game.Players.LocalPlayer:GetMouse().Hit.X, game.Players.LocalPlayer:GetMouse().Hit.Y + 3, game.Players.LocalPlayer:GetMouse().Hit.Z, select(4, HRP.CFrame:components()))
	end)
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(Key)
	if On and Key == " " then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState(3)
	end
end)

game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
	wait(5.10)
	if On2 then
		if Selected == "Blood Dagger" then
			game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Menu Screen").Enabled = false
			game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Menu Screen").RemoteEvent:FireServer("Blood Dagger")
		elseif Selected == "Emerald Sword" then
			game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Menu Screen").Enabled = false
			game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Menu Screen").RemoteEvent:FireServer("Blood Dagger")
		end
	end
end)

while wait(0.001) do
	if On3 then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == "Kawaii Revolver" then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				v:Activate()
				for i=1,2 do
					game:GetService("RunService").Heartbeat:Wait()
				end
			end
		end
	end
	if On4 then
		if game.Players.LocalPlayer.Character:FindFirstChild("Loaded") then
			game.Players.LocalPlayer.Character.Loaded:Destroy()
		end
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("Menu Screen"):FindFirstChild("RemoteEvent"):FireServer(Selected)
		game:GetService("RunService").Heartbeat:Wait()
	end
	if On5 then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == "Grenade" then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				v:Activate()
				game:GetService("RunService").Heartbeat:Wait()
			end
		end
	end
	if On6 then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == "Spiked Trap" then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				v:Activate()
				for i=1,5 do
					game:GetService("RunService").Heartbeat:Wait()
				end
			end
		end
		game:GetService("RunService").Heartbeat:Wait()
	end
	if On7 then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == "Blood Dagger" then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				v:Activate()
				for i=1,8 do
					game:GetService("RunService").Heartbeat:Wait()
				end
			end
		end
	end
	if On8 then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:FindFirstChild("DamageRemote") then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				
				local targ
				local range = 10000
				for i,v in pairs(workspace:GetChildren()) do
					if v~= game.Players.LocalPlayer.Character and not table.find(_G.IgnoreList,v.Name) then
						local vhum = v:FindFirstChild("Humanoid")
						local vroot = v:FindFirstChild("HumanoidRootPart")
						if vhum and vroot then
							local dist = (vroot.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
							if vhum.Health>0 and not v:FindFirstChild("ForceField") and dist <= range then
								targ = vhum
								range = dist
							end
						end
					end
				end
				game:GetService("RunService").Heartbeat:Wait()
				if targ then
					v.DamageRemote:FireServer(targ)
				end
			end
		end
	end
	if On9 then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == Selected then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				if game.Players.LocalPlayer.Character:FindFirstChild(Selected) then
					break
				end
			end
		end
			local targ
				for i,v in pairs(workspace:GetChildren()) do
					if v~=game.Players.LocalPlayer.Character and not table.find(_G.IgnoreList,v.Name) then
						local vhum = v:FindFirstChild("Humanoid")
						local vroot = v:FindFirstChild("HumanoidRootPart")
						if vhum and vroot then
							local dist = (vroot.Position -  game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
							if vhum.Health>0 and not v:FindFirstChild("ForceField") and dist <= Range then
								targ = vhum
								Range = dist
							end
						end
					end
				end
		
		if targ then
			local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
			tool.DamageRemote:FireServer(targ)
		end
		wait()
	end
end
