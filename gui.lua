-- GUI Fake Dupe Script

-- Create Screen GUI
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "FakeDupeUI"

-- Frame
local frame = Instance.new("Frame", ScreenGui)
frame.Size = UDim2.new(0, 250, 0, 180)
frame.Position = UDim2.new(0.5, -125, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1

-- UICorner
local corner = Instance.new("UICorner", frame)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "🌱 Grow a Garden - Fake Dupe"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamSemibold
title.TextSize = 16

-- Pet Name TextBox
local nameBox = Instance.new("TextBox", frame)
nameBox.PlaceholderText = "Enter pet name"
nameBox.Size = UDim2.new(1, -20, 0, 30)
nameBox.Position = UDim2.new(0, 10, 0, 40)
nameBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
nameBox.TextColor3 = Color3.new(1, 1, 1)
nameBox.ClearTextOnFocus = false
nameBox.Font = Enum.Font.Gotham
nameBox.TextSize = 14

-- Amount TextBox
local amountBox = Instance.new("TextBox", frame)
amountBox.PlaceholderText = "How many?"
amountBox.Size = UDim2.new(1, -20, 0, 30)
amountBox.Position = UDim2.new(0, 10, 0, 80)
amountBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
amountBox.TextColor3 = Color3.new(1, 1, 1)
amountBox.ClearTextOnFocus = false
amountBox.Font = Enum.Font.Gotham
amountBox.TextSize = 14

-- Dupe Button
local dupeBtn = Instance.new("TextButton", frame)
dupeBtn.Size = UDim2.new(0.5, -15, 0, 30)
dupeBtn.Position = UDim2.new(0, 10, 0, 130)
dupeBtn.Text = "Dupe Now!"
dupeBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
dupeBtn.TextColor3 = Color3.new(1, 1, 1)
dupeBtn.Font = Enum.Font.GothamBold
dupeBtn.TextSize = 14

-- Clear Button
local clearBtn = Instance.new("TextButton", frame)
clearBtn.Size = UDim2.new(0.5, -15, 0, 30)
clearBtn.Position = UDim2.new(0.5, 5, 0, 130)
clearBtn.Text = "Clear Pets"
clearBtn.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
clearBtn.TextColor3 = Color3.new(1, 1, 1)
clearBtn.Font = Enum.Font.GothamBold
clearBtn.TextSize = 14

-- Create Fake Pet Function
local function createFakePet(name)
    local player = game.Players.LocalPlayer
    local petsFolder = player:FindFirstChild("Pets") or Instance.new("Folder", player)
    petsFolder.Name = "Pets"

    local pet = Instance.new("Folder")
    pet.Name = name .. "_" .. tostring(math.random(1000, 9999))
    pet.Parent = petsFolder
end

-- Dupe Button Click
dupeBtn.MouseButton1Click:Connect(function()
    local petName = nameBox.Text
    local amount = tonumber(amountBox.Text) or 1
    if petName ~= "" and amount > 0 then
        for i = 1, amount do
            createFakePet(petName)
        end

        game.StarterGui:SetCore("SendNotification", {
            Title = "Success!";
            Text = "Added "..amount.." "..petName.."(s)";
            Duration = 4;
        })
    end
end)

-- Clear Button Click
clearBtn.MouseButton1Click:Connect(function()
    local petsFolder = game.Players.LocalPlayer:FindFirstChild("Pets")
    if petsFolder then
        petsFolder:Destroy()
    end
end)
