local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ComputerShortcutModule = {}

local ui_components = ReplicatedStorage:WaitForChild("ui_Components")
local plrGUI = game.Players.LocalPlayer.PlayerGui

local contentWindow = plrGUI:WaitForChild("Computer").Window.StartMenu.ContentWindow

ComputerShortcutModule.ShortcutData = {
    {
        Name = "Notepad",
        Description = "Text Editor",
        icon = "rbxassetid://74414458286675"
    },
    {
        Name = "Games",
        Description = "My Games",
        icon = "rbxassetid://106266901531354"
    },
    {
        Name = "Studio",
        Description = "ROBLOX Studio",
        icon = "rbxassetid://713477693"
    },
    {
        Name = "Drive",
        Description = "My Drive",
        icon = "rbxassetid://7960143550"
    },
    {
        Name = "Clock",
        Description = "System Clock",
        icon = "rbxassetid://125734477193203"
    }
}

function ComputerShortcutModule.SetupShortcut(index:number)
    local clone = ui_components.Shortcut:Clone()
    clone.Parent = contentWindow

    clone:WaitForChild("icon_fullname").Text = ComputerShortcutModule.ShortcutData[index].Name
    clone:WaitForChild("icon_shortname").Text = ComputerShortcutModule.ShortcutData[index].Description
    clone:WaitForChild("image_icon").Image = ComputerShortcutModule.ShortcutData[index].icon

    print("Successfully Initialized " .. ComputerShortcutModule.ShortcutData[index].Name)
end


return ComputerShortcutModule