-- Key System GUI | by h13w 🔐 + Effects

local keyRequired = "VIERT"
local keyLink = "https://link-hub.net/1370412/NF6aIamIYfPy"
local realScript = "https://raw.githubusercontent.com/h13w1/jshsh/refs/heads/main/hwhw.lua"

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "KeySystemGUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 160)
frame.Position = UDim2.new(0.5, -150, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

-- RGB Gradient
local gradient = Instance.new("UIGradient", frame)
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 150, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}
gradient.Rotation = 45

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0, 40)
label.Position = UDim2.new(0, 0, 0, 5)
label.Text = "🔐 Enter your Key"
label.Font = Enum.Font.GothamBold
label.TextColor3 = Color3.new(1, 1, 1)
label.TextSize = 18
label.BackgroundTransparency = 1

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.9, 0, 0, 35)
box.Position = UDim2.new(0.05, 0, 0, 55)
box.PlaceholderText = "Enter Key Here"
box.Font = Enum.Font.Gotham
box.TextColor3 = Color3.new(1, 1, 1)
box.TextSize = 14
box.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Instance.new("UICorner", box)

local activate = Instance.new("TextButton", frame)
activate.Size = UDim2.new(0.9, 0, 0, 35)
activate.Position = UDim2.new(0.05, 0, 0, 105)
activate.Text = "✅ Activate"
activate.Font = Enum.Font.GothamBold
activate.TextSize = 16
activate.TextColor3 = Color3.new(1, 1, 1)
activate.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
Instance.new("UICorner", activate)

-- زر تفعيل مؤقت
local debounce = false
activate.MouseButton1Click:Connect(function()
	if debounce then return end
	debounce = true

	local userKey = box.Text
	if userKey == keyRequired then
		label.Text = "✅ Correct key!"
		TweenService:Create(frame, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
		wait(0.5)
		frame:Destroy()
		loadstring(game:HttpGet(realScript))()
	else
		label.Text = "❌ Wrong key! Link copied."
		box.TextColor3 = Color3.fromRGB(255, 0, 0)
		setclipboard(keyLink)
	end

	wait(1.5)
	label.Text = "🔐 Enter your Key"
	box.TextColor3 = Color3.new(1, 1, 1)
	debounce = false
end)
