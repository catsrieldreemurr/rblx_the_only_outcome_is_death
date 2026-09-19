local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ComputerToggle = require(ReplicatedStorage.Shared.ComputerToggle)

local function setupProximityPrompt(part:Instance)
    if part:IsA('ProximityPrompt') then
        part.Triggered:Connect(function(plr:Player)
            ComputerToggle.ToggleComputerFunction(plr)
        end)
    end
end

CollectionService:GetInstanceAddedSignal("computerPromptTag"):Connect(setupProximityPrompt)

for _, part in CollectionService:GetTagged("computerPromptTag") do
    setupProximityPrompt(part)
end