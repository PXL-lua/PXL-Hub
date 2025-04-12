	--\\ Services //--
	local VoiceChatService = game:GetService("VoiceChatService")
	
	--\\ Varaibles //--
	local LocalPlayer = game.Players.LocalPlayer
	local Cam = game.Workspace.CurrentCamera
	local MainScreen: ScreenGui
	
	--\\ Methods //--
	local Colors = {
		NormalButtonColor = Color3.new(0.176471, 0.176471, 0.176471);
		ToggledButtonColor = Color3.new(0.34902, 0.34902, 0.34902);
	}
	local Places = {
		["ShaletM"] = 1575090225
	}
	local Sounds = {
		["TextSound"] = "rbxassetid://5416666166";
		["BigTextSound"] = "rbxassetid://7367827725";
	}
	local SelectedPlayer: Player
		
	--\\ Types //--
	export type SoundName = 
		"TextSound"|
		"BigTextSound"
	
	
	--\\ LocalFunctions //--
	local function GetPlayerFromSomeTextText(Text: string): Player
		local HighestInDis: Player = nil
		local HighestInUse: Player = nil
		local HighestDisScore: number = 0
		local HighestUseScore: number = 0
		for _, Player: Player in game.Players:GetPlayers() do
			--if Player == LocalPlayer then continue end
			local PlayerDisScore = string.match(Player.DisplayName:lower(), Text:lower()) or ""
			local PlayerUseScore = string.match(Player.Name:lower(), Text:lower()) or ""
			print(PlayerDisScore)
			print(PlayerUseScore)
			if #PlayerDisScore > HighestDisScore then
				HighestDisScore = #PlayerDisScore
				HighestInDis = Player
			end
			if #PlayerUseScore > HighestUseScore then
				HighestUseScore = #PlayerUseScore
				HighestInUse = Player
			end
		end
		if HighestUseScore > HighestDisScore then
			return HighestInUse
		else
			return HighestInDis
		end
	end
	
	local function PlaySound(SoundName: SoundName)
		local SoundID: string = Sounds[SoundName]
		if not SoundID then return end
		local NewSound: Sound = Instance.new("Sound")
		NewSound.Name = SoundName
		NewSound.SoundId = SoundID
		NewSound.Parent = game:GetService("SoundService")
		NewSound:Play()
		NewSound.Ended:Once(function() NewSound:Destroy() end)
	end
	
	local function OpenFrame(Frame: Frame)
		for i,v in MainScreen.MainHack.Frames:GetChildren() do
			v.Visible = false
		end
		Frame.Visible = true
	end
	
	local function TweenText(TextLabel: TextLabel,Target: string, Time: number)
		TextLabel.Text = "_"
		task.wait(0.3)
		for i = 1, #Target do
			TextLabel.Text = `{string.sub(Target, 1, i)}_`
			PlaySound("TextSound")
			task.wait(Time / #Target)
			if i == #Target then TextLabel.Text = Target end
		end
	end
	
	--\\ MainFunctions //--
	local function LoadGui() : ScreenGui
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local PXLHub = Instance.new("ScreenGui")
		local StartFrame = Instance.new("Frame")
		local Title = Instance.new("TextLabel")
		local Content = Instance.new("TextLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local Start = Instance.new("TextLabel")
		local MainHack = Instance.new("Frame")
		local Title_2 = Instance.new("TextLabel")
		local Choose = Instance.new("ScrollingFrame")
		local TargetPlr = Instance.new("TextButton")
		local TextLabel = Instance.new("TextLabel")
		local UIListLayout = Instance.new("UIListLayout")
		local Misc = Instance.new("TextButton")
		local TextLabel_2 = Instance.new("TextLabel")
		local _1575090225 = Instance.new("TextButton")
		local TextLabel_3 = Instance.new("TextLabel")
		local Frames = Instance.new("Folder")
		local TargetPlr_2 = Instance.new("ScrollingFrame")
		local PlayerNameToSelect = Instance.new("TextBox")
		local SelectedPlayerDisplay = Instance.new("TextLabel")
		local TP = Instance.new("TextButton")
		local TextLabel_4 = Instance.new("TextLabel")
		local See = Instance.new("TextButton")
		local TextLabel_5 = Instance.new("TextLabel")
		local Misc_2 = Instance.new("ScrollingFrame")
		local UnbanMic = Instance.new("TextButton")
		local TextLabel_6 = Instance.new("TextLabel")
		local _1575090225_2 = Instance.new("ScrollingFrame")
		local LockSkin = Instance.new("TextButton")
		local TextLabel_7 = Instance.new("TextLabel")
		local LockName = Instance.new("TextButton")
		local TextLabel_8 = Instance.new("TextLabel")
		local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
		local Sounds = Instance.new("Folder")

		--Properties:

		PXLHub.Name = "PXLHub"
		PXLHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		PXLHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		PXLHub.ResetOnSpawn = false

		StartFrame.Name = "StartFrame"
		StartFrame.Parent = PXLHub
		StartFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		StartFrame.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		StartFrame.BackgroundTransparency = 0.200
		StartFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		StartFrame.BorderSizePixel = 0
		StartFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		StartFrame.Size = UDim2.new(0.500680268, 0, 0.219869703, 0)
		StartFrame.Visible = false

		Title.Name = "Title"
		Title.Parent = StartFrame
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0.228260875, 0, 0.0740740746, 0)
		Title.Size = UDim2.new(0.543478251, 0, 0.200000003, 0)
		Title.Font = Enum.Font.Nunito
		Title.Text = "PXL Hub"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextTransparency = 0.200
		Title.TextWrapped = true

		Content.Name = "Content"
		Content.Parent = StartFrame
		Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content.BackgroundTransparency = 1.000
		Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content.BorderSizePixel = 0
		Content.Position = UDim2.new(0.0271739122, 0, 0.318518519, 0)
		Content.Size = UDim2.new(0.945652187, 0, 0.533333361, 0)
		Content.Font = Enum.Font.Nunito
		Content.Text = "Thanks for using PXL Hub ...<br/>Credits: P_exile<br/>Loading ..."
		Content.TextColor3 = Color3.fromRGB(255, 255, 255)
		Content.TextSize = 18.000
		Content.TextTransparency = 0.200
		Content.TextWrapped = true
		Content.TextXAlignment = Enum.TextXAlignment.Left
		Content.TextYAlignment = Enum.TextYAlignment.Top

		UIAspectRatioConstraint.Parent = StartFrame
		UIAspectRatioConstraint.AspectRatio = 2.726

		Start.Name = "Start"
		Start.Parent = StartFrame
		Start.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Start.BackgroundTransparency = 1.000
		Start.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Start.BorderSizePixel = 0
		Start.Position = UDim2.new(0.027173873, 0, 0.771593273, 0)
		Start.Size = UDim2.new(0.945652246, 0, 0.148220047, 0)
		Start.Font = Enum.Font.Nunito
		Start.Text = "/Start"
		Start.TextColor3 = Color3.fromRGB(255, 255, 255)
		Start.TextSize = 18.000
		Start.TextTransparency = 0.200
		Start.TextWrapped = true
		Start.TextXAlignment = Enum.TextXAlignment.Left
		Start.TextYAlignment = Enum.TextYAlignment.Top

		MainHack.Name = "MainHack"
		MainHack.Parent = PXLHub
		MainHack.AnchorPoint = Vector2.new(0.5, 0.5)
		MainHack.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		MainHack.BackgroundTransparency = 0.200
		MainHack.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MainHack.BorderSizePixel = 0
		MainHack.ClipsDescendants = true
		MainHack.Position = UDim2.new(0.49930653, 0, 0.511348367, 0)
		MainHack.Size = UDim2.new(0.536754489, 0, 0.39967373, 0)

		Title_2.Name = "Title"
		Title_2.Parent = MainHack
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_2.BorderSizePixel = 0
		Title_2.Position = UDim2.new(0.228260875, 0, 0.0414209478, 0)
		Title_2.Size = UDim2.new(0.543478251, 0, 0.106122449, 0)
		Title_2.Font = Enum.Font.Nunito
		Title_2.Text = "PXL Hub"
		Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.TextScaled = true
		Title_2.TextSize = 14.000
		Title_2.TextTransparency = 0.200
		Title_2.TextWrapped = true

		Choose.Name = "Choose"
		Choose.Parent = MainHack
		Choose.Active = true
		Choose.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		Choose.BackgroundTransparency = 1.000
		Choose.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Choose.BorderSizePixel = 0
		Choose.Position = UDim2.new(-0.0357083902, 0, 0.183673412, 0)
		Choose.Size = UDim2.new(0.418137312, 0, 0.783673465, 0)
		Choose.CanvasSize = UDim2.new(0, 0, 1, 0)
		Choose.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

		TargetPlr.Name = "TargetPlr"
		TargetPlr.Parent = Choose
		TargetPlr.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		TargetPlr.BackgroundTransparency = 0.700
		TargetPlr.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TargetPlr.BorderSizePixel = 0
		TargetPlr.Position = UDim2.new(0.0992907807, 0, 0, 0)
		TargetPlr.Size = UDim2.new(0.900709093, 0, 0.171875, 0)
		TargetPlr.Font = Enum.Font.Roboto
		TargetPlr.Text = ""
		TargetPlr.TextColor3 = Color3.fromRGB(255, 255, 255)
		TargetPlr.TextSize = 14.000
		TargetPlr.TextTransparency = 0.200
		TargetPlr.TextWrapped = true

		TextLabel.Parent = TargetPlr
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(1, 0, 0.600000024, 0)
		TextLabel.Font = Enum.Font.Nunito
		TextLabel.Text = "TargetPlr"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextTransparency = 0.200
		TextLabel.TextWrapped = true

		UIListLayout.Parent = Choose
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 2)

		Misc.Name = "Misc"
		Misc.Parent = Choose
		Misc.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		Misc.BackgroundTransparency = 0.700
		Misc.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Misc.BorderSizePixel = 0
		Misc.Position = UDim2.new(0.0992907807, 0, 0, 0)
		Misc.Size = UDim2.new(0.900709093, 0, 0.171875, 0)
		Misc.Font = Enum.Font.Roboto
		Misc.Text = ""
		Misc.TextColor3 = Color3.fromRGB(255, 255, 255)
		Misc.TextSize = 14.000
		Misc.TextTransparency = 0.200
		Misc.TextWrapped = true

		TextLabel_2.Parent = Misc
		TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_2.BorderSizePixel = 0
		TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_2.Size = UDim2.new(1, 0, 0.600000024, 0)
		TextLabel_2.Font = Enum.Font.Nunito
		TextLabel_2.Text = "Misc"
		TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.TextScaled = true
		TextLabel_2.TextSize = 14.000
		TextLabel_2.TextTransparency = 0.200
		TextLabel_2.TextWrapped = true

		_1575090225.Name = "1575090225"
		_1575090225.Parent = Choose
		_1575090225.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		_1575090225.BackgroundTransparency = 0.700
		_1575090225.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_1575090225.BorderSizePixel = 0
		_1575090225.Position = UDim2.new(0.0992907807, 0, 0, 0)
		_1575090225.Size = UDim2.new(0.900709093, 0, 0.171875, 0)
		_1575090225.Visible = false
		_1575090225.Font = Enum.Font.Roboto
		_1575090225.Text = ""
		_1575090225.TextColor3 = Color3.fromRGB(255, 255, 255)
		_1575090225.TextSize = 14.000
		_1575090225.TextTransparency = 0.200
		_1575090225.TextWrapped = true

		TextLabel_3.Parent = _1575090225
		TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_3.BackgroundTransparency = 1.000
		TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_3.BorderSizePixel = 0
		TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_3.Size = UDim2.new(1, 0, 0.600000024, 0)
		TextLabel_3.Font = Enum.Font.Nunito
		TextLabel_3.Text = "Game"
		TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_3.TextScaled = true
		TextLabel_3.TextSize = 14.000
		TextLabel_3.TextTransparency = 0.200
		TextLabel_3.TextWrapped = true

		Frames.Name = "Frames"
		Frames.Parent = MainHack

		TargetPlr_2.Name = "TargetPlr"
		TargetPlr_2.Parent = Frames
		TargetPlr_2.Active = true
		TargetPlr_2.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		TargetPlr_2.BackgroundTransparency = 0.700
		TargetPlr_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TargetPlr_2.BorderSizePixel = 0
		TargetPlr_2.Position = UDim2.new(0.397932827, 0, 0.183673471, 0)
		TargetPlr_2.Size = UDim2.new(0.586563289, 0, 0.783673465, 0)
		TargetPlr_2.CanvasSize = UDim2.new(0, 0, 1, 0)

		PlayerNameToSelect.Name = "PlayerNameToSelect"
		PlayerNameToSelect.Parent = TargetPlr_2
		PlayerNameToSelect.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		PlayerNameToSelect.BackgroundTransparency = 0.200
		PlayerNameToSelect.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PlayerNameToSelect.BorderSizePixel = 0
		PlayerNameToSelect.Position = UDim2.new(0.0572687238, 0, 0.09375, 0)
		PlayerNameToSelect.Size = UDim2.new(0.881057262, 0, 0.145833328, 0)
		PlayerNameToSelect.Font = Enum.Font.Nunito
		PlayerNameToSelect.PlaceholderText = "PlayerUsername"
		PlayerNameToSelect.Text = ""
		PlayerNameToSelect.TextColor3 = Color3.fromRGB(255, 255, 255)
		PlayerNameToSelect.TextSize = 14.000
		PlayerNameToSelect.TextTransparency = 0.200

		SelectedPlayerDisplay.Name = "SelectedPlayerDisplay"
		SelectedPlayerDisplay.Parent = TargetPlr_2
		SelectedPlayerDisplay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SelectedPlayerDisplay.BackgroundTransparency = 1.000
		SelectedPlayerDisplay.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SelectedPlayerDisplay.BorderSizePixel = 0
		SelectedPlayerDisplay.Position = UDim2.new(0.0572687238, 0, 0, 0)
		SelectedPlayerDisplay.Size = UDim2.new(0.934179902, 0, 0.0938802138, 0)
		SelectedPlayerDisplay.Font = Enum.Font.Nunito
		SelectedPlayerDisplay.Text = ""
		SelectedPlayerDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
		SelectedPlayerDisplay.TextScaled = true
		SelectedPlayerDisplay.TextSize = 14.000
		SelectedPlayerDisplay.TextTransparency = 0.200
		SelectedPlayerDisplay.TextWrapped = true

		TP.Name = "TP"
		TP.Parent = TargetPlr_2
		TP.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		TP.BackgroundTransparency = 0.200
		TP.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TP.BorderSizePixel = 0
		TP.Position = UDim2.new(0.528634369, 0, 0.291666657, 0)
		TP.Size = UDim2.new(0.374449313, 0, 0.145833328, 0)
		TP.Font = Enum.Font.Roboto
		TP.Text = ""
		TP.TextColor3 = Color3.fromRGB(255, 255, 255)
		TP.TextSize = 14.000
		TP.TextTransparency = 0.200

		TextLabel_4.Parent = TP
		TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_4.BackgroundTransparency = 1.000
		TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_4.BorderSizePixel = 0
		TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_4.Size = UDim2.new(1, 0, 0.600000024, 0)
		TextLabel_4.Font = Enum.Font.Nunito
		TextLabel_4.Text = "TP"
		TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_4.TextScaled = true
		TextLabel_4.TextSize = 14.000
		TextLabel_4.TextTransparency = 0.200
		TextLabel_4.TextWrapped = true

		See.Name = "See"
		See.Parent = TargetPlr_2
		See.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		See.BackgroundTransparency = 0.200
		See.BorderColor3 = Color3.fromRGB(0, 0, 0)
		See.BorderSizePixel = 0
		See.Position = UDim2.new(0.0549999997, 0, 0.291999996, 0)
		See.Size = UDim2.new(0.374449313, 0, 0.145833328, 0)
		See.Visible = false
		See.Font = Enum.Font.Roboto
		See.Text = ""
		See.TextColor3 = Color3.fromRGB(255, 255, 255)
		See.TextSize = 14.000
		See.TextTransparency = 0.200

		TextLabel_5.Parent = See
		TextLabel_5.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_5.BackgroundTransparency = 1.000
		TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_5.BorderSizePixel = 0
		TextLabel_5.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_5.Size = UDim2.new(1, 0, 0.600000024, 0)
		TextLabel_5.Font = Enum.Font.Nunito
		TextLabel_5.Text = "See"
		TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_5.TextScaled = true
		TextLabel_5.TextSize = 14.000
		TextLabel_5.TextTransparency = 0.200
		TextLabel_5.TextWrapped = true

		Misc_2.Name = "Misc"
		Misc_2.Parent = Frames
		Misc_2.Active = true
		Misc_2.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		Misc_2.BackgroundTransparency = 0.700
		Misc_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Misc_2.BorderSizePixel = 0
		Misc_2.Position = UDim2.new(0.397932827, 0, 0.183673471, 0)
		Misc_2.Size = UDim2.new(0.586563289, 0, 0.783673465, 0)
		Misc_2.Visible = false
		Misc_2.CanvasSize = UDim2.new(0, 0, 1, 0)

		UnbanMic.Name = "UnbanMic"
		UnbanMic.Parent = Misc_2
		UnbanMic.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		UnbanMic.BackgroundTransparency = 0.200
		UnbanMic.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UnbanMic.BorderSizePixel = 0
		UnbanMic.Position = UDim2.new(0.506360829, 0, 0.110247962, 0)
		UnbanMic.Size = UDim2.new(0.418996453, 0, 0.186089396, 0)
		UnbanMic.Font = Enum.Font.Roboto
		UnbanMic.Text = ""
		UnbanMic.TextColor3 = Color3.fromRGB(255, 255, 255)
		UnbanMic.TextSize = 14.000
		UnbanMic.TextTransparency = 0.200

		TextLabel_6.Parent = UnbanMic
		TextLabel_6.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_6.BackgroundTransparency = 1.000
		TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_6.BorderSizePixel = 0
		TextLabel_6.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_6.Size = UDim2.new(1, 0, 0.400000006, 0)
		TextLabel_6.Font = Enum.Font.Nunito
		TextLabel_6.Text = "UnbanMic"
		TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_6.TextScaled = true
		TextLabel_6.TextSize = 14.000
		TextLabel_6.TextTransparency = 0.200
		TextLabel_6.TextWrapped = true

		_1575090225_2.Name = "1575090225"
		_1575090225_2.Parent = Frames
		_1575090225_2.Active = true
		_1575090225_2.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		_1575090225_2.BackgroundTransparency = 0.700
		_1575090225_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_1575090225_2.BorderSizePixel = 0
		_1575090225_2.Position = UDim2.new(0.397932827, 0, 0.183673471, 0)
		_1575090225_2.Size = UDim2.new(0.586563289, 0, 0.783673465, 0)
		_1575090225_2.Visible = false
		_1575090225_2.CanvasSize = UDim2.new(0, 0, 1, 0)

		LockSkin.Name = "LockSkin"
		LockSkin.Parent = _1575090225_2
		LockSkin.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		LockSkin.BackgroundTransparency = 0.200
		LockSkin.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LockSkin.BorderSizePixel = 0
		LockSkin.Position = UDim2.new(0.506360829, 0, 0.110247962, 0)
		LockSkin.Size = UDim2.new(0.418996453, 0, 0.186089396, 0)
		LockSkin.Font = Enum.Font.Roboto
		LockSkin.Text = ""
		LockSkin.TextColor3 = Color3.fromRGB(255, 255, 255)
		LockSkin.TextSize = 14.000
		LockSkin.TextTransparency = 0.200

		TextLabel_7.Parent = LockSkin
		TextLabel_7.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_7.BackgroundTransparency = 1.000
		TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_7.BorderSizePixel = 0
		TextLabel_7.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_7.Size = UDim2.new(1, 0, 0.400000006, 0)
		TextLabel_7.Font = Enum.Font.Nunito
		TextLabel_7.Text = "LockSkin"
		TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_7.TextScaled = true
		TextLabel_7.TextSize = 14.000
		TextLabel_7.TextTransparency = 0.200
		TextLabel_7.TextWrapped = true

		LockName.Name = "LockName"
		LockName.Parent = _1575090225_2
		LockName.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		LockName.BackgroundTransparency = 0.200
		LockName.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LockName.BorderSizePixel = 0
		LockName.Position = UDim2.new(0.0329999998, 0, 0.109999999, 0)
		LockName.Size = UDim2.new(0.418996453, 0, 0.186089396, 0)
		LockName.Font = Enum.Font.Roboto
		LockName.Text = ""
		LockName.TextColor3 = Color3.fromRGB(255, 255, 255)
		LockName.TextSize = 14.000
		LockName.TextTransparency = 0.200

		TextLabel_8.Parent = LockName
		TextLabel_8.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_8.BackgroundTransparency = 1.000
		TextLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_8.BorderSizePixel = 0
		TextLabel_8.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_8.Size = UDim2.new(1, 0, 0.400000006, 0)
		TextLabel_8.Font = Enum.Font.Nunito
		TextLabel_8.Text = "LockName"
		TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_8.TextScaled = true
		TextLabel_8.TextSize = 14.000
		TextLabel_8.TextTransparency = 0.200
		TextLabel_8.TextWrapped = true

		UIAspectRatioConstraint_2.Parent = MainHack
		UIAspectRatioConstraint_2.AspectRatio = 1.580

		Sounds.Name = "Sounds"
		Sounds.Parent = PXLHub
		
		return PXLHub :: ScreenGui
	end
	
	local function LoadGui_Sec()
		local MapChoose = MainScreen.MainHack.Choose:FindFirstChild(game.PlaceId)
		
		MainScreen.StartFrame.Content.RichText = true
		Instance.new("UIDragDetector", MainScreen.MainHack)
		if MapChoose then
			MapChoose.Visible = true
		end
	end
	
	local function Setup()
		--\\ SetupChoose
		for _, Button: TextButton in MainScreen.MainHack.Choose:GetChildren() do
			if not Button:IsA("TextButton") then continue end
			Button.MouseButton1Click:Connect(function()
				OpenFrame(MainScreen.MainHack.Frames[Button.Name])
			end)
		end
		
		--\\ Misc -> UnBanMic
		MainScreen.MainHack.Frames.Misc.UnbanMic.MouseButton1Click:Connect(function()
			VoiceChatService:joinVoice()
		end)
		
		--\\ TargetPlayer -> PlayerSelector
		MainScreen.MainHack.Frames.TargetPlr.PlayerNameToSelect:GetPropertyChangedSignal("Text"):Connect(function()
			PlaySound("TextSound")
			local Player = GetPlayerFromSomeTextText(MainScreen.MainHack.Frames.TargetPlr.PlayerNameToSelect.Text)
			MainScreen.MainHack.Frames.TargetPlr.SelectedPlayerDisplay.Text = ""
			if not Player then return end
			SelectedPlayer = Player
			MainScreen.MainHack.Frames.TargetPlr.SelectedPlayerDisplay.Text = `{Player.DisplayName}(@{Player.Name}) Selected !`
		end)
		
		--\\ TargetPlayer -> TP
		MainScreen.MainHack.Frames.TargetPlr.TP.MouseButton1Click:Connect(function()
			if not SelectedPlayer then return end
			LocalPlayer.Character:PivotTo(SelectedPlayer.Character:GetPivot())
		end)
		
		--\\ TargetPlayer -> See
		local See_Toggled = false
		MainScreen.MainHack.Frames.TargetPlr.See.MouseButton1Click:Connect(function()
			if not See_Toggled then
				if not SelectedPlayer then return end
				See_Toggled = true
				MainScreen.MainHack.Frames.TargetPlr.See.BackgroundColor3 = Colors.ToggledButtonColor
				Cam.CameraSubject = SelectedPlayer.Character.Humanoid
			else
				See_Toggled = false
				MainScreen.MainHack.Frames.TargetPlr.See.BackgroundColor3 = Colors.NormalButtonColor
				Cam.CameraSubject = LocalPlayer.Character.Humanoid
			end
		end)
		
		--\\ShaletM\\
		local ShaletMLockName_Toggled = false
		local ShaletMLockName_SpawnConnection
		local ShaletMLockName_ChangedConnection
		local ShaletMLockSkin_Toggled = false
		local ShaletMLockSkin_SpawnConnection
		local ShaletMLockSkin_ChangedConnection
		
		export type ShaletMChar = Model & {
			Head: BasePart & {
				HDAdminTitle : BillboardGui & {
					TextLabel: TextLabel
				}
			};
			Humanoid: Humanoid
		}
		--\\ ShaletM -> LockName
		MainScreen.MainHack.Frames[Places.ShaletM].LockName.MouseButton1Click:Connect(function()
			local LocalPlayerCharacter: ShaletMChar = LocalPlayer.Character
			
			if not ShaletMLockName_Toggled then
				MainScreen.MainHack.Frames[Places.ShaletM].LockName.BackgroundColor3 = Colors.ToggledButtonColor
				ShaletMLockName_Toggled = true
				local function Reset()
					game.ReplicatedStorage.PrivateCommands.Title:FireServer()
				end
				local function SetupPlayerSpawn()
					ShaletMLockName_ChangedConnection = LocalPlayerCharacter.Head.HDAdminTitle.TextLabel:GetPropertyChangedSignal("Text"):Connect(Reset)
				end
				ShaletMLockName_SpawnConnection = LocalPlayer.CharacterAdded:Connect(SetupPlayerSpawn)
			else
				MainScreen.MainHack.Frames[Places.ShaletM].LockName.BackgroundColor3 = Colors.NormalButtonColor
				ShaletMLockName_Toggled = false
				ShaletMLockName_SpawnConnection:Disconnect()
				ShaletMLockName_ChangedConnection:Disconnect()
			end
		end)
		
		--\\ ShaletM -> LockSkin
		MainScreen.MainHack.Frames[Places.ShaletM].LockSkin.MouseButton1Click:Connect(function()
			local LocalPlayerCharacter: ShaletMChar = LocalPlayer.Character
			
			if not ShaletMLockSkin_Toggled then
				MainScreen.MainHack.Frames[Places.ShaletM].LockName.BackgroundColor3 = Colors.ToggledButtonColor
				ShaletMLockSkin_Toggled = true
				local function Reset()
					game.ReplicatedStorage.PrivateCommands.Char:FireServer()
				end
				local function SetupPlayerSpawn()
					ShaletMLockSkin_ChangedConnection = LocalPlayerCharacter.Humanoid.ApplyDescriptionFinished:Connect(Reset)
				end
				ShaletMLockSkin_SpawnConnection = LocalPlayer.CharacterAdded:Connect(SetupPlayerSpawn)
			else
				MainScreen.MainHack.Frames[Places.ShaletM].LockName.BackgroundColor3 = Colors.NormalButtonColor
				ShaletMLockSkin_Toggled = false
				ShaletMLockSkin_SpawnConnection:Disconnect()
				ShaletMLockSkin_ChangedConnection:Disconnect()
			end
		end)
	end
	
	local function StartHack()
		MainScreen.StartFrame.Title.Visible = false
		MainScreen.StartFrame.Content.Visible = false
		MainScreen.StartFrame.Start.Visible = false
		
		task.wait(2.5)
		
		MainScreen.StartFrame.Visible = true
		PlaySound("BigTextSound")
		
		task.wait(1.5)
		
		MainScreen.StartFrame.Title.Visible = true
		TweenText(MainScreen.StartFrame.Title, MainScreen.StartFrame.Title.Text, 0.75)
		
		task.wait(1.5)
		
		MainScreen.StartFrame.Content.Visible = true
		TweenText(MainScreen.StartFrame.Content, MainScreen.StartFrame.Content.Text, 3)
		
		Setup()
		
		task.wait(1)
		
		MainScreen.StartFrame.Start.Visible = true
		TweenText(MainScreen.StartFrame.Start, MainScreen.StartFrame.Start.Text, 1)
		
		MainScreen.StartFrame:Destroy()
		MainScreen.MainHack.Visible = true
		PlaySound("BigTextSound")
	end
	
	MainScreen = LoadGui()
	LoadGui_Sec()
	MainScreen.Parent = LocalPlayer.PlayerGui
	
	StartHack()
