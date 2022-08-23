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
--     Tricorder Entity | Server     --
---------------------------------------

if not istable(SWEP) then Star_Trek:LoadAllModules() return end

-- Safety Sound Removal
function SWEP:OnRemove()
	self:StopLoopingSound(self.LoopId)
end