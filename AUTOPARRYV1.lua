if not _G.DEFAULTDISTANCE then
     _G.STARTERDISTANCE = 10
end
local StarterGui = game:GetService("StarterGui")
function ntf(t, d, du)
     StarterGui:SetCore("SendNotification", {
        Title = t,
        Text = d,
        Duration = du
    })
end
ntf("Settings.", "Current Default scaling: " .. _G.DEFAULTDISTANCE or _g.STARTERDISTANCE .. " plzplz go visit theweakestskid on github!1!", 16)
function irp(limit)
    limit = math.max(0, limit) -- Ensure limit is non-negative
    local returnPoint = 0.0
    if limit < 325 then
        for i = 1, limit do
            if i % 1 == 0 then
                returnPoint = returnPoint + 0.1
            end
        end
    else
        if limit < 600 then
        for i = 1, limit do
            if i % 1 == 0 then
                returnPoint = returnPoint + 0.25
            end
        end
        else
            for i = 1, limit do
               if i % 1 == 0 then
                  returnPoint = returnPoint + 0.5
               end
            end
        end
    end
    return returnPoint
end
local USEMOD = false
while true do
function gs(p, se)
return p:GetService(tostring(se))
end
function wfc(p, ch)
return p:WaitForChild(tostring(ch))
end
local g = game
local cui = gs(g, "CoreGui")
local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local heartbeatConnection
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local runService = game:GetService("RunService")
    local parryButtonPress = replicatedStorage.Remotes.ParryButtonPress
    local ballsFolder = workspace:WaitForChild("Balls")
local VELUI = Instance.new("ScreenGui", cui)
local VELUI_LABEL = Instance.new("TextLabel")
local label = VELUI_LABEL
    label.Size = UDim2.new(0, 200, 0, 50)
    label.Position = UDim2.new(0.5, -100, 0, 10) -- Center top
    label.BackgroundTransparency = 1
    label.Text = "nil"
    label.Font = Enum.Font.SourceSans
    label.TextSize = 20
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Parent = VELUI
function sl(t)
label.Text = tostring(t)
end
    local function onCharacterAdded(newCharacter)
        character = newCharacter
    end

    player.CharacterAdded:Connect(onCharacterAdded)

    local focusedBall = nil  

    local function chooseNewFocusedBall()
        local balls = ballsFolder:GetChildren()
        focusedBall = nil
        for _, ball in ipairs(balls) do
            if ball:GetAttribute("realBall") == true then
                focusedBall = ball
                break
            end
        end
    end

    chooseNewFocusedBall()

    local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
        local directionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
        local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
        
        if velocityTowardsPlayer <= 0 then
            return math.huge
        end
        
        local distanceToBeCovered = distanceToPlayer - 40
        return distanceToBeCovered / velocityTowardsPlayer
    end

    local BASE_THRESHOLD = 0.15
    local VELOCITY_SCALING_FACTOR = 0.002

    local function getDynamicThreshold(ballVelocityMagnitude)
        local adjustedThreshold = BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR)
        return math.max(0.12, adjustedThreshold)
    end

    local function checkBallDistance()
    if not USEMOD then
        if not character:FindFirstChild("Highlight") then return end
        local charPos = character.PrimaryPart.Position
        local charVel = character.PrimaryPart.Velocity

        if focusedBall and not focusedBall.Parent then
            chooseNewFocusedBall()
        end

        if not focusedBall then return end
        local ball = focusedBall
        local distanceToPlayer = (ball.Position - charPos).Magnitude
        local timeToImpact = timeUntilImpact(ball.Velocity, distanceToPlayer, charVel)
        local diectionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
        local velocity = ball.Velocity:Dot(diectionToPlayer) - charVel:Dot(diectionToPlayer)
        local DF = _G.DEFAULTDISTANCE or _G.STARTERDISTANCE
        local ad = DF + irp(velocity)
        if distanceToPlayer < ad then
            parryButtonPress:Fire()
            return
        end

        local dynamicThreshold = getDynamicThreshold(ball.Velocity.Magnitude)
        sl("Bvel: " .. velocity .. " | Dynamic Threshold: " .. dynamicThreshold .. " | Distance: " .. distanceToPlayer .. " DTH: " .. ad)
        if timeToImpact < dynamicThreshold then
            parryButtonPress:Fire()
        end
    else
    local charPos = character.PrimaryPart.Position
        local charVel = character.PrimaryPart.Velocity

        if focusedBall and not focusedBall.Parent then
            chooseNewFocusedBall()
        end

        if not focusedBall then return end
        local ball = focusedBall
        local distanceToPlayer = (ball.Position - charPos).Magnitude
        local timeToImpact = timeUntilImpact(ball.Velocity, distanceToPlayer, charVel)
        local diectionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
        local velocity = ball.Velocity:Dot(diectionToPlayer) - charVel:Dot(diectionToPlayer)
        local ad = 10 + irp(velocity)
        if distanceToPlayer < ad then
            parryButtonPress:Fire()
            return
        end

        local dynamicThreshold = getDynamicThreshold(ball.Velocity.Magnitude)
        sl("Bvel: " .. velocity .. " | Dynamic Threshold: " .. dynamicThreshold .. " | Distance: " .. distanceToPlayer .. " DTH: " .. ad)
        if timeToImpact < dynamicThreshold then
            parryButtonPress:Fire()
        end
    end
    end
    heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
        checkBallDistance()
    end)
    wait(2)
    VELUI:Destroy()
end
