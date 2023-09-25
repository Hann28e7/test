local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local buttonBackgroundProperties = {["BackgroundColor3"] = Color3.fromRGB(207, 207, 207), ["Size"] = UDim2.new(0.954, 0, 0.126, 0)}
local buttonProperties = {["Position"] = UDim2.new(0.019, 0, 0.099, 0), ["Size"] = UDim2.new(0.96, 0, 0.785, 0)}
local i = Instance
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local plrGui = plr:WaitForChild("PlayerGui")
local Hann_scrpt = i.new("ScreenGui", plrGui)
local bv = {["ClientFlashlight"] = {["Debounce"] = false, ["Active"] = false}, ["InfiniteJump"] = {["Debounce"] = false, ["Active"] = false}}
local inputDown = false
Hann_scrpt.Name = "Hann_scrpt"
Hann_scrpt.ResetOnSpawn = false
local uiActive = true
local clientFlashlightPart = nil
local infjumpcooldown = false
coroutine.wrap(function()
	while true do
		if infjumpcooldown == true then
			wait(0.2)
			infjumpcooldown = false
		else
			wait()
		end
	end
end)()
local function setButtonBackground(frame, toggleable)
	frame.Size = buttonBackgroundProperties.Size
	if toggleable then
		frame.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
	else
		frame.BackgroundColor3 = buttonBackgroundProperties.BackgroundColor3
	end
	local uicorner = i.new("UICorner", frame)
	uicorner.CornerRadius = UDim.new(0.4, 0)
end
local function setButton(button, text, hasTextBox)
	button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	button.Position = buttonProperties.Position
	button.Size = buttonProperties.Size
	button.Text = text
	if hasTextBox then
		button.TextXAlignment = Enum.TextXAlignment.Left
	end
	i.new("TextButton").Font = Enum.Font.Highway
	button.TextScaled = true
	local uicorner = i.new("UICorner", button)
	uicorner.CornerRadius = UDim.new(0.4, 0)
end
local function addTextBox(background, defaultValue, longBox)
	local textBox = i.new("TextBox", background)
	if longBox == true then
		textBox.Position = UDim2.new(0.672, 0, 0.204, 0)
		textBox.Size = UDim2.new(0.305, 0, 0.591, 0)
		textBox.ClearTextOnFocus = false
	else
		textBox.Position = UDim2.new(0.855, 0,0.2, 0)
		textBox.Size = UDim2.new(0.122, 0, 0.591, 0)
	end
	textBox.BackgroundColor3 = Color3.fromRGB(207, 207, 207)
	textBox.PlaceholderColor3 = Color3.fromRGB(243, 243, 243)
	textBox.TextScaled = true
	textBox.PlaceholderText = tostring(defaultValue)
	textBox.Text = ""
	return textBox
end
local function switchBackgroundColor(background, active)
	local color = nil
	if active then
		color = Color3.fromRGB(0, 255, 0)
	else
		color = Color3.fromRGB(255, 0, 0)
	end
	local tween = tweenService:Create(background, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0), {["BackgroundColor3"] = color})
	tween:Play()
	return tween
end
local mainFrame = i.new("Frame", Hann_scrpt)
mainFrame.Name = "MainFrame"
mainFrame.BackgroundColor3 = Color3.fromRGB(207, 207, 207)
mainFrame.Size = UDim2.new(0.318, 0, 0.408, 0)
mainFrame.Position = UDim2.new(0.341, 0, 0.295, 0)
local mainFrameUICorner = i.new("UICorner", mainFrame)
mainFrameUICorner.CornerRadius = UDim.new(0, 8)
local scrollingFrame = i.new("ScrollingFrame", mainFrame)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingFrame.Position = UDim2.new(0.021, 0, 0.046, 0)
scrollingFrame.Size = UDim2.new(0.954, 0, 0.909, 0)
scrollingFrame.CanvasPosition = Vector2.new(0, 0)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
local minimize = i.new("TextButton", Hann_scrpt)
minimize.BackgroundColor3 = Color3.fromRGB(117, 117, 117)
minimize.Position = UDim2.new(0.771, 0, -0.001, 0)
minimize.Size = UDim2.new(0.033, 0, 0.064, 0)
minimize.FontFace = Font.fromEnum(Enum.Font.SourceSansBold)
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.Text = "-"
minimize.TextScaled = true
i.new("UICorner", minimize)
local uiListLayout = i.new("UIListLayout", scrollingFrame)
local clientFlashlightBackground = i.new("Frame", scrollingFrame)
setButtonBackground(clientFlashlightBackground, true)
local clientFlashlight = i.new("TextButton", clientFlashlightBackground)
setButton(clientFlashlight, "Client Lighting", false)
local infiniteJumpBackground = i.new("Frame", scrollingFrame)
setButtonBackground(infiniteJumpBackground, true)
local infiniteJump = i.new("TextButton", infiniteJumpBackground)
setButton(infiniteJump, "Infinite Jump", false)
local tptoRandomPlayerBackground = i.new("Frame", scrollingFrame)
setButtonBackground(tptoRandomPlayerBackground, false)
local tptoRandomPlayer = i.new("TextButton", tptoRandomPlayerBackground)
setButton(tptoRandomPlayer, "TP to Random Player", false)
local clipThroughBackground = i.new("Frame", scrollingFrame)
setButtonBackground(clipThroughBackground, false)
local clipThrough = i.new("TextButton", clipThroughBackground)
setButton(clipThrough, "Clip Through", false)
local setSpeedBackground = i.new("Frame", scrollingFrame)
setButtonBackground(setSpeedBackground, false)
local setSpeed = i.new("TextButton", setSpeedBackground)
setButton(setSpeed, "Set Speed", true)
local setSpeedBox = addTextBox(setSpeedBackground, 16)
local setJumpPowerBackground = i.new("Frame", scrollingFrame)
setButtonBackground(setJumpPowerBackground, false)
local setJumpPower = i.new("TextButton", setJumpPowerBackground)
setButton(setJumpPower, "Set JumpHeight", true)
local setJumpPowerBox = addTextBox(setJumpPowerBackground, 7.2)
local tptoPlayerBackground = i.new("Frame", scrollingFrame)
setButtonBackground(tptoPlayerBackground, false)
local tptoPlayer = i.new("TextButton", tptoPlayerBackground)
setButton(tptoPlayer, "TP to Player", true)
local tptoPlayerBox = addTextBox(tptoPlayerBackground, "username", true)
--[[coroutine.wrap(function()
	while true do
		local inpObj = mainFrame.InputEnded:Wait()
		if (inpObj.UserInputType == Enum.UserInputType.MouseButton1 or inpObj.UserInputType == Enum.UserInputType.Touch) and inpObj.UserInputState == Enum.UserInputState.End then
			inputDown = false
		else
			wait()
		end
	end
end)()
mainFrame.InputBegan:Connect(function(inpObj)
	if (inpObj.UserInputType == Enum.UserInputType.MouseButton1 or inpObj.UserInputType == Enum.UserInputType.Touch) and inpObj.UserInputState == Enum.UserInputState.Begin then
		inputDown = true
		local offset = Vector2.new(mainFrame.Position.X.Scale - (mouse.X / mouse.ViewSizeX), mainFrame.Position.Y.Scale - (mouse.Y / mouse.ViewSizeY))
		coroutine.wrap(function()
			repeat 
				mainFrame.Position = UDim2.new((mouse.X / mouse.ViewSizeX) + offset.X, 0, (mouse.Y / mouse.ViewSizeY) + offset.Y, 0)
				wait()
			until inputDown == false
		end)()
	end
end)--]]
coroutine.wrap(function()
	while true do
		game:GetService("RunService").RenderStepped:Wait()
		if clientFlashlightPart ~= nil then
			clientFlashlightPart.CFrame = plr.Character.HumanoidRootPart.CFrame
		end
	end
end)()
uis.JumpRequest:Connect(function()
	if bv.InfiniteJump.Active == true then
		if infjumpcooldown == false and plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
			infjumpcooldown = true
			plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)
minimize.MouseButton1Click:Connect(function()
	uiActive = not uiActive
	mainFrame.Visible = uiActive
	if uiActive then
		minimize.Text = "-"
	else
		minimize.Text = "+"
	end
end)
clientFlashlight.MouseButton1Click:Connect(function()
	if bv.ClientFlashlight.Debounce == false then
		bv.ClientFlashlight.Debounce = true
		bv.ClientFlashlight.Active = not bv.ClientFlashlight.Active
		local color = nil
		if bv.ClientFlashlight.Active == true then
			clientFlashlightPart = i.new("Part", workspace)
			clientFlashlightPart.Anchored = true
			clientFlashlightPart.CanCollide = false
			clientFlashlightPart.Transparency = 1
			local light = Instance.new("SpotLight", clientFlashlightPart)
			light.Angle = 180
			light.Brightness = 3
			light.Range = 60
		else
			clientFlashlightPart:Destroy()
		end
		coroutine.wrap(function()
			switchBackgroundColor(clientFlashlightBackground, bv.ClientFlashlight.Active).Completed:Wait()
			bv.ClientFlashlight.Debounce = false
		end)()
	end
end)
infiniteJump.MouseButton1Click:Connect(function()
	if bv.InfiniteJump.Debounce == false then
		bv.InfiniteJump.Debounce = true
		bv.InfiniteJump.Active = not bv.InfiniteJump.Active
		coroutine.wrap(function()
			switchBackgroundColor(infiniteJumpBackground, bv.InfiniteJump.Active).Completed:Wait()
			bv.InfiniteJump.Debounce = false
		end)()
	end
end)
tptoRandomPlayer.MouseButton1Click:Connect(function()
	local plrs = game.Players:GetPlayers()
	local updatedPlrs = {}
	for i, v in pairs(plrs) do
		if v ~= plr then
			table.insert(updatedPlrs, v)
		end
	end
	if #updatedPlrs > 0 then plr.Character.HumanoidRootPart.CFrame = updatedPlrs[math.random(1, #updatedPlrs)].Character.HumanoidRootPart.CFrame end
end)
clipThrough.MouseButton1Click:Connect(function()
	plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
end)
setSpeed.MouseButton1Click:Connect(function()
	local value = setSpeedBox.Text
	if typeof(tonumber(value)) == "number" then
		plr.Character.Humanoid.WalkSpeed = value
	end
end)
setJumpPower.MouseButton1Click:Connect(function()
	local value = setJumpPowerBox.Text
	if typeof(tonumber(value)) == "number" then
		plr.Character.Humanoid.JumpHeight = value
	end
end)
tptoPlayer.MouseButton1Click:Connect(function()
	local name = tptoPlayerBox.Text
	local plrs = game.Players:GetPlayers()
	for i, v in pairs(plrs) do
		if string.lower(v.Name) == string.lower(name) then
			plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
		end
	end
end)
