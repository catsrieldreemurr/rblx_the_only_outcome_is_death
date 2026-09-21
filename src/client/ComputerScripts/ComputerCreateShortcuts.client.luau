local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local ComputerShortcuts = require(ReplicatedStorage.Shared.ComputerShortcuts)

local computer = game.Players.LocalPlayer.PlayerGui:WaitForChild("Computer")

for i = 1, 5 ,1 do
    ComputerShortcuts.SetupShortcut(i);
end

local amountOfPopups = 0

local bsod_event = ReplicatedStorage.Remotes.BSOD_award

function setUpShortcutClick(part:Instance)
    if part:IsA('TextButton') then
        part.MouseButton1Click:Connect(function()
            SoundService.WindowsError:Play()
            ComputerShortcuts.CreateFakePopup()

            amountOfPopups += 1

            if amountOfPopups >= 35 then 
                bsod_event:FireServer()
            end
            print(amountOfPopups)
        end)
    end
end

function ErrorPopupClick(part:Instance)
    if part:IsA("ImageButton") then 
        part.MouseButton1Click:Connect(function()
            part:Destroy()
            SoundService.WindowsClick:Play()
            amountOfPopups -= 1

            print(amountOfPopups)
        end)
    end
end

CollectionService:GetInstanceAddedSignal("ui_computerFakeShortcut"):Connect(setUpShortcutClick)

for _, part in CollectionService:GetTagged("ui_computerFakeShortcut") do
    setUpShortcutClick(part)
end

CollectionService:GetInstanceAddedSignal("ui_computerErrorPopup"):Connect(ErrorPopupClick)

for _, part in CollectionService:GetTagged("ui_computerErrorPopup") do
    ErrorPopupClick(part)
end

computer:GetPropertyChangedSignal("Enabled"):Connect(function()
   ComputerShortcuts.PurgeAllErrors()
   amountOfPopups = 0
end)