local SoundService = game:GetService("SoundService")
local ComputerToggle = {}

local plr = game.Players.LocalPlayer
local computer = plr.PlayerGui:WaitForChild("Computer")
local Startmenu = computer.Window.StartMenu
local bsod = computer.bluescreen

-- Sounds
local computerEnableSound = SoundService.WindowsEnable
local computerDisableSound = SoundService.WindowsDisable
local computerClickSound = SoundService.WindowsClick
local computerCrashSound = SoundService.WindowsCrash

-- Functions
function ComputerToggle.ToggleComputerFunction()
    computer.Enabled = true
    computerEnableSound:Play()

    ComputerToggle.disableBSOD()
end

function ComputerToggle.ComputerToggleOff()
    computer.Enabled = false
    computerDisableSound:Play()
    
    ComputerToggle.disableBSOD()
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

function ComputerToggle.enableBSOD()
    bsod.Visible = true
    Startmenu.Visible = false
    computerCrashSound:Play()
end

function ComputerToggle.disableBSOD()
    bsod.Visible = false
    Startmenu.Visible = true
end

return ComputerToggle