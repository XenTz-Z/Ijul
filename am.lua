if tostring(game.PlaceId) == "18688206652" then

print("Ijul Piece 2 Author Code: XIE")

getgenv().Config1 = {
      ["Distance From Mob"] = 4
}

function UpStats(stat)
    game:GetService("ReplicatedStorage").Events.UpgradeStat:FireServer(stat)
end

local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

function GetName(Folder, Class)
    local names = {}
    for _, v in pairs(Folder:GetChildren()) do
        if v:IsA(Class) then
            table.insert(names, v.Name)
        end
    end
    return names
end

function __AttackMon()
game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):ClickButton1(Vector2.new(9999999, 99999999), game:GetService("Workspace").Camera.CFrame)
end

function TP(cframe)
    pcall(function()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
        end
    end)
end

local Map = GetName(workspace.Map.SpawnLocation, "Part")
local Wea = GetName(game.Players.LocalPlayer.Backpack, "Tool")
local NameBoss = GetName(game.ReplicatedStorage.BossCharacters, "Model")

local NPC = {}
for _, v in pairs(workspace.Map.NPC:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
        table.insert(NPC, v.Name)
    end
end

function __Equip()
    pcall(function()
      game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(getgenv().Weapon))
    end)
end

function __RedeemCode()
  for _, v in pairs(game.Players.LocalPlayer["LevelFolder"]:GetChildren()) do
        if v:IsA("BoolValue") and v.Name:find("Code") then
            local Code = v.Name:gsub("Code", "")
            game:GetService("ReplicatedStorage").Events.RedeemCodes:FireServer(Code)
            wait(0.3)
        end
    end
end

local CFSPBOSS = workspace.Map.NPC.BossSpawnerNPC.HumanoidRootPart.CFrame

local Mon = {}
local Names = {}
local NoCheckX = {
    "nil"
}

for _, v in pairs(workspace.Npcs:GetChildren()) do
    if v:IsA("Model") then
        if not Names[v.Name] and not table.find(NoCheckX, v.Name) then
            Names[v.Name] = true
            table.insert(Mon, v.Name)
        end
    end
end

local Dismee = 2

-- all

local config = {
    settime = 12,
    sukunaskill = false,
    iceskill = false,
    windmill = false,
    snowisland1 = false,
    snowisland2 = false,
    abandoned = false
    afk = false  
}

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenTz-Z/RedzLibV5/refs/heads/main/Source.lua"))()

local Window = redzlib:MakeWindow({
    Title = "Ijul Piece 2",
    SubTitle = "by XenTz-Z",
    SaveFolder = ""
})

Window:AddMinimizeButton({
  Button = { Image = "rbxassetid://77349212873128", BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

local Main = Window:MakeTab({
    Title = "Main", 
    Icon = "rbxassetid://10723407389"
})

local Mon = Window:MakeTab({
    Title = "Mon", 
    Icon = "rbxassetid://10723407389"
})

local Stats = Window:MakeTab({
    Title = "Stats", 
    Icon = "rbxassetid://10734961133"
})

local Teleport = Window:MakeTab({
    Title = "Teleport", 
    Icon = "rbxassetid://10723434557"
})

local Item = Window:MakeTab({
    Title = "Item", 
    Icon = "rbxassetid://10723407389"
})

local Misc = Window:MakeTab({
    Title = "Misc",
    Icon = "rbxassetid://10734950309"
})

local GetItem = Main:AddSection({
    Name = "Item Farm"
})

GetItem:AddDropdown({
    Name = "Select",
    Description = "Equip",
    Options = {"Sukuna", "Ice Awakening"},
    Default = nil,
    Flag = "sItem_Equip",
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

GetItem:AddButton({
    Name = "Teleport",
    Description = "TP to NPC",
    Callback = function()
        if config.sukunaskill then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1061.43738, 92.1607361, 101.183472, -0.697700858, 0.0441585705, 0.715026915, 0.125600129, 0.990178764, 0.0614053048, -0.705292881, 0.132650018, -0.69639492) 
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sukuna"))
        elseif config.iceskill then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2644.43213, 4.73413086, -483.230469, -0.62928617, 0, 0.777173758, 0, 1, 0, -0.777173758, 0, -0.62928617)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("IceAwakening"))
        end     
    end
})

GetItem:AddTextbox({
    Name = "Second",
    Description = "Time Default: Sukuna: 33s - SnowIsland | Ice Awakening: 13s - AbondedSnowIsland",
    Default = "12",
    PlaceholderText = "input",
    TClearText = false,
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

GetItem:GetItem({
    Name = "Island Select",
    Description = "Snow Island 1 - Require: Sukuna | Snow Island 2 - Require: Ice Awakening",
    Options = {"Windmill Island", "Snow Island 1", "Snow Island 2", "Abandoned Snow Island"},
    Default = nil,
    Flag = "island_select",
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

-- auto farm get item, rs pl, tp

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
                    if config.windmill then
                        character.HumanoidRootPart.CFrame = CFrame.new(-340.595551, 28.6830673, 234.98175, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    elseif config.snowisland1 then
                        character.HumanoidRootPart.CFrame = CFrame.new(-2411.69824, 19.8741894, -598.203064, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    elseif config.abandoned then
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
                        character.HumanoidRootPart.CFrame = CFrame.new(-340.595551, 28.6830673, 234.98175, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    elseif config.snowisland2 then
                        character.HumanoidRootPart.CFrame = CFrame.new(-2570.79053, 20.1839676, -589.001343, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                        task.wait(2.5)
                        humanoid:EquipTool(skill)
                        event:FireServer()
                        task.wait(config.settime)
                        rspl(localPlayer)
                    elseif config.abandoned then
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

GetItem:AddToggle({
  Name = "Auto Farm",
  Description = "get items"
  Default = false,
  Flag = "farmget_item",
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

local Boss = Main:AddSection({
    Name = "Boss"
})

Boss:AddDropdown({
    Name = "Select Spawn",
    Description = "",
    Options = {"Currency","Item"},
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(SW)
    getgenv().SelSpawn = SW
    end
})

Boss:AddDropdown({
    Name = "Select Boss",
    Description = "",
    Options = NameBoss,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(SW2)
    getgenv().SelSpawn2 = SW2
    end
})

Boss:AddToggle({
  Name = "Auto Farm Boss and Spawn",
  Description = "Farm and Spawn",
  Default = false,
  Callback = function(Fm)
    getgenv().Farm = Fm
end})

Boss:AddToggle({
  Name = "Auto Farm Boss",
  Description = "auto farm",
  Default = false,
  Callback = function(Fm2)
    getgenv().Farm2 = Fm2
end})

local SeaBeast = Main:AddSection({ 
    Name = "SeaBeast"
})

SeaBeast:AddToggle({
  Name = "Auto SeaBeast",
  Default = false,
  Callback = function(Se)
    getgenv().Sea = Se
end})

local Monster = Mon:AddSection({ 
    Name = "Auto Farm Monster"
})

Monster:AddDropdown({
    Name = "Select Monster",
    Description = "",
    Options = Mon,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(FMo)
    getgenv().Monster = FMo
end})

Monster:AddToggle({
  Name = "Auto Monster",
  Default = false,
  Callback = function(MON)
    getgenv().MoS = MON
end})

local UpStats = Stats:AddSection({ 
    Name = "Up Stats"
})

UpStats:AddToggle({
  Name = "Strength",
  Default = false,
  Callback = function(Strength)
    getgenv().Strength = Strength
    while getgenv().Strength do wait()
      UpStats("Strength")
    end
end})

UpStats:AddToggle({
  Name = "Durability",
  Default = false,
  Callback = function(Durability)
    getgenv().Durability = Durability
    while getgenv().Durability do wait()
      UpStats("Durability")
    end
end})

UpStats:AddToggle({
  Name = "Sword",
  Default = false,
  Callback = function(Sword)
    getgenv().Sword = Sword
    while getgenv().Sword do wait()
      UpStats("Sword")
    end
end})

UpStats:AddToggle({
  Name = "Devilfruit",
  Default = false,
  Callback = function(Devilfruit)
    getgenv().Devilfruit = Devilfruit
    while getgenv().Devilfruit do wait()
      UpStats("Devilfruit")
    end
end})

UpStats:AddToggle({
  Name = "Special",
  Default = false,
  Callback = function(Special)
    getgenv().Special = Special
    while getgenv().Special do wait()
      UpStats("Special")
    end
end})

local TPIsland = Teleport:AddSection({
    Name = "Teleport Island"
})

TPIsland:AddDropdown({
    Name = "Select Island",
    Description = "",
    Options = Map,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(Val)
    getgenv().SeeMap = Val
end
})

TPIsland:AddButton({
    Name = "Teleport Island", 
    Callback = function()
        TP(game.workspace.Map.SpawnLocation[getgenv().SeeMap].CFrame * CFrame.new(0,10,0))
    end
})

local TPNPC = Teleport:AddSection({ 
    Name = "Teleport NPC"
})

TPNPC:AddDropdown({
    Name = "Select NPC",
    Description = "",
    Options = NPC,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(Valu)
    getgenv().SeeNPC = Valu
end
})

TPNPC:AddButton({"Teleport NPC", function()
    for _, v in pairs(workspace.Map.NPC:GetChildren()) do
        if v.Name == getgenv().SeeNPC then
            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
        end
    end
end
})

local ARD = Item:AddSection({
    Name = "Redeem & Rd"
})

ARD:AddButton({"Redeem all Code", function()
    __RedeemCode()
end})

ARD:AddToggle({
  Name = "Auto Random Item[Gem]",
  Default = false,
  Callback = function(Ran)
    getgenv().Auto = Ran
end
})

ARD:AddToggle({
  Name = "Auto Random Item[Money]",
  Default = false,
  Callback = function(Ran2)
    getgenv().Auto2 = Ran2
end
})

ARD:AddToggle({
  Name = "Auto Random Family",
  Default = false,
  Callback = function(Fmm)
    getgenv().Family = Fmm
     while getgenv().Family do wait()
game:GetService("ReplicatedStorage").Events.SpinFamily:FireServer("Normal")
    end
end
})

ARD:AddToggle({
  Name = "Auto Random Traits",
  Default = false,
  Callback = function(Race)
    getgenv().Racc = Race
     while getgenv().Racc do wait()
game:GetService("ReplicatedStorage").Events.SpinTrait:FireServer("Normal")
    end
end
})

ARD:AddToggle({
  Name = "Auto Collect Chest",
  Default = false,
  Callback = function(Ch)
    getgenv().Chest = Ch
end
})

local Setting = Misc:AddSection({
    Name = "Setting"
})

local cuser 

Setting:AddToggle({
  Name = "AFK",
  Description = ""
  Default = false,
  Flag = "afk_anti",
  Callback = function(state)
        config.afk = state
        if config.afk then
            if not cuser then
                cuser = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                    local active = game:GetService("VirtualUser")
                    active:CaptureController()
                    active:ClickButton2(Vector2.new())
                end)
            end
        else
            if cuser then
                cuser:Disconnect()
                cuser = nil
            end
        end
    end 
})

Setting:AddSection({"Select Weapon"})

Setting:AddDropdown({
    Name = "Select Weapon",
    Description = "",
    Options = Wea,
    Default = nil,
    Flag = "dropdown_test",
    Callback = function(vbm)
    getgenv().Weapon = vbm
    end
})

Setting:AddToggle({
  Name = "One Shot Boss",
  Default = false,
  Callback = function(Ki)
    getgenv().Kill = Ki
end
})

Setting:AddToggle({
  Name = "One Shot Monster",
  Default = false,
  Callback = function(Ki2)
    getgenv().Kill2 = Ki2
end
})



spawn(function()
    while wait(0.3) do
        if getgenv().Chest then
            pcall(function()
                for _, v in pairs(game:GetService("Workspace").ChestLoc:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Hinge") then
                        TP(v.Hinge.CFrame * CFrame.new(0, 5, 0))
                        for _, y in pairs(v:GetDescendants()) do
                            if y:IsA("ProximityPrompt") then
                                fireproximityprompt(y, 30)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
end)


spawn(function()
    while wait() do
        if getgenv().Farm then
            pcall(function()
                local ModelABC = false
                for _, mob in pairs(workspace.BossSpawns.BossSpawn:GetChildren()) do
                    if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") then
                        ModelABC = true
                        local humanoid = mob:FindFirstChild("Humanoid")
                        humanoid.WalkSpeed = 0
                        humanoid.JumpPower = 0
                        repeat
                            wait()
                            __Equip()
                            __AttackMon()
                            if humanoid.Health > 1 then
                                TP(mob.HumanoidRootPart.CFrame * CFrame.new(0, Dismee or 0, getgenv().Config1["Distance From Mob"]))
                            end
                        until not getgenv().Farm or humanoid.Health <= 0
                        if humanoid.Health <= 0 then
                          wait(1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFSPBOSS * CFrame.new(0, 250, 0)
                            wait(1)
                            if workspace.BossSpawns.BossSpawn:FindFirstChildOfClass("Model") and workspace.BossSpawns.BossSpawn:FindFirstChildOfClass("Model"):FindFirstChild("HumanoidRootPart") then
                                TP(workspace.BossSpawns.BossSpawn:FindFirstChildOfClass("Model").HumanoidRootPart.CFrame * CFrame.new(0, Dismee or 0, getgenv().Config1["Distance From Mob"]))
                            end
                        end
                    end
                end
                if not ModelABC then
                    if getgenv().SelSpawn == "Currency" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFSPBOSS * CFrame.new(0, 5, 0)
                        wait(0.1)
                        local args = {getgenv().SelSpawn2, "Currency"}
                        game:GetService("ReplicatedStorage").Events.BossSpawner:FireServer(unpack(args))
                    elseif getgenv().SelSpawn == "Item" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFSPBOSS * CFrame.new(0, 5, 0)
                        wait(0.1)
                        local args = {getgenv().SelSpawn2, "Item"}
                        game:GetService("ReplicatedStorage").Events.BossSpawner:FireServer(unpack(args))
                    end
                end
            end)
        end
    end
end)


spawn(function()
    while wait() do
        if getgenv().Farm2 then
            pcall(function()
                for _, mob in pairs(workspace.BossSpawns.BossSpawn:GetChildren()) do
                    if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") then
                        local humanoid = mob:FindFirstChild("Humanoid")
                        humanoid.WalkSpeed = 0
                        humanoid.JumpPower = 0
                        repeat
                            wait()
                            __Equip()
                            __AttackMon()
                            TP(mob.HumanoidRootPart.CFrame * CFrame.new(0, Dismee, getgenv().Config1["Distance From Mob"]))
                        until not getgenv().Farm2
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().MoS then
            pcall(function()
                for _, v in pairs(workspace.Npcs:GetChildren()) do
                    if v:IsA("Model") and v.Name == getgenv().Monster and v:FindFirstChildOfClass("Humanoid") and v.Humanoid.Health > 0 then
                        v.Humanoid.WalkSpeed = 0
                        v.Humanoid.JumpPower = 0
                        repeat
                            wait()
                            __Equip()
                            __AttackMon()
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, Dismee, getgenv().Config1["Distance From Mob"]))
                        until not getgenv().MoS or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if getgenv().Sea then
            pcall(function()
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "SeaBeast" and v:FindFirstChildOfClass("Humanoid") and v.Humanoid.Health > 0 then
                        v.Humanoid.WalkSpeed = 0
                        v.Humanoid.JumpPower = 0
                        repeat
                            wait()
                            __Equip()
                            __AttackMon()
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,0,5))
                        until not getgenv().Sea or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Auto then
                for _, v in pairs(workspace.Map.NPC.Random5X:GetDescendants()) do
                    if v:FindFirstChildOfClass("ProximityPrompt") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  workspace.Map.NPC.Random5X.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                        fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"), 30)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Auto2 then
                for _, v in pairs(workspace.Map.NPC.Random5XMoney:GetDescendants()) do
                    if v:FindFirstChildOfClass("ProximityPrompt") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  workspace.Map.NPC.Random5XMoney.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                        fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"), 30)
                    end
                end
            end
        end)
    end
end)

local radius = 15
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Kill then
              local player = game.Players.LocalPlayer
              local character = player.Character or player.CharacterAdded:Wait()
                sethiddenproperty(player, "SimulationRadius", 112412400000)
                sethiddenproperty(player, "MaxSimulationRadius", 112412400000)
                for _, v in pairs(workspace.BossSpawns.BossSpawn:GetDescendants()) do
                    if v:IsA("Humanoid") and v.Parent and v.Parent:IsA("Model") then
                        local npcPosition = v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position
                        local playerPosition = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position
                        if npcPosition and playerPosition and (npcPosition - playerPosition).Magnitude <= 15 then
                            if v.Health < v.MaxHealth then
                              wait()
                                v.Health = 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)
local radius = 15
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Kill2 then
              local player = game.Players.LocalPlayer
              local character = player.Character or player.CharacterAdded:Wait()
                sethiddenproperty(player, "SimulationRadius", 112412400000)
                sethiddenproperty(player, "MaxSimulationRadius", 112412400000)
                for _, v in pairs(workspace.Npcs:GetChildren()) do
                    if v:IsA("Humanoid") and v.Parent and v.Parent:IsA("Model") then
                        local npcPosition = v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position
                        local playerPosition = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position
                        if npcPosition and playerPosition and (npcPosition - playerPosition).Magnitude <= 15 then
                            if v.Health < v.MaxHealth then
                              wait()
                                v.Health = 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)
local radius = 15
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Sea then
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                
                sethiddenproperty(player, "SimulationRadius", 112412400000)
                sethiddenproperty(player, "MaxSimulationRadius", 112412400000)
                
                local seaBeast = workspace:FindFirstChild("SeaBeast")
                if seaBeast then
                    for _, v in pairs(seaBeast:GetDescendants()) do
                        if v:IsA("Humanoid") and v.Parent and v.Parent:IsA("Model") then
                            local npcPosition = v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position
                            local playerPosition = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position
                            if npcPosition and playerPosition and (npcPosition - playerPosition).Magnitude <= 15 then
                                if v.Health < v.MaxHealth then
                                    wait()
                                    v.Health = 0
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)



spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().Farm2 or getgenv().Farm or getgenv().MoS then
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    Noclip.Velocity = Vector3.new(0, 0, 0)
                end
            else    
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end)
end)


else
game.Players.LocalPlayer:Kick("Error : Game Not Supported")
end
