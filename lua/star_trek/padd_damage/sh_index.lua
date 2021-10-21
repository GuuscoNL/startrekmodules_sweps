---------------------------------------
---------------------------------------
--        Star Trek Utilities        --
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
--        Damage SWEP | Index        --
---------------------------------------

Star_Trek:RequireModules("lcars", "lcars_swep", "damage")

Star_Trek.Damage_SWEP = Star_Trek.Damage_SWEP or {}

--[[
if CLIENT then
	include("sh_config.lua")
	include("cl_damage.lua")
end

if SERVER then
	AddCSLuaFile("sh_config.lua")
	AddCSLuaFile("cl_damage.lua")

	include("sh_config.lua")
	include("sv_damage.lua")
end
]]