--[[ SW4 UNIVERSAL HUB - DIRECT RUN ]]--
local S = Instance.new("ScreenGui", game:GetService("CoreGui"))
local F = Instance.new("Frame", S)
F.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
F.Position = UDim2.new(0.3, 0, 0.25, 0)
F.Size = UDim2.new(0, 240, 0, 320)
F.Active = true
F.Draggable = true

-- عنوان السكربت
local Title = Instance.new("TextLabel", F)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.Text = "SW4 UNIVERSAL HUB 🌐"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

local function createBtn(text, pos, func)
    local B = Instance.new("TextButton", F)
    B.Size = UDim2.new(0.85, 0, 0, 38)
    B.Position = pos
    B.Text = text
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    B.TextSize = 14
    B.MouseButton1Click:Connect(func)
end

-- 1. زر السرعة الفائقة
createBtn("⚡ سرعة فائقة (Speed 120)", UDim2.new(0.075, 0, 0.15, 0), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
end)

-- 2. زر القفزة العالية
createBtn("🦘 قفزة عالية (Jump 160)", UDim2.new(0.075, 0, 0.30, 0), function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 160
end)

-- 3. زر كشف أماكن اللاعبين (ESP)
createBtn("👁️ كشف اللاعبين (All ESP)", UDim2.new(0.075, 0, 0.45, 0), function()
    for _, p in pairs(game.Players:GetChildren()) do
        if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if not p.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                local h = Instance.new("Highlight", p.Character)
                h.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
    end
end)

-- 4. زر الطيران الشامل
createBtn("🚀 تفعيل الطيران (Fly Mode)", UDim2.new(0.075, 0, 0.60, 0), function()
    local p = game.Players.LocalPlayer
    local c = p.Character or p.CharacterAdded:Wait()
    local t = c:WaitForChild("HumanoidRootPart")
    local bv = Instance.new("BodyVelocity", t)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.new(0,0,0)
    local bg = Instance.new("BodyGyro", t)
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.CFrame = t.CFrame
    
    -- نظام طيران مبسط يعتمد على اتجاه الكاميرا
    game:GetService("RunService").RenderStepped:Connect(function()
        bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
        bg.CFrame = workspace.CurrentCamera.CFrame
    end)
end)

-- 5. زر إغلاق السكربت
createBtn("❌ إغلاق السكربت", UDim2.new(0.075, 0, 0.80, 0), function()
    S:Destroy()
end)
