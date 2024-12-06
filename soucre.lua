if tostring(game.PlaceId) == "18688206652" then

pcall(function()
	local vu=game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:Connect(function()
		vu:CaptureController()
		vu:ClickButton2(Vector2.new())
	end)
end)

local config = {
    settime = 12,
    sukunaskill = false,
    iceskill = false,
    windmill = false,
    snowisland1 = false,
    snowisland2 = false,
    abandoned = false,
    atrait = false,
    afamily = false
}

local Players = game:GetService("Players")

function rspl(player)
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

function tpequip(skillName)
    if skillName == "Sukuna" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1061.43738, 92.1607361, 101.183472, -0.697700858, 0.0441585705, 0.715026915, 0.125600129, 0.990178764, 0.0614053048, -0.705292881, 0.132650018, -0.69639492)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sukuna"))
    elseif skillName == "Ice Awakening" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2644.43213, 4.73413086, -483.230469, -0.62928617, 0, 0.777173758, 0, 1, 0, -0.777173758, 0, -0.62928617)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("IceAwakening"))
    end
end

local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/XenTz-Z/Orion/refs/heads/main/source")))()

local Window = OrionLib:MakeWindow({ Name = "XenTz-Z | Ijul Piece 2", ConfigFolder = "Orion", SaveConfig = true, IntroText = " ", IntroIcon = " " })

local Tabs = {
    Main = Window:MakeTab({ Name = "Main", Icon = "home" }),
    Other = Window:MakeTab({ Name = "Other", Icon = "more-horizontal" })
}

local Items = Tabs.Main:AddSection({ Name = "Items" })

Items:AddDropdown({
	Name = "Select",
	Default = "",
	Options = {"Sukuna", "Ice Awakening"},
	Callback = function(selected)
        if selected == "Sukuna" then
            config.sukunaskill = true
            config.iceskill = false
        elseif selected == "Ice Awakening" then
            config.sukunaskill = false
            config.iceskill = true
        end
    end 
})

Items:AddButton({
    Name = "Teleport",
    Callback = function()
        if config.sukunaskill then
            tpequip("Sukuna")
        elseif config.iceskill then
            tpequip("Ice Awakening")
        end
    end
})

local ChangeTime = Tabs.Main:AddSection({ Name = "Change Time" })

ChangeTime:AddParagraph("Time Default", "Sukuna: 12s - SnowIsland | Ice Awakening: 13s - AbondedSnowIsland")

ChangeTime:AddTextbox({
    Name = "Second",
    Default = "12",
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

local AutoFarm = Tabs.Main:AddSection({ Name = "Farm & Teleport Island" })

AutoFarm:AddParagraph("Island Select", "Snow Island 1 - Require: Sukuna | Snow Island 2 - Require: Ice Awakening")

AutoFarm:AddDropdown({
	Name = "Island Select",
	Default = "",
	Options = {"Windmill Island", "Snow Island 1", "Snow Island 2", "Abandoned Snow Island"},
	Callback = function(selected)
        if selected then 
            if selected == "Windmill Island" then
                config.windmill = true
                config.snowisland1 = false
                config.snowisland2 = false
                config.abandoned = false
            elseif selected == "Snow Island 1" then
                config.windmill = false
                config.snowisland1 = true
                config.snowisland2 = false
                config.abandoned = false
            elseif selected == "Snow Island 2" then
                config.windmill = false
                config.snowisland1 = false
                config.snowisland2 = true
                config.abandoned = false
            elseif selected == "Abandoned Snow Island" then
                config.windmill = false
                config.snowisland1 = false
                config.snowisland2 = false
                config.abandoned = true
            end
        end
	end 
})

function cbmon()
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
                    if config.windmill then
                        task.wait(2)
                        character.HumanoidRootPart.CFrame = CFrame.new(-340.595551, 28.6830673, 234.98175, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    elseif config.snowisland1 then
                        task.wait(2)
                        character.HumanoidRootPart.CFrame = CFrame.new(-2411.69824, 19.8741894, -598.203064, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    elseif config.abandoned then
                        task.wait(2)
                        character.HumanoidRootPart.CFrame = CFrame.new(2600.07031, 23.3707905, 1980.55969, 0.848060429, 0, 0.529899538, 0, 1, 0, -0.529899538, 0, 0.848060429)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    end
                end)
            end   

        elseif config.iceskill then
            local skill = localPlayer.Backpack:FindFirstChild("IceAwakening")
            local event = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
                and game:GetService("ReplicatedStorage").Events:FindFirstChild("IceAge")
                    
            if humanoid and skill and event then
                pcall(function()
                    if config.windmill then
                        task.wait(2)
                        character.HumanoidRootPart.CFrame = CFrame.new(-340.595551, 28.6830673, 234.98175, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    elseif config.snowisland2 then
                        task.wait(2)
                        character.HumanoidRootPart.CFrame = CFrame.new(-2570.79053, 20.1839676, -589.001343, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    elseif config.abandoned then
                        task.wait(2)
                        character.HumanoidRootPart.CFrame = CFrame.new(2600.07031, 23.3707905, 1980.55969, 0.848060429, 0, 0.529899538, 0, 1, 0, -0.529899538, 0, 0.848060429)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    end
                end)
            end
        end
    end
end

AutoFarm:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        autofarm = state
        if autofarm then
            spawn(function()
                while autofarm do
                    cbmon()
                    task.wait(1) 
                end
            end)
        end 
    end 
})

local Trait = Tabs.Other:AddSection({ Name = "Random Trait" })

Trait:AddToggle({
    Name = "Auto Trait",
    Default = false,
    Callback = function(state)
        config.atrait = state 
        if config.atrait then
            while config.atrait do
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SpinTrait"):FireServer("Normal")
                wait(1) 
            end
        end
    end    
})

local Family = Tabs.Other:AddSection({ Name = "Random Family" })

Family:AddToggle({
    Name = "Auto Family",
    Default = false,
    Callback = function(state)
        config.afamily = state 
        if config.afamily then
            while config.afamily do
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SpinFamily"):FireServer("Normal")
                wait(1) 
            end
        end
    end    
})

OrionLib:Init()

else
game.Players.LocalPlayer:Kick("Error : Game Not Supported")
end
