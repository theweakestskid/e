-- Create a ScreenGui and a TextLabel for the notification
local g = game
if not g:IsLoaded() then
	g.Loaded:Wait()
end
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 200, 0, 50)
label.Position = UDim2.new(0.5, 480, 1, -50)
label.AnchorPoint = Vector2.new(0.5, 1)
label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.SourceSansBold
label.TextSize = 20
label.TextWrapped = true
label.TextXAlignment = Enum.TextXAlignment.Center
label.TextYAlignment = Enum.TextYAlignment.Center
label.Parent = gui

local uicor = Instance.new("UICorner")
uicor.Parent = label

-- Define a function to show the notification
function notif(message)
    label.Text = message
    label.Visible = true
    label:TweenPosition(UDim2.new(0.5, 280, 1, -50), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    wait(2)
    label:TweenPosition(UDim2.new(0.5, 280, 1, 50), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true)
    wait(1.5)
    label.Visible = false
end


-- Define a function to show the notification
function longnotify(message)
    label.Text = message
    label.Visible = true
    label:TweenPosition(UDim2.new(0.5, 280, 1, -50), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    wait(10)
    label:TweenPosition(UDim2.new(0.5, 280, 1, 50), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true)
    wait(1.5)
    label.Visible = false
end
notif("Command loaded!")
wait(0.1)
--[[
this is a custom cmd scirpt
you can modify and add functions to it :)
Enjoy!!!!!
]]
local Cmds = {"!list", "!List", "!Info", "!info", "!IY", "!iy", "Iy"} -- you can edit the table for adding commands !!
local Player = game.Players.LocalPlayer
longnotify("Enjoy!")

Player.Chatted:connect(function(cht)
if cht:match(Cmds[1]) or cht:match(Cmds[2]) then
print(Cmds[1], Cmds[4], Cmds[6])
elseif cht:match(Cmds[3]) or cht:match(Cmds[4]) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/theweakestskid/e/main/info.txt",true))()
notif("Loaded enjoy!")
elseif cht:match(Cmds[5])  or cht:match(Cmds[6]) or cht:match(Cmds[7]) then
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
notif("Ran Successfully!")
end
end)
