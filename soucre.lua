if tostring(game.PlaceId) == "18688206652" then
    
print("Ijul Piece 2 | Author Code: XIE")

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


-- all

local config = {
    settime = 33,
    sukunaskill = false,
    iceskill = false,
    afk = false
}

-- >

Items:AddDropdown({
	Name = "Select",
	Default = "",
    Save = true,
	Options = {"Sukuna", "Ice Awakening"},
	Callback = function(selectedOption)
    if selectedOption == "Sukuna" then
        config.sukunaskill = true
        config.iceskill = false
    elseif selectedOption == "Ice Awakening" then
        config.sukunaskill = false
        config.iceskill = true
    end
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
        if config.sukunaskill then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1061.43738, 92.1607361, 101.183472, -0.697700858, 0.0441585705, 0.715026915, 0.125600129, 0.990178764, 0.0614053048, -0.705292881, 0.132650018, -0.69639492) 
            task.wait(1)
            pressKeyE()
        elseif config.iceskill then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2644.43213, 4.73413086, -483.230469, -0.62928617, 0, 0.777173758, 0, 1, 0, -0.777173758, 0, -0.62928617)
            task.wait(1)
            pressKeyE()
        end     
    end
})

local ChangeTime = Tab1:AddSection({
    Name = "Change Time"
})

ChangeTime:AddParagraph("Time Default", "Sukuna: 33s - SnowIsland | Ice Awakening: 13s - AbondedSnowIsland")

ChangeTime:AddTextbox({
    Name = "Second",
    Default = "33", 
    Save = true,
    TextDisappear = false, 
    Callback = function(input)
        local newTime = tonumber(input) 
        if newTime and newTime > 0 then
            config.settime = newTime 
            print("Settime updated to:", newTime)
        else
            warn("Invalid input! Please enter a positive number.")
        end
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

local function attack()
    local localPlayer = Players.LocalPlayer
    if localPlayer and localPlayer.Character then
        local character = localPlayer.Character
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if config.sukunaskill then
            local skill = localPlayer.Backpack:FindFirstChild("Sukuna")
            local event = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
                and game:GetService("ReplicatedStorage").Events:FindFirstChild("MalevolentShrine")

            if humanoid and skill and event then
                pcall(function()
                    character.HumanoidRootPart.CFrame = CFrame.new(-2411.69824, 19.8741894, -598.203064, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    humanoid:EquipTool(skill)
                    event:FireServer()
                    task.wait(config.settime)
                    rspl(localPlayer)
                end)
            end   

        elseif config.iceskill then
            local skill = localPlayer.Backpack:FindFirstChild("IceAwakening")
            local event = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
                and game:GetService("ReplicatedStorage").Events:FindFirstChild("IceAge")
                    
            if humanoid and skill and event then
                pcall(function()
                    character.HumanoidRootPart.CFrame = CFrame.new(2600.07031, 23.3707905, 1980.55969, 0.848060429, 0, 0.529899538, 0, 1, 0, -0.529899538, 0, 0.848060429)
                    task.wait(5)
                    humanoid:EquipTool(skill)
                    event:FireServer()
                    task.wait(config.settime)
                    rspl(localPlayer)
                end)
            end
        end
    end
end

AutoFarm:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Save = true,
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

local afkConnection 

Anti:AddToggle({
    Name = "AFK",
    Default = false,
    Save = true,
    Callback = function(state)
        config.afk = state
        if config.afk then
            afkConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                local active = game:GetService("VirtualUser")
                active:CaptureController()
                active:ClickButton2(Vector2.new())
            end)
        else
            if afkConnection then
                afkConnection:Disconnect()
                afkConnection = nil
            end
        end
    end 
})





OrionLib:Init()


else
game.Players.LocalPlayer:Kick("Error : Game Not Supported")
end
