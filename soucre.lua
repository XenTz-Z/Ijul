if tostring(game.PlaceId) == "18688206652" then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
OrionLib:MakeNotification({ Name = "Ijul Piece 2", Content = "by XIE and Hao Modder", Image = "rbxthumb://type=Asset&id=104004670815583&w=150&h=150", Time = 5 })

local Window = OrionLib:MakeWindow({ Name = "Ijul Piece 2 | Hao Modder", HidePremium = false, SaveConfig = true, ConfigFolder = "XIE", IntroText = "script farm", IntroIcon = "rbxthumb://type=Asset&id=77349212873128&w=150&h=150" })

local Tab1 = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://10723407389",
	PremiumOnly = false
})

local Items = Tab1:AddSection({
	Name = "Items"
})

local sukunaskill = false
local iceskill = false

Items:AddDropdown({
	Name = "Select",
	Default = "",
	Options = {"Sukuna", "Ice Awakening"},
	Callback = function(state)
        sukunaskill = state
        iceskill = state
	end    
})

-- function atoch

local UIS = game:GetService("UserInputService") 
local VirtualInputManager = game:GetService("VirtualInputManager") 
local RunService = game:GetService("RunService") 

local function pressKeyE()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game) 
    wait(0.1) 
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game) 
end

Items:AddButton({
	Name = "Teleport",
	Callback = function()
        if sukunaskill then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1061.43738, 92.1607361, 101.183472, -0.697700858, 0.0441585705, 0.715026915, 0.125600129, 0.990178764, 0.0614053048, -0.705292881, 0.132650018, -0.69639492) 
            task.wait(1)
            pressKeyE()
        elseif iceskill then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2644.43213, 4.73413086, -483.230469, -0.62928617, 0, 0.777173758, 0, 1, 0, -0.777173758, 0, -0.62928617)
            task.wait(1)
            pressKeyE()
        end     
})

local ChangeTime = Tab1:AddSection({
    Name = "Change Time"
})

ChangeTime:AddParagraph("Time Default", "Sukuna: 33s - SnowIsland | Ice Awakening: 13s - AbondedSnowIsland")

local settime = 10

ChangeTime:AddSlider({
	Name = "Slider",
	Min = 1,
	Max = 100,
	Default = 10,
	Color = Color3.fromRGB(0,255,255),
	Increment = 1,
	ValueName = "second",
	Callback = function(state)
        settime = state
	end    
})

local AutoFarm = Tab1:AddSection({
    Name = "Farm & Teleport Island"
})

-- function

local Players = game:GetService("Players")

local function rspl(player)
    if player and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        rspl(player)
    end)
end)

local attack function()
    local localPlayer = Players.LocalPlayer
    if localPlayer and localPlayer.Character then
        local character = localPlayer.Character
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if sukunaskill then
            local skill = localPlayer.Backpack:FindFirstChild("Sukuna")
            local event = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
                and game:GetService("ReplicatedStorage").Events:FindFirstChild("MalevolentShrine")

            if humanoid and skill and event then
                pcall(function()
                    character.HumanoidRootPart.CFrame = CFrame.new(-2411.69824, 19.8741894, -598.203064, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    humanoid:EquipTool(skill)
                    event:FireServer()
                    task.wait(settime)
                    rspl(localPlayer)
                end)
            end
        end    

        elseif iceskill then
            local skill = localPlayer.Backpack:FindFirstChild("IceAwakening")
            local event = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
                and game:GetService("ReplicatedStorage").Events:FindFirstChild("IceAge")
                    
            if humanoid and skill and event then
                pcall(function()
                    character.HumanoidRootPart.CFrame = CFrame.new(2600.07031, 23.3707905, 1980.55969, 0.848060429, 0, 0.529899538, 0, 1, 0, -0.529899538, 0, 0.848060429)
                    task.wait(5)
                    humanoid:EquipTool(skill)
                    event:FireServer()
                    task.wait(settime)
                    rspl(localPlayer)
                end)
            end
        end
    end
end

local autofarm = false

AutoFarm:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(state)
        autofarm = state
        if autofarm then
            spawn(function()
                while autofarm do
                    attack()
                    task.wait(1) 
                end
            end)
	end    
})




local Tab2 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://10734950309",
	PremiumOnly = false
})

local Anti = Tab2:AddSection({
    Name = "Anti"
})

local afk = false

Anti:AddToggle({
    Name = "AFK",
    Default = false,
	Callback = function(state)
        afk = state
        if state then
            local VirtualUser = game:service('VirtualUser')
            game:service('Players').LocalPlayer.Idled:connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
	end 
})





OrionLib:Init()


else
game.Players.LocalPlayer:Kick("Error : Game Not Supported")
end
