local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Rayfield:CreateWindow({
   Name = "SW4 Hub",
   LoadingTitle = "SW4 Loading...",
   LoadingSubtitle = "by SW4 Team",
   Theme = "Default",
   ConfigurationSaving = { Enabled = false }
})

local PlayerTab = Window:CreateTab("Player", 4483345998)

PlayerTab:CreateSlider({
   Name = "Speed",
   Range = {16, 200},
   Increment = 1,
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

PlayerTab:CreateSlider({
   Name = "Jump",
   Range = {50, 300},
   Increment = 1,
   CurrentValue = 50,
   Flag = "JumpSlider",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local MapTab = Window:CreateTab("Map", 4483345998)

MapTab:CreateButton({
   Name = "Active ESP",
   Callback = function()
      for _, player in pairs(game.Players:GetChildren()) do
         if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if not player.Character.HumanoidRootPart:FindFirstChild("Highlight") then
               local highlight = Instance.new("Highlight")
               highlight.Parent = player.Character
               highlight.FillColor = Color3.fromRGB(255, 0, 0)
               highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
         end
      end
   end,
})
