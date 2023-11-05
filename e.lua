local terminalGui = Instance.new("ScreenGui")
terminalGui.Name = "TerminalGui"
terminalGui.Parent = game.CoreGui
terminalGui.ResetOnSpawn=false
local terminalFrame = Instance.new("Frame")
terminalFrame.Name = "TerminalFrame"
terminalFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
terminalFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
terminalFrame.BackgroundTransparency = 0.5
terminalFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
terminalFrame.BorderSizePixel = 0
terminalFrame.Parent = terminalGui
terminalFrame.Active = true
terminalFrame.Draggable = true
local inputBox = Instance.new("TextBox")
inputBox.Name = "InputBox"
inputBox.Size = UDim2.new(1, 0, 0, 30)
inputBox.Position = UDim2.new(0, 0, 1, -30)
inputBox.BackgroundTransparency = 0.5
inputBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
inputBox.BorderSizePixel = 0
inputBox.Font = Enum.Font.Code
inputBox.TextSize = 18
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.PlaceholderText = "Enter a command..."
inputBox.ClearTextOnFocus = true
inputBox.Parent = terminalFrame

local outputBox = Instance.new("TextLabel")
outputBox.Name = "OutputBox"
outputBox.Size = UDim2.new(1, 0, 1, -30)
outputBox.Position = UDim2.new(0, 0, 0, 0)
outputBox.BackgroundTransparency = 1
outputBox.Font = Enum.Font.Code
outputBox.TextSize = 18
outputBox.TextWrapped = true
outputBox.Text = ""
outputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
outputBox.TextXAlignment = Enum.TextXAlignment.Left
outputBox.TextYAlignment = Enum.TextYAlignment.Top
outputBox.Parent = terminalFrame

local function executeCommand(command)
    local result = ""

    if command:sub(1, 4) == "get " then
        local arg = command:sub(5)
        if arg then
        if isfile(arg) then
        result = pcall(loadstring(readfile(arg))())
        result = "Ran File " .. arg
        else
        result = "<ERROR> " .. arg .. " Doesnt exist"
        end
        else
        result = "<ERROR> No argument!"
        end
    elseif command:sub(1, 5) == "load " then
        local arg = command:sub(6)
        if arg then
            local exec = pcall(loadstring(arg)())
            result = "Ran code " .. arg
        else
            result = "<ERROR> No code input"
        end
    elseif command:sub(1, 5) == "save " then
        local filename, content = command:match("^save%s+(%S+)%s+as%s+(.*)$")
        if filename and content then
            writefile(filename, content)
            result = "Saved file '" .. filename .. "'"
        else
            result = "<ERROR> Invalid arguments for 'save' command"
        end
    elseif command:sub(1, 5) == "copy " then
        local filename, file, g = command:match("^copy%s+(%S+)%s+as%s+(.*)$")
        if filename and content then
            writefile(content, readfile(filename))
            result = "copied file '" .. filename .. " as " .. content
        else
            result = "<ERROR> Invalid arguments for 'copy' command"
        end
    end
    end

    if result == "" then
        result = "> " .. command
    end

    return result
end



local outputLabels = {}
local startYPosition = 0

inputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local command = inputBox.Text
        inputBox.Text = ""
        local result = executeCommand(command)
        
        local outputLabel = outputBox:Clone()
        outputLabel.Text = result
        outputLabel.Position = UDim2.new(0, 0, 0, startYPosition)
        outputLabel.Parent = terminalFrame
        table.insert(outputLabels, outputLabel)

        startYPosition = startYPosition - outputLabel.Size.Y.Offset - 10

        if startYPosition > terminalFrame.AbsoluteSize.Y - 20 then
            startYPosition = 0
            for i, label in ipairs(outputLabels) do
                label:Destroy()
                outputLabels[i] = nil
            end
        end
    end
end)
