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
--    Copyright © 2021 Jan Ziegler   --
---------------------------------------
---------------------------------------

---------------------------------------
--      LCARS PADD Logs | Server     --
---------------------------------------

if not istable(INTERFACE) then Star_Trek:LoadAllModules() return end
local SELF = INTERFACE

SELF.BaseInterface = "padd_log"

SELF.LogType = "Personal Log"
SELF.LogMobile = true

function SELF:Open(ent, sessionData)
	local success, window = Star_Trek.LCARS:CreateWindow(
		"log_entry_editable",
		Vector(),
		Angle(),
		ent.MenuScale,
		ent.MenuWidth,
		ent.MenuHeight,
		function(windowData, interfaceData, buttonId)

		end,
		nil,
		Color(255, 255, 255)
	)

	if istable(sessionData) then
		window:SetSessionData(sessionData)
	end

	if not success then
		return false, window
	end

	return true, {window}
end