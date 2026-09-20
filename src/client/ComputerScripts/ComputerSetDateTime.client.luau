local plr = game.Players.LocalPlayer

local computer = plr.PlayerGui:WaitForChild("Computer")
local dateTimeText = computer.Window.TaskBar.TimeBox.textTime

print(computer)

computer:GetPropertyChangedSignal("Enabled"):Connect(function()
    while computer.Enabled == true do
        local dateTimeNow = DateTime.now()
        local currentString = dateTimeNow:FormatLocalTime("LT", "en-us")

        dateTimeText.Text = currentString
        print(dateTimeText)
        task.wait(1)
    end
end)
