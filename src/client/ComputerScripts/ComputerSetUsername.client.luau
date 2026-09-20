local plr = game.Players.LocalPlayer

local computer = plr.PlayerGui:WaitForChild("Computer")
local UsernameText = computer.Window.StartMenu.usernameText

UsernameText.Text = plr.Name

