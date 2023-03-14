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
local Cmds = {"!list", "!List", "!Info", "!info", "!IY", "!iy", "Iy", "!C1", "!C2", "!c1", "!c2"} -- you can edit the table for adding commands !!
local Player = game.Players.LocalPlayer
longnotify("Enjoy!")

Player.Chatted:connect(function(cht)
if cht:match(Cmds[1]) or cht:match(Cmds[2]) then
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 300)
frame.Position = UDim2.new(0.5, -100, 0.5, -150)
frame.BackgroundTransparency = 0.8
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Draggable = true
frame.Active = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Text = "My List"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Parent = frame

local hideButton = Instance.new("TextButton")
hideButton.Text = "X"
hideButton.Font = Enum.Font.SourceSansBold
hideButton.TextSize = 20
hideButton.Size = UDim2.new(0, 20, 0, 20)
hideButton.Position = UDim2.new(1, -20, 0, 0)
hideButton.TextColor3 = Color3.new(1, 1, 1)
hideButton.BackgroundColor3 = Color3.new(1, 0, 0)
hideButton.BackgroundTransparency = 0.5
hideButton.Parent = title

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, -60)
scrollingFrame.Position = UDim2.new(0, 0, 0, 30)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.Parent = frame

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -10, 0, 20)
searchBox.Position = UDim2.new(0, 5, 0, 5)
searchBox.PlaceholderText = "Search..."
searchBox.Parent = frame

local function addListItem(text)
    local listItem = Instance.new("TextLabel")
    listItem.Text = text
    listItem.Size = UDim2.new(1, 0, 0, 30)
    listItem.Position = UDim2.new(0, 0, 0, scrollingFrame.CanvasSize.Y.Offset)
    listItem.Parent = scrollingFrame

    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, scrollingFrame.CanvasSize.Y.Offset + 30)
end

addListItem("!list")
addListItem("!info")
addListItem("!iy")
addListItem("!c1")
addListItem("!c2")

local function filterList(query)
    for _, item in ipairs(scrollingFrame:GetChildren()) do
        if item:IsA("TextLabel") and not string.find(item.Text:lower(), query) then
            item.Visible = false
        else
            item.Visible = true
        end
    end
end

searchBox.Changed:Connect(function()
    local query = searchBox.Text:lower()
    filterList(query)
end)

local function updateScrollBar()
    local canvasSize = scrollingFrame.CanvasSize.Y
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, scrollingFrame.CanvasSize.Y.Offset + listItem.Size.Y.Offset) -- adjust canvas size to fit new item
end

--[[ example of adding custom items to the list
addListItem("Item 1")
addListItem("Item 2")
addListItem("Item 3")

-- function to filter items based on search query
local function filterList(query)
for _, item in ipairs(scrollingFrame:GetChildren()) do
if item:IsA("TextLabel") and item.Text:lower():find(query:lower()) then
item.Visible = true
else
item.Visible = false
end
end
end
]]--
-- add event listener to search box
searchBox.Changed:Connect(function(prop)
if prop == "Text" then
filterList(searchBox.Text)
end
end)

-- add event listener to hide button
hideButton.MouseButton1Click:Connect(function()
frame.Visible = false
end)
print(Cmds[1], Cmds[4], Cmds[6], Cmds[8], Cmds[9])
elseif cht:match(Cmds[3]) or cht:match(Cmds[4]) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/theweakestskid/e/main/info.txt",true))()
notif("Loaded enjoy!")
elseif cht:match(Cmds[5])  or cht:match(Cmds[6]) or cht:match(Cmds[7]) then
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
notif("Ran Successfully!")
elseif cht:match(Cmds[8]) or cht:match(Cmds[10]) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/theweakestskid/e/main/chaos.lua",true))()
elseif cht:match(Cmds[9]) or cht:match(Cmds[11]) then
loadstring(game:HttpGet('https://raw.githubusercontent.com/1111-ssss/Chaos_Script/main/Chaos_script.txt'))()
end
end)

wait(5)
notif("Current Ver:0.2")
wait(4)
notif("Made by Sumeth")
wait(4)
longnotify("added 2 new cmds !c1 and !c2!")
