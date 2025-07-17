local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI container
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "AnimatedBorderUI"
ScreenGui.ResetOnSpawn = false

-- Toggle button (có viền bảy màu)
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.20, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
ToggleBtn.Text = "⚙️👀"
ToggleBtn.TextSize = 18
ToggleBtn.TextColor3 = Color3.new(0, 0, 0)
ToggleBtn.Active = true
ToggleBtn.Draggable = true
local toggleCorner = Instance.new("UICorner", ToggleBtn)
toggleCorner.CornerRadius = UDim.new(0, 10)

-- Viền bảy màu cho toggle
local toggleBorder = Instance.new("UIStroke", ToggleBtn)
toggleBorder.Thickness = 2
toggleBorder.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
toggleBorder.LineJoinMode = Enum.LineJoinMode.Round

-- Main frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 270, 0, 420)
Main.Position = UDim2.new(0.05, 0, 0.25, 0)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

-- UI corner
local UICorner = Instance.new("UICorner", Main)
UICorner.CornerRadius = UDim.new(0, 12)

-- Rainbow border cho Main
local border = Instance.new("UIStroke", Main)
border.Thickness = 2
border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
border.LineJoinMode = Enum.LineJoinMode.Round

-- Rainbow animation cho cả Main và Toggle
task.spawn(function()
	while true do
		for i = 0, 1, 0.01 do
			local color = Color3.fromHSV(i, 1, 1)
			border.Color = color
			toggleBorder.Color = color
			task.wait(0.02)
		end
	end
end)

-- Title
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = "⚙️ Tối Ưu Hóa"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18

-- Button creator
local function createButton(text, index)
	local btn = Instance.new("TextButton", Main)
	btn.Size = UDim2.new(0.85, 0, 0, 36)
	btn.Position = UDim2.new(0.075, 0, 0, 45 + (index - 1) * 45)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.Text = text
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 8)
	return btn
end

-- Tạo 7 nút chức năng
local Button1 = createButton("Fix Lag V1", 1)
local Button2 = createButton("Fix Lag V2", 2)
local Button3 = createButton("Fix Lag V3", 3)
local Button4 = createButton("Fix Lag V4", 4)
local Button5 = createButton("Fix Lag V5", 5)
local Button6 = createButton("Show FPS", 6)
local Button7 = createButton("Full bright", 7)

-- Toggle GUI visibility
ToggleBtn.MouseButton1Click:Connect(function()
	Main.Visible = not Main.Visible
end)

-- Demo chức năng
Button1.MouseButton1Click:Connect(function()
    -- Lontrax Optimizer (No GUI Version - Auto Run Turbo V2)

-- Đợi game load hoàn toàn
repeat wait() until game:IsLoaded()

-- Tối ưu nhẹ (FPS+)
local function optimizeLeve()
	local success, err = pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)
	
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = math.huge
end

-- Gỡ bỏ kết cấu + vật liệu + đổi màu
local function removeTextures()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") then
			v:Destroy()
		elseif v:IsA("MeshPart") or v:IsA("Part") then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Color = Color3.new(0.3, 0.3, 0.3)
			end)
		end
	end
end

-- Turbo V2: gỡ kết cấu + tối ưu + nước trong suốt
local function turboV2()
	removeTextures()
	optimizeLeve()
	local Terrain = workspace:FindFirstChildOfClass("Terrain")
	if Terrain then
		Terrain.WaterWaveSize = 0
		Terrain.WaterTransparency = 1
		Terrain.WaterReflectance = 0
		Terrain.WaterWaveSpeed = 0
	end
end

-- Khôi phục lại đồ họa mặc định
local function restore()
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = true
	lighting.FogEnd = 1000
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Automatic
		settings().Rendering.ReloadAssets = true
	end)

	local Terrain = workspace:FindFirstChildOfClass("Terrain")
	if Terrain then
		Terrain.WaterWaveSize = 0.1
		Terrain.WaterTransparency = 0.5
		Terrain.WaterReflectance = 0.05
		Terrain.WaterWaveSpeed = 10
	end
end

-- TỰ ĐỘNG KÍCH HOẠT chế độ Turbo V2
turboV2()

-- Nếu muốn đổi chế độ, thay dòng trên bằng:
-- optimizeLeve() -- chỉ tối ưu nhẹ
-- removeTextures() -- chỉ gỡ kết cấu
-- restore() -- khôi phục lại đồ họa mặc định
end)

Button2.MouseButton1Click:Connect(function()
-- Super FPS Boost - Fix Lag Siêu Tối Ưu Cho Roblox (No GUI, Auto Run)

repeat task.wait() until game:IsLoaded()

-- ⚙️ Cấu hình rendering nhẹ nhất
local function optimizeRendering()
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = 1e10
	lighting.Brightness = 1
	lighting.OutdoorAmbient = Color3.new(1, 1, 1)
	lighting.EnvironmentDiffuseScale = 0
	lighting.EnvironmentSpecularScale = 0
	lighting.ClockTime = 14
end

-- 🧹 Gỡ hiệu ứng, kết cấu, bóng
local function cleanWorkspace()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ShirtGraphic") then
			v:Destroy()
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Color = Color3.new(0.3, 0.3, 0.3)
				v.Reflectance = 0
				v.CastShadow = false
			end)
		end
	end
end

-- 💧 Tắt hiệu ứng nước và terrain
local function cleanTerrain()
	local terrain = workspace:FindFirstChildOfClass("Terrain")
	if terrain then
		terrain.WaterWaveSize = 0
		terrain.WaterWaveSpeed = 0
		terrain.WaterTransparency = 1
		terrain.WaterReflectance = 0
		terrain.Decorations = false
	end
end

-- 🔇 Tắt âm thanh không cần thiết
local function muteSounds()
	for _, s in pairs(workspace:GetDescendants()) do
		if s:IsA("Sound") and s.IsPlaying then
			pcall(function()
				s:Stop()
			end)
		end
	end
end

-- 🧼 Xóa GUI không quan trọng (FPS GUI, Background UI)
local function cleanGui()
	local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	for _, v in pairs(gui:GetDescendants()) do
		if v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("TextLabel") or v:IsA("TextButton") then
			pcall(function()
				v.Visible = false
			end)
		end
	end
end

-- 🚀 Tổng hợp tất cả
local function superOptimize()
	optimizeRendering()
	cleanWorkspace()
	cleanTerrain()
	muteSounds()
	cleanGui()
end

-- ✅ Kích hoạt tự động
superOptimize()
end)

Button3.MouseButton1Click:Connect(function()
-- Lontrax Optimizer Turbo V3 (No GUI - Super FPS Mode, Player Characters Kept)

repeat task.wait() until game:IsLoaded()

-- Tối ưu hệ thống rendering
local function optimizeRendering()
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)

	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = 1e10
	lighting.Brightness = 1
	lighting.EnvironmentDiffuseScale = 0
	lighting.EnvironmentSpecularScale = 0
	lighting.ClockTime = 14
	lighting.OutdoorAmbient = Color3.new(1, 1, 1)
end

-- Xóa texture, decal, hiệu ứng, bóng, đổi vật liệu
local function deepClean()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ShirtGraphic") then
			v:Destroy()
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Reflectance = 0
				v.CastShadow = false
				v.Color = Color3.new(0.3, 0.3, 0.3)
			end)
		end
	end
end

-- Xoá GUI không cần thiết
local function clearGui()
	for _, v in pairs(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):GetDescendants()) do
		if v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("Frame") then
			pcall(function()
				v.Visible = false
			end)
		end
	end
end

-- Tắt hiệu ứng nước + terrain
local function disableTerrainEffects()
	local Terrain = workspace:FindFirstChildOfClass("Terrain")
	if Terrain then
		Terrain.WaterWaveSize = 0
		Terrain.WaterTransparency = 1
		Terrain.WaterReflectance = 0
		Terrain.WaterWaveSpeed = 0
		Terrain.Decorations = false
	end
end

-- Tắt âm thanh nền không cần thiết
local function muteSounds()
	for _, sound in pairs(workspace:GetDescendants()) do
		if sound:IsA("Sound") and sound.IsPlaying then
			sound:Stop()
		end
	end
end

-- Gọi tất cả hàm tối ưu (không xoá người chơi khác)
local function fullOptimize()
	optimizeRendering()
	deepClean()
	disableTerrainEffects()
	clearGui()
	muteSounds()
end

-- THỰC THI TOÀN BỘ
fullOptimize()

-- Low GFX Script for better performance
local Lighting = game:GetService("Lighting")

-- Remove unnecessary lighting effects
Lighting.GlobalShadows = false
Lighting.FogEnd = 1000000
Lighting.Brightness = 1
Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0

-- Disable post-processing effects
for _, effect in pairs(Lighting:GetChildren()) do
    if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") then
        effect.Enabled = false
    end
end

-- Simplify terrain
if workspace:FindFirstChildOfClass("Terrain") then
    workspace.Terrain.WaterWaveSize = 0
    workspace.Terrain.WaterWaveSpeed = 0
    workspace.Terrain.WaterReflectance = 0
    workspace.Terrain.WaterTransparency = 1
end

-- Remove particle effects
for _, v in ipairs(workspace:GetDescendants()) do
    if v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Enabled = false
    end
end

-- Disable textures (optional)
for _, v in ipairs(workspace:GetDescendants()) do
    if v:IsA("Decal") or v:IsA("Texture") then
        v:Destroy()
    end
end

print("✅ Low GFX mode enabled!")

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Reduce Lighting effects
Lighting.GlobalShadows = false
Lighting.FogEnd = 100 -- Lower fog = less rendering
Lighting.Brightness = 1

-- Disable post-processing effects
for _, effect in pairs(Lighting:GetChildren()) do
	if effect:IsA("PostEffect") then
		effect.Enabled = false
	end
end

-- Lower terrain quality
if Terrain then
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 1
end

-- Hide accessories (optional)
local function removeAccessories(char)
	for _, item in pairs(char:GetChildren()) do
		if item:IsA("Accessory") or item:IsA("Clothing") then
			item:Destroy()
		end
	end
end

-- Apply to current character
if player.Character then
	removeAccessories(player.Character)
end

-- Apply when character respawns
player.CharacterAdded:Connect(removeAccessories)

-- Remove particle emitters & other effects
local function removeEffects(obj)
	for _, v in pairs(obj:GetDescendants()) do
		if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") then
			v.Enabled = false
		end
	end
end

-- Initial cleanup
removeEffects(workspace)

-- Listen for new objects added
workspace.DescendantAdded:Connect(function(obj)
	if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") then
		obj.Enabled = false
	end
end)

-- Roblox Anti-Lag Script (Universal)
pcall(function()
    -- Đơn giản hóa vật thể
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
            v:Destroy()
        end
    end

    -- Giảm hiệu ứng ánh sáng
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 100000
    lighting.Brightness = 1
    for _, v in ipairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") then
            v.Enabled = false
        end
    end

    -- Giảm chất lượng đồ họa nếu có thể
    if settings():FindFirstChild("Rendering") then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
end)

-- FPS BOOST SCRIPT - Made for better performance
pcall(function()

    -- Giảm chất lượng vật liệu
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v:Destroy()
        end
    end

    -- Tối ưu Lighting
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 100000
    lighting.Brightness = 0
    lighting.ShadowSoftness = 0
    lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)

    -- Tắt hiệu ứng
    for _, v in pairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") then
            v.Enabled = false
        end
    end

    -- Tắt âm thanh không cần thiết
    for _, s in pairs(game:GetDescendants()) do
        if s:IsA("Sound") then
            s.Volume = 0
        end
    end

    -- Giảm chất lượng hiển thị
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

    print("✅ FPS Boost Activated!")

end)
end)

Button4.MouseButton1Click:Connect(function()
-- Lontrax Optimizer (No GUI Version - Auto Run Turbo V2)

-- Đợi game load hoàn toàn
repeat wait() until game:IsLoaded()

-- Tối ưu nhẹ (FPS+)
local function optimizeLeve()
	local success, err = pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)
	
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = math.huge
end

-- Gỡ bỏ kết cấu + vật liệu + đổi màu
local function removeTextures()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") then
			v:Destroy()
		elseif v:IsA("MeshPart") or v:IsA("Part") then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Color = Color3.new(0.3, 0.3, 0.3)
			end)
		end
	end
end

-- Turbo V2: gỡ kết cấu + tối ưu + nước trong suốt
local function turboV2()
	removeTextures()
	optimizeLeve()
	local Terrain = workspace:FindFirstChildOfClass("Terrain")
	if Terrain then
		Terrain.WaterWaveSize = 0
		Terrain.WaterTransparency = 1
		Terrain.WaterReflectance = 0
		Terrain.WaterWaveSpeed = 0
	end
end

-- Khôi phục lại đồ họa mặc định
local function restore()
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = true
	lighting.FogEnd = 1000
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Automatic
		settings().Rendering.ReloadAssets = true
	end)

	local Terrain = workspace:FindFirstChildOfClass("Terrain")
	if Terrain then
		Terrain.WaterWaveSize = 0.1
		Terrain.WaterTransparency = 0.5
		Terrain.WaterReflectance = 0.05
		Terrain.WaterWaveSpeed = 10
	end
end

-- TỰ ĐỘNG KÍCH HOẠT chế độ Turbo V2
turboV2()

-- Nếu muốn đổi chế độ, thay dòng trên bằng:
-- optimizeLeve() -- chỉ tối ưu nhẹ
-- removeTextures() -- chỉ gỡ kết cấu
-- restore() -- khôi phục lại đồ họa mặc định

-- Super FPS Boost - Fix Lag Siêu Tối Ưu Cho Roblox (No GUI, Auto Run)

repeat task.wait() until game:IsLoaded()

-- ⚙️ Cấu hình rendering nhẹ nhất
local function optimizeRendering()
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = 1e10
	lighting.Brightness = 1
	lighting.OutdoorAmbient = Color3.new(1, 1, 1)
	lighting.EnvironmentDiffuseScale = 0
	lighting.EnvironmentSpecularScale = 0
	lighting.ClockTime = 14
end

-- 🧹 Gỡ hiệu ứng, kết cấu, bóng
local function cleanWorkspace()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ShirtGraphic") then
			v:Destroy()
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Color = Color3.new(0.3, 0.3, 0.3)
				v.Reflectance = 0
				v.CastShadow = false
			end)
		end
	end
end

-- 💧 Tắt hiệu ứng nước và terrain
local function cleanTerrain()
	local terrain = workspace:FindFirstChildOfClass("Terrain")
	if terrain then
		terrain.WaterWaveSize = 0
		terrain.WaterWaveSpeed = 0
		terrain.WaterTransparency = 1
		terrain.WaterReflectance = 0
		terrain.Decorations = false
	end
end

-- 🔇 Tắt âm thanh không cần thiết
local function muteSounds()
	for _, s in pairs(workspace:GetDescendants()) do
		if s:IsA("Sound") and s.IsPlaying then
			pcall(function()
				s:Stop()
			end)
		end
	end
end

-- 🧼 Xóa GUI không quan trọng (FPS GUI, Background UI)
local function cleanGui()
	local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	for _, v in pairs(gui:GetDescendants()) do
		if v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("TextLabel") or v:IsA("TextButton") then
			pcall(function()
				v.Visible = false
			end)
		end
	end
end

-- 🚀 Tổng hợp tất cả
local function superOptimize()
	optimizeRendering()
	cleanWorkspace()
	cleanTerrain()
	muteSounds()
	cleanGui()
end

-- ✅ Kích hoạt tự động
superOptimize()

-- Lontrax Optimizer Turbo V3 (No GUI - Super FPS Mode, Player Characters Kept)

repeat task.wait() until game:IsLoaded()

-- Tối ưu hệ thống rendering
local function optimizeRendering()
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)

	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = 1e10
	lighting.Brightness = 1
	lighting.EnvironmentDiffuseScale = 0
	lighting.EnvironmentSpecularScale = 0
	lighting.ClockTime = 14
	lighting.OutdoorAmbient = Color3.new(1, 1, 1)
end

-- Xóa texture, decal, hiệu ứng, bóng, đổi vật liệu
local function deepClean()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ShirtGraphic") then
			v:Destroy()
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Reflectance = 0
				v.CastShadow = false
				v.Color = Color3.new(0.3, 0.3, 0.3)
			end)
		end
	end
end

-- Xoá GUI không cần thiết
local function clearGui()
	for _, v in pairs(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):GetDescendants()) do
		if v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("Frame") then
			pcall(function()
				v.Visible = false
			end)
		end
	end
end

-- Tắt hiệu ứng nước + terrain
local function disableTerrainEffects()
	local Terrain = workspace:FindFirstChildOfClass("Terrain")
	if Terrain then
		Terrain.WaterWaveSize = 0
		Terrain.WaterTransparency = 1
		Terrain.WaterReflectance = 0
		Terrain.WaterWaveSpeed = 0
		Terrain.Decorations = false
	end
end

-- Tắt âm thanh nền không cần thiết
local function muteSounds()
	for _, sound in pairs(workspace:GetDescendants()) do
		if sound:IsA("Sound") and sound.IsPlaying then
			sound:Stop()
		end
	end
end

-- Gọi tất cả hàm tối ưu (không xoá người chơi khác)
local function fullOptimize()
	optimizeRendering()
	deepClean()
	disableTerrainEffects()
	clearGui()
	muteSounds()
end

-- THỰC THI TOÀN BỘ
fullOptimize()

-- Low GFX Script for better performance
local Lighting = game:GetService("Lighting")

-- Remove unnecessary lighting effects
Lighting.GlobalShadows = false
Lighting.FogEnd = 1000000
Lighting.Brightness = 1
Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0

-- Disable post-processing effects
for _, effect in pairs(Lighting:GetChildren()) do
    if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") then
        effect.Enabled = false
    end
end

-- Simplify terrain
if workspace:FindFirstChildOfClass("Terrain") then
    workspace.Terrain.WaterWaveSize = 0
    workspace.Terrain.WaterWaveSpeed = 0
    workspace.Terrain.WaterReflectance = 0
    workspace.Terrain.WaterTransparency = 1
end

-- Remove particle effects
for _, v in ipairs(workspace:GetDescendants()) do
    if v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Enabled = false
    end
end

-- Disable textures (optional)
for _, v in ipairs(workspace:GetDescendants()) do
    if v:IsA("Decal") or v:IsA("Texture") then
        v:Destroy()
    end
end

print("✅ Low GFX mode enabled!")

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Reduce Lighting effects
Lighting.GlobalShadows = false
Lighting.FogEnd = 100 -- Lower fog = less rendering
Lighting.Brightness = 1

-- Disable post-processing effects
for _, effect in pairs(Lighting:GetChildren()) do
	if effect:IsA("PostEffect") then
		effect.Enabled = false
	end
end

-- Lower terrain quality
if Terrain then
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 1
end

-- Hide accessories (optional)
local function removeAccessories(char)
	for _, item in pairs(char:GetChildren()) do
		if item:IsA("Accessory") or item:IsA("Clothing") then
			item:Destroy()
		end
	end
end

-- Apply to current character
if player.Character then
	removeAccessories(player.Character)
end

-- Apply when character respawns
player.CharacterAdded:Connect(removeAccessories)

-- Remove particle emitters & other effects
local function removeEffects(obj)
	for _, v in pairs(obj:GetDescendants()) do
		if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") then
			v.Enabled = false
		end
	end
end

-- Initial cleanup
removeEffects(workspace)

-- Listen for new objects added
workspace.DescendantAdded:Connect(function(obj)
	if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") then
		obj.Enabled = false
	end
end)

-- Roblox Anti-Lag Script (Universal)
pcall(function()
    -- Đơn giản hóa vật thể
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
            v:Destroy()
        end
    end

    -- Giảm hiệu ứng ánh sáng
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 100000
    lighting.Brightness = 1
    for _, v in ipairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") then
            v.Enabled = false
        end
    end

    -- Giảm chất lượng đồ họa nếu có thể
    if settings():FindFirstChild("Rendering") then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
end)

-- FPS BOOST SCRIPT - Made for better performance
pcall(function()

    -- Giảm chất lượng vật liệu
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v:Destroy()
        end
    end

    -- Tối ưu Lighting
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 100000
    lighting.Brightness = 0
    lighting.ShadowSoftness = 0
    lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)

    -- Tắt hiệu ứng
    for _, v in pairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") then
            v.Enabled = false
        end
    end

    -- Tắt âm thanh không cần thiết
    for _, s in pairs(game:GetDescendants()) do
        if s:IsA("Sound") then
            s.Volume = 0
        end
    end

    -- Giảm chất lượng hiển thị
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

    print("✅ FPS Boost Activated!")

end)
end)

Button5.MouseButton1Click:Connect(function()
    -- ⚡ Ultimate Super FPS Boost Script - Giảm Lag Cực Mạnh, Giữ Người Chơi

repeat task.wait() until game:IsLoaded()

-- Tối ưu đồ hoạ và rendering
local function optimizeRendering()
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)
	
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = 1e10
	lighting.Brightness = 1
	lighting.OutdoorAmbient = Color3.new(1, 1, 1)
	lighting.EnvironmentDiffuseScale = 0
	lighting.EnvironmentSpecularScale = 0
	lighting.ClockTime = 14
end

-- Gỡ kết cấu, hiệu ứng, vật liệu nặng (giữ nhân vật)
local function deepClean()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ShirtGraphic") then
			v:Destroy()
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif (v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation")) and not v:IsDescendantOf(game.Players) then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Color = Color3.new(0.3, 0.3, 0.3)
				v.CastShadow = false
				v.Reflectance = 0
			end)
		end
	end
end

-- Tắt hiệu ứng terrain và làm nước trong suốt
local function cleanTerrain()
	local terrain = workspace:FindFirstChildOfClass("Terrain")
	if terrain then
		terrain.WaterWaveSize = 0
		terrain.WaterWaveSpeed = 0
		terrain.WaterTransparency = 1
		terrain.WaterReflectance = 0
		terrain.Decorations = false
	end
end

-- Tắt âm thanh nền không quan trọng
local function muteSounds()
	for _, s in pairs(workspace:GetDescendants()) do
		if s:IsA("Sound") and s.IsPlaying then
			pcall(function()
				s.Volume = 0
				s:Stop()
			end)
		end
	end
end

-- Ẩn GUI không quan trọng
local function hideGUI()
	local gui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	for _, v in pairs(gui:GetDescendants()) do
		if v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("TextLabel") or v:IsA("TextButton") then
			pcall(function()
				v.Visible = false
			end)
		end
	end
end

-- 🔥 Kích hoạt tối ưu toàn diện
local function fullOptimize()
	optimizeRendering()
	deepClean()
	cleanTerrain()
	muteSounds()
	hideGUI()
end

-- 🚀 Auto Run
fullOptimize()

-- Super FPS Boost - Fix Lag Siêu Tối Ưu Cho Roblox (No GUI, Auto Run)

repeat task.wait() until game:IsLoaded()

-- ⚙️ Cấu hình rendering nhẹ nhất
local function optimizeRendering()
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = 1e10
	lighting.Brightness = 1
	lighting.OutdoorAmbient = Color3.new(1, 1, 1)
	lighting.EnvironmentDiffuseScale = 0
	lighting.EnvironmentSpecularScale = 0
	lighting.ClockTime = 14
end

-- 🧹 Gỡ hiệu ứng, kết cấu, bóng
local function cleanWorkspace()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ShirtGraphic") then
			v:Destroy()
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Color = Color3.new(0.3, 0.3, 0.3)
				v.Reflectance = 0
				v.CastShadow = false
			end)
		end
	end
end

-- 💧 Tắt hiệu ứng nước và terrain
local function cleanTerrain()
	local terrain = workspace:FindFirstChildOfClass("Terrain")
	if terrain then
		terrain.WaterWaveSize = 0
		terrain.WaterWaveSpeed = 0
		terrain.WaterTransparency = 1
		terrain.WaterReflectance = 0
		terrain.Decorations = false
	end
end

-- 🔇 Tắt âm thanh không cần thiết
local function muteSounds()
	for _, s in pairs(workspace:GetDescendants()) do
		if s:IsA("Sound") and s.IsPlaying then
			pcall(function()
				s:Stop()
			end)
		end
	end
end

-- 🧼 Xóa GUI không quan trọng (FPS GUI, Background UI)
local function cleanGui()
	local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	for _, v in pairs(gui:GetDescendants()) do
		if v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("TextLabel") or v:IsA("TextButton") then
			pcall(function()
				v.Visible = false
			end)
		end
	end
end

-- 🚀 Tổng hợp tất cả
local function superOptimize()
	optimizeRendering()
	cleanWorkspace()
	cleanTerrain()
	muteSounds()
	cleanGui()
end

-- ✅ Kích hoạt tự động
superOptimize()

-- Lontrax Optimizer Turbo V3 (No GUI - Super FPS Mode, Player Characters Kept)

repeat task.wait() until game:IsLoaded()

-- Tối ưu hệ thống rendering
local function optimizeRendering()
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)

	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = 1e10
	lighting.Brightness = 1
	lighting.EnvironmentDiffuseScale = 0
	lighting.EnvironmentSpecularScale = 0
	lighting.ClockTime = 14
	lighting.OutdoorAmbient = Color3.new(1, 1, 1)
end

-- Xóa texture, decal, hiệu ứng, bóng, đổi vật liệu
local function deepClean()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ShirtGraphic") then
			v:Destroy()
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Reflectance = 0
				v.CastShadow = false
				v.Color = Color3.new(0.3, 0.3, 0.3)
			end)
		end
	end
end

-- Xoá GUI không cần thiết
local function clearGui()
	for _, v in pairs(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):GetDescendants()) do
		if v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("Frame") then
			pcall(function()
				v.Visible = false
			end)
		end
	end
end

-- Tắt hiệu ứng nước + terrain
local function disableTerrainEffects()
	local Terrain = workspace:FindFirstChildOfClass("Terrain")
	if Terrain then
		Terrain.WaterWaveSize = 0
		Terrain.WaterTransparency = 1
		Terrain.WaterReflectance = 0
		Terrain.WaterWaveSpeed = 0
		Terrain.Decorations = false
	end
end

-- Tắt âm thanh nền không cần thiết
local function muteSounds()
	for _, sound in pairs(workspace:GetDescendants()) do
		if sound:IsA("Sound") and sound.IsPlaying then
			sound:Stop()
		end
	end
end

-- Gọi tất cả hàm tối ưu (không xoá người chơi khác)
local function fullOptimize()
	optimizeRendering()
	deepClean()
	disableTerrainEffects()
	clearGui()
	muteSounds()
end

-- THỰC THI TOÀN BỘ
fullOptimize()

-- Lontrax Optimizer (No GUI Version - Auto Run Turbo V2)

-- Đợi game load hoàn toàn
repeat wait() until game:IsLoaded()

-- Tối ưu nhẹ (FPS+)
local function optimizeLeve()
	local success, err = pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Low
		settings().Rendering.ReloadAssets = false
	end)
	
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = math.huge
end

-- Gỡ bỏ kết cấu + vật liệu + đổi màu
local function removeTextures()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") or v:IsA("Texture") then
			v:Destroy()
		elseif v:IsA("MeshPart") or v:IsA("Part") then
			pcall(function()
				v.Material = Enum.Material.SmoothPlastic
				v.Color = Color3.new(0.3, 0.3, 0.3)
			end)
		end
	end
end

-- Turbo V2: gỡ kết cấu + tối ưu + nước trong suốt
local function turboV2()
	removeTextures()
	optimizeLeve()
	local Terrain = workspace:FindFirstChildOfClass("Terrain")
	if Terrain then
		Terrain.WaterWaveSize = 0
		Terrain.WaterTransparency = 1
		Terrain.WaterReflectance = 0
		Terrain.WaterWaveSpeed = 0
	end
end

-- Khôi phục lại đồ họa mặc định
local function restore()
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = true
	lighting.FogEnd = 1000
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
		settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Automatic
		settings().Rendering.ReloadAssets = true
	end)

	local Terrain = workspace:FindFirstChildOfClass("Terrain")
	if Terrain then
		Terrain.WaterWaveSize = 0.1
		Terrain.WaterTransparency = 0.5
		Terrain.WaterReflectance = 0.05
		Terrain.WaterWaveSpeed = 10
	end
end

-- TỰ ĐỘNG KÍCH HOẠT chế độ Turbo V2
turboV2()

-- Nếu muốn đổi chế độ, thay dòng trên bằng:
-- optimizeLeve() -- chỉ tối ưu nhẹ
-- removeTextures() -- chỉ gỡ kết cấu
-- restore() -- khôi phục lại đồ họa mặc định

-- Low GFX Script for better performance
local Lighting = game:GetService("Lighting")

-- Remove unnecessary lighting effects
Lighting.GlobalShadows = false
Lighting.FogEnd = 1000000
Lighting.Brightness = 1
Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0

-- Disable post-processing effects
for _, effect in pairs(Lighting:GetChildren()) do
    if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") then
        effect.Enabled = false
    end
end

-- Simplify terrain
if workspace:FindFirstChildOfClass("Terrain") then
    workspace.Terrain.WaterWaveSize = 0
    workspace.Terrain.WaterWaveSpeed = 0
    workspace.Terrain.WaterReflectance = 0
    workspace.Terrain.WaterTransparency = 1
end

-- Remove particle effects
for _, v in ipairs(workspace:GetDescendants()) do
    if v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Enabled = false
    end
end

-- Disable textures (optional)
for _, v in ipairs(workspace:GetDescendants()) do
    if v:IsA("Decal") or v:IsA("Texture") then
        v:Destroy()
    end
end

print("✅ Low GFX mode enabled!")

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Reduce Lighting effects
Lighting.GlobalShadows = false
Lighting.FogEnd = 100 -- Lower fog = less rendering
Lighting.Brightness = 1

-- Disable post-processing effects
for _, effect in pairs(Lighting:GetChildren()) do
	if effect:IsA("PostEffect") then
		effect.Enabled = false
	end
end

-- Lower terrain quality
if Terrain then
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 1
end

-- Hide accessories (optional)
local function removeAccessories(char)
	for _, item in pairs(char:GetChildren()) do
		if item:IsA("Accessory") or item:IsA("Clothing") then
			item:Destroy()
		end
	end
end

-- Apply to current character
if player.Character then
	removeAccessories(player.Character)
end

-- Apply when character respawns
player.CharacterAdded:Connect(removeAccessories)

-- Remove particle emitters & other effects
local function removeEffects(obj)
	for _, v in pairs(obj:GetDescendants()) do
		if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") then
			v.Enabled = false
		end
	end
end

-- Initial cleanup
removeEffects(workspace)

-- Listen for new objects added
workspace.DescendantAdded:Connect(function(obj)
	if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") then
		obj.Enabled = false
	end
end)

-- Roblox Anti-Lag Script (Universal)
pcall(function()
    -- Đơn giản hóa vật thể
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
            v:Destroy()
        end
    end

    -- Giảm hiệu ứng ánh sáng
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 100000
    lighting.Brightness = 1
    for _, v in ipairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") then
            v.Enabled = false
        end
    end

    -- Giảm chất lượng đồ họa nếu có thể
    if settings():FindFirstChild("Rendering") then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
end)

-- FPS BOOST SCRIPT - Made for better performance
pcall(function()

    -- Giảm chất lượng vật liệu
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v:Destroy()
        end
    end

    -- Tối ưu Lighting
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 100000
    lighting.Brightness = 0
    lighting.ShadowSoftness = 0
    lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)

    -- Tắt hiệu ứng
    for _, v in pairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") then
            v.Enabled = false
        end
    end

    -- Tắt âm thanh không cần thiết
    for _, s in pairs(game:GetDescendants()) do
        if s:IsA("Sound") then
            s.Volume = 0
        end
    end

    -- Giảm chất lượng hiển thị
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

    print("✅ FPS Boost Activated!")

end)
end)

Button6.MouseButton1Click:Connect(function()
    -- Create the ScreenGui and TextLabel
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Fps = Instance.new("TextLabel")
Fps.Name = "Fps"
Fps.Parent = ScreenGui
Fps.BackgroundTransparency = 1
Fps.Position = UDim2.new(0, 10, 0, 10)
Fps.Size = UDim2.new(0, 125, 0, 25)
Fps.Font = Enum.Font.SourceSans
Fps.TextScaled = true
Fps.TextSize = 14
Fps.TextWrapped = true

-- Function to generate a rainbow color
local function rainbowColor(t)
    local frequency = 1 / 3
    local r = math.sin(frequency * t + 0) * 127 + 128
    local g = math.sin(frequency * t + 2) * 127 + 128
    local b = math.sin(frequency * t + 4) * 127 + 128
    return Color3.fromRGB(r, g, b)
end

-- Update FPS and apply rainbow color
local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function(deltaTime)
    local fps = 1 / deltaTime
    Fps.Text = ("FPS: " .. math.round(fps))
    Fps.TextColor3 = rainbowColor(tick())
end)
end)

Button7.MouseButton1Click:Connect(function()
    if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = true
_G.FullBrightEnabled = not _G.FullBrightEnabled
end)