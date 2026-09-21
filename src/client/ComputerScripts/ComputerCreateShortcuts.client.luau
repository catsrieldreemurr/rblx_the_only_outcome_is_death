local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ComputerShortcuts = require(ReplicatedStorage.Shared.ComputerShortcuts)

for i = 1, 5 ,1 do
    ComputerShortcuts.SetupShortcut(i);
end