local SoundService = game:GetService("SoundService")
local ComputerToggle = {}

local plr = game.Players.LocalPlayer
local computer = plr.PlayerGui:WaitForChild("Computer")
local Startmenu = computer.Window.StartMenu

-- Sounds
local computerEnableSound = SoundService.WindowsEnable
local computerDisableSound = SoundService.WindowsDisable
local computerClickSound = SoundService.WindowsClick

-- Functions
function ComputerToggle.ToggleComputerFunction()
    computer.Enabled = true
    computerEnableSound:Play()
end

function ComputerToggle.ComputerToggleOff()
    computer.Enabled = false
    computerDisableSound:Play()
end

function ComputerToggle.StartmenuEnable()
    Startmenu.Visible = true
    computerClickSound:Play()
end

function ComputerToggle.StartmenuDisable()
    Startmenu.Visible = false
    computerClickSound:Play()
end

function ComputerToggle.initializeProximityPrompt(part: ProximityPrompt)
    part.HoldDuration = 1
    part.ActionText = "Power On"
    
end

return ComputerToggle