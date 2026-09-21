local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local ComputerShortcuts = require(ReplicatedStorage.Shared.ComputerShortcuts)

for i = 1, 5 ,1 do
    ComputerShortcuts.SetupShortcut(i);
end

function setUpShortcutClick(part:Instance)
    if part:IsA('TextButton') then
        part.MouseButton1Click:Connect(function()
            SoundService.WindowsError:Play()
        end)
    end
end

CollectionService:GetInstanceAddedSignal("ui_computerFakeShortcut"):Connect(setUpShortcutClick)

for _, part in CollectionService:GetTagged("ui_computerFakeShortcut") do
    setUpShortcutClick(part)
end
