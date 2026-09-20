local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ComputerToggle = require(ReplicatedStorage.Shared.ComputerToggle)

local computer = game.Players.LocalPlayer.PlayerGui:WaitForChild("Computer")

function enableTaskBar()
    ComputerToggle.StartmenuEnable()
end

function disableTaskBar()
    ComputerToggle.StartmenuDisable()
end

local startMenuIsOpen = false

function ToggleMenu()
    startMenuIsOpen = not startMenuIsOpen

    if startMenuIsOpen then 
        enableTaskBar()
    else
        disableTaskBar()
    end
end

CollectionService:GetInstanceAddedSignal("ui_computerStartButton"):Connect(ToggleMenu)

for _, part in CollectionService:GetTagged("ui_computerStartButton") do
    if part:IsA("TextButton") then
        part.MouseButton1Click:Connect(function()
            ToggleMenu()
        end)
    end
    
end

computer:GetPropertyChangedSignal("Enabled"):Connect(function()
    startMenuIsOpen = false
    disableTaskBar()
end)
