local BadgeService = game:GetService("BadgeService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = ReplicatedStorage.Remotes.BSOD_award

event.OnServerEvent:Connect(function(plr:Player)
    BadgeService:AwardBadgeAsync(plr.UserId, 165411620794634)
end)

