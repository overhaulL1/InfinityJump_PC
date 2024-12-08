wait()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character

local CharacterRoot = Character:FindFirstChild("HumanoidRootPart")
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

local TweenService = game:GetService("TweenService")
local ChatService = game:GetService("TextChatService")

local UserInput = game:GetService("UserInputService")
local canjump = true
local canfling = true
while task.wait() do
    Humanoid.UseJumpPower = true
    Humanoid.JumpPower = 0
    Humanoid.WalkSpeed = 0
	local isSpace = UserInput:IsKeyDown(Enum.KeyCode.Space)
	local isSemi = UserInput:IsKeyDown(Enum.KeyCode.Semicolon)
	local isRS = UserInput:IsKeyDown(Enum.KeyCode.RightControl)
	local isW = UserInput:IsKeyDown(Enum.KeyCode.W)
	local isA = UserInput:IsKeyDown(Enum.KeyCode.A)
	local isS = UserInput:IsKeyDown(Enum.KeyCode.S)
	local isD = UserInput:IsKeyDown(Enum.KeyCode.D)
	if isSpace and canjump and not ChatService:FindFirstChild("ChatInputBarConfiguration").IsFocused then
		warn('fakejumped')
		canjump = false
		Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		CharacterRoot.Velocity = Vector3.new(CharacterRoot.Velocity.X,50,CharacterRoot.Velocity.Z)
		repeat task.wait() until Humanoid:GetState() == Enum.HumanoidStateType.Running 
		canjump = true
	end
	if isSemi then
		Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		CharacterRoot.Velocity = CharacterRoot.Velocity * Vector3.new(0,50,0)
	end
	if isW then
		CharacterRoot.Velocity = CharacterRoot.CFrame.LookVector * 23
	end
    if isA then
        CharacterRoot.CFrame = CharacterRoot.CFrame * CFrame.fromEulerAnglesXYZ(0,0.08,0)
    end
    if isD then
        CharacterRoot.CFrame = CharacterRoot.CFrame * CFrame.fromEulerAnglesXYZ(0,-0.08,0)
    end
    if isS then
		CharacterRoot.Velocity = CharacterRoot.CFrame.LookVector * -23
	end
end
