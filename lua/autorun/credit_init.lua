
-- TacRP Credit by Fesiug

TacRPCredit = {}

AddCSLuaFile( "credit/gen.lua" )
	include	( "credit/gen.lua" )
AddCSLuaFile( "credit/ui.lua" )
if CLIENT then
	include	( "credit/ui.lua" )
end