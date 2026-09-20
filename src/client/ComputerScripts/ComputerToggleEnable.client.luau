local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local computerModule = require(ReplicatedStorage.Shared.ComputerToggle)

function disablePC()
    computerModule.ComputerToggleOff()
end

local function setupProximityPrompt(part:Instance)
    if part:IsA('ProximityPrompt') then

        computerModule.initializeProximityPrompt(part)
        part.Triggered:Connect(function(plr:Player)
            computerModule.ToggleComputerFunction()
        end)
    end
end

CollectionService:GetInstanceAddedSignal("computerDisableTag"):Connect(disablePC)

for _, part in CollectionService:GetTagged("computerDisableTag") do
    part.MouseButton1Click:Connect(function(plr)
         disablePC()
    end)
end

CollectionService:GetInstanceAddedSignal("computerPromptTag"):Connect(setupProximityPrompt)

for _, part in CollectionService:GetTagged("computerPromptTag") do
    setupProximityPrompt(part)
end