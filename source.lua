	--\\ Services //--
	local VoiceChatService = game:GetService("VoiceChatService")
	
	--\\ Varaibles //--
	local LocalPlayer = game.Players.LocalPlayer
	local MainScreen: ScreenGui
	
	--\\ Methods //--
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
		local PXLHub = Instance.new("ScreenGui")
		local StartFrame = Instance.new("Frame")
		local Title = Instance.new("TextLabel")
		local Content = Instance.new("TextLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local Content_2 = Instance.new("TextLabel")
		local MainHack = Instance.new("Frame")
		local Title_2 = Instance.new("TextLabel")
		local Choose = Instance.new("ScrollingFrame")
		local TargetPlr = Instance.new("TextButton")
		local UIListLayout = Instance.new("UIListLayout")
		local Misc = Instance.new("TextButton")
		local Frames = Instance.new("Folder")
		local TargetPlr_2 = Instance.new("ScrollingFrame")
		local PlayerNameToSelect = Instance.new("TextBox")
		local SelectedPlayerDisplay = Instance.new("TextLabel")
		local TP = Instance.new("TextButton")
		local Misc_2 = Instance.new("ScrollingFrame")
		local UnbanMic = Instance.new("TextButton")
		local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
		local Sounds = Instance.new("Folder")
		
		--Properties:

		PXLHub.Name = "PXLHub"
		PXLHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		PXLHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

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
		Title.Font = Enum.Font.Roboto
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
		Content.Font = Enum.Font.Roboto
		Content.Text = "Thanks for using PXL Hub ...<br/>Credits: P_exile<br/>Loading ..."
		Content.TextColor3 = Color3.fromRGB(255, 255, 255)
		Content.TextSize = 18.000
		Content.TextTransparency = 0.200
		Content.TextWrapped = true
		Content.TextXAlignment = Enum.TextXAlignment.Left
		Content.TextYAlignment = Enum.TextYAlignment.Top

		UIAspectRatioConstraint.Parent = StartFrame
		UIAspectRatioConstraint.AspectRatio = 2.726

		Content_2.Name = "Start"
		Content_2.Parent = StartFrame
		Content_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content_2.BackgroundTransparency = 1.000
		Content_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content_2.BorderSizePixel = 0
		Content_2.Position = UDim2.new(0.027173873, 0, 0.771593273, 0)
		Content_2.Size = UDim2.new(0.945652246, 0, 0.148220047, 0)
		Content_2.Font = Enum.Font.Roboto
		Content_2.Text = "/Start"
		Content_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Content_2.TextSize = 18.000
		Content_2.TextTransparency = 0.200
		Content_2.TextWrapped = true
		Content_2.TextXAlignment = Enum.TextXAlignment.Left
		Content_2.TextYAlignment = Enum.TextYAlignment.Top

		MainHack.Name = "MainHack"
		MainHack.Parent = PXLHub
		MainHack.AnchorPoint = Vector2.new(0.5, 0.5)
		MainHack.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		MainHack.BackgroundTransparency = 0.200
		MainHack.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MainHack.BorderSizePixel = 0
		MainHack.Position = UDim2.new(0.49930653, 0, 0.511348367, 0)
		MainHack.Size = UDim2.new(0.536754489, 0, 0.39967373, 0)
		MainHack.Visible = false

		Title_2.Name = "Title"
		Title_2.Parent = MainHack
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_2.BorderSizePixel = 0
		Title_2.Position = UDim2.new(0.228260875, 0, 0.0414209478, 0)
		Title_2.Size = UDim2.new(0.543478251, 0, 0.106122449, 0)
		Title_2.Font = Enum.Font.Roboto
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
		Choose.Position = UDim2.new(0.0180878546, 0, 0.183673471, 0)
		Choose.Size = UDim2.new(0.36434108, 0, 0.783673465, 0)
		Choose.CanvasSize = UDim2.new(0, 0, 0.75, 0)
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
		TargetPlr.Text = "TargetPlr"
		TargetPlr.TextColor3 = Color3.fromRGB(255, 255, 255)
		TargetPlr.TextSize = 14.000
		TargetPlr.TextTransparency = 0.200

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
		Misc.Text = "Misc"
		Misc.TextColor3 = Color3.fromRGB(255, 255, 255)
		Misc.TextSize = 14.000
		Misc.TextTransparency = 0.200

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
		PlayerNameToSelect.Font = Enum.Font.Roboto
		PlayerNameToSelect.PlaceholderText = "PlayerName"
		PlayerNameToSelect.Text = ""
		PlayerNameToSelect.TextColor3 = Color3.fromRGB(255, 255, 255)
		PlayerNameToSelect.TextTransparency = 0.2
		PlayerNameToSelect.TextSize = 14.000

		SelectedPlayerDisplay.Name = "SelectedPlayerDisplay"
		SelectedPlayerDisplay.Parent = TargetPlr_2
		SelectedPlayerDisplay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SelectedPlayerDisplay.BackgroundTransparency = 1.000
		SelectedPlayerDisplay.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SelectedPlayerDisplay.BorderSizePixel = 0
		SelectedPlayerDisplay.Position = UDim2.new(0.0572687238, 0, 0, 0)
		SelectedPlayerDisplay.Size = UDim2.new(0, 200, 0, 17)
		SelectedPlayerDisplay.Font = Enum.Font.Roboto
		SelectedPlayerDisplay.Text = ""
		SelectedPlayerDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
		SelectedPlayerDisplay.TextSize = 14.000
		SelectedPlayerDisplay.TextTransparency = 0.200

		TP.Name = "TP"
		TP.Parent = TargetPlr_2
		TP.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		TP.BackgroundTransparency = 0.800
		TP.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TP.BorderSizePixel = 0
		TP.Position = UDim2.new(0.528634369, 0, 0.291666657, 0)
		TP.Size = UDim2.new(0.374449313, 0, 0.145833328, 0)
		TP.Font = Enum.Font.Roboto
		TP.Text = "TP"
		TP.TextColor3 = Color3.fromRGB(255, 255, 255)
		TP.TextSize = 14.000
		TP.TextTransparency = 0.200

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
		UnbanMic.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		UnbanMic.BackgroundTransparency = 0.800
		UnbanMic.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UnbanMic.BorderSizePixel = 0
		UnbanMic.Position = UDim2.new(0.528634369, 0, 0.0677083358, 0)
		UnbanMic.Size = UDim2.new(0.374449313, 0, 0.145833328, 0)
		UnbanMic.Font = Enum.Font.Roboto
		UnbanMic.Text = "UnbanMic"
		UnbanMic.TextColor3 = Color3.fromRGB(255, 255, 255)
		UnbanMic.TextSize = 14.000
		UnbanMic.TextTransparency = 0.200

		UIAspectRatioConstraint_2.Parent = MainHack
		UIAspectRatioConstraint_2.AspectRatio = 1.580

		Sounds.Name = "Sounds"
		Sounds.Parent = PXLHub
		
		return PXLHub :: ScreenGui
	end
	
	local function LoadGui_Sec()
		MainScreen.StartFrame.Content.RichText = true
		Instance.new("UIDragDetector", MainScreen.MainHack)
	end
	
	local function Setup()
		--\\ SetupChoose
		for _, Button: TextButton in MainScreen.MainHack.Choose:GetChildren() do
			if not Button:IsA("TextButton") then continue end
			Button.MouseButton1Click:Connect(function()
				OpenFrame(MainScreen.MainHack.Frames[Button.Name])
			end)
		end
		
		--\\SetupUnBanMic
		MainScreen.MainHack.Frames.Misc.UnbanMic.MouseButton1Click:Connect(function()
			VoiceChatService:joinVoice()
		end)
		
		--\\ SetupPlayerSelector
		MainScreen.MainHack.Frames.TargetPlr.PlayerNameToSelect:GetPropertyChangedSignal("Text"):Connect(function()
			PlaySound("TextSound")
			local Player = GetPlayerFromSomeTextText(MainScreen.MainHack.Frames.TargetPlr.PlayerNameToSelect.Text)
			MainScreen.MainHack.Frames.TargetPlr.SelectedPlayerDisplay.Text = ""
			if not Player then return end
			SelectedPlayer = Player
			MainScreen.MainHack.Frames.TargetPlr.SelectedPlayerDisplay.Text = `{Player.DisplayName}(@{Player.Name}) Selected !`
		end)
		
		MainScreen.MainHack.Frames.TargetPlr.TP.MouseButton1Click:Connect(function()
			if not SelectedPlayer then return end
			LocalPlayer.Character:PivotTo(SelectedPlayer.Character:GetPivot())
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
