---------------------------------------
---------------------------------------
--         Star Trek Modules         --
--                                   --
--            Created by             --
--       Jan 'Oninoni' Ziegler       --
--                                   --
-- This software can be used freely, --
--    but only distributed by me.    --
--                                   --
--    Copyright © 2022 Jan Ziegler   --
---------------------------------------
---------------------------------------

---------------------------------------
--      LCARS Tricorder | Client     --
---------------------------------------

if not istable(WINDOW) then Star_Trek:LoadAllModules() return end
local SELF = WINDOW

local SCAN_TIME = Star_Trek.Tricorder.ScanTime
local SCAN_STEPS = 6

function SELF:OnCreate(windowData)
	self.Padding = self.Padding or 1
	self.FrameType = self.FrameType or "frame_triple"
	self.SubMenuHeight = 64 + 2 * self.Padding

	local success = SELF.Base.OnCreate(self, windowData)
	if not success then
		return false
	end

	self.LastScan = windowData.LastScan

	local successScanner, scannerBar = self:GenerateElement("scanner", self.Id .. "_ScannerBar", self.Area1Width, 56, SCAN_STEPS, windowData.HFlip)
	if not successScanner then
		return false
	end
	self.ScannerBar = scannerBar

	return true
end

function SELF:OnPress(pos, animPos)
	return SELF.Base.OnPress(self, pos, animPos)
end

function SELF:OnDraw(pos, animPos)
	draw.RoundedBox(0, self.Area1X - 4, self.Area1Y - 4, self.Area1Width + 4, self.Area1Height + 4, Color(0, 0, 0, 255 * animPos))

	SELF.Base.OnDraw(self, pos, animPos)

	local lastScan = self.LastScan
	if isnumber(lastScan) then
		local progress = math.min(SCAN_TIME, CurTime() - lastScan) / SCAN_TIME
		local step = math.floor(progress * SCAN_STEPS, 0)

		self.ScannerBar.Progress = step
		self.ScannerBar:Render(self.Area1X, self.Area2Y + 4)
	end
end