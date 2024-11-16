local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NotificationS_Event = ReplicatedStorage:WaitForChild("Global_Events"):WaitForChild("Notification_Event")

game.Players.PlayerAdded:Connect(function(Player)
	Player.Chatted:Connect(function(Msg)
		local OpenMessage = "/e OpenChambers"
		local CloseMessage = "/e CloseChambers"
		if Player:GetRankInGroup(34426333) >= 16 then
			if Msg == OpenMessage then
				game:GetService("ServerStorage"):WaitForChild("CouncilChambersPubicillyAbailable").Value = true
				NotificationS_Event:FireClient(Player, "".."You have opened the High Council Chambers to the Public.", 10, "#00ff7f")
			elseif Msg == CloseMessage then
				game:GetService("ServerStorage"):WaitForChild("CouncilChambersPubicillyAbailable").Value = false
				NotificationS_Event:FireClient(Player, "".."You have closed the High Council Chambers to the Public.", 10, "#7C0902")
			end
		end
	end)
end)
