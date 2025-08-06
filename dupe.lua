

local fakePetName = "Super Dog"
local dupeAmount = 5

local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack") or player:FindFirstChild("Backpack")
local petsFolder = player:FindFirstChild("Pets") or Instance.new("Folder", player)
petsFolder.Name = "Pets"

local function createFakePet(name)
    local pet = Instance.new("Folder")
    pet.Name = name .. "_" .. tostring(math.random(1000, 9999))
    pet.Parent = petsFolder
end

for i = 1, dupeAmount do
    createFakePet(fakePetName)
end

game.StarterGui:SetCore("SendNotification", {
    Title = "FAKE DUPE";
    Text = fakePetName.." x"..dupeAmount.." added (client-side)";
    Duration = 5;
})