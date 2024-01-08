
local fn = "Myriad Pro"--"Bahnschrift"
surface.CreateFont( "CHR_12", {
	font = fn,
	size = ScreenScaleH(12),
	weight = 0,
})
surface.CreateFont( "CHR_10", {
	font = fn,
	size = ScreenScaleH(10),
	weight = 0,
})
surface.CreateFont( "CHR_8", {
	font = fn,
	size = ScreenScaleH(8),
	weight = 0,
})
surface.CreateFont( "CHR_12I", {
	font = fn,
	size = ScreenScaleH(12),
	italic = true,
	weight = 0,
})
surface.CreateFont( "CHR_10I", {
	font = fn,
	size = ScreenScaleH(10),
	italic = true,
	weight = 0,
})
surface.CreateFont( "CHR_8I", {
	font = fn,
	size = ScreenScaleH(8),
	italic = true,
	weight = 0,
})

local rtc = {
	["Consumer"]		= Color( 100,		116,	124 ),
	["Security"]		= Color( 79,		143,	228 ),
	["Operator"]		= Color( 100,		20,		220 ),
	["Elite"]			= Color( 240,		44,		44 ),
	["Special"]			= Color( 255,		126,	40 ),
}
local mony = Color( 60, 100, 100 )

local mat_c = Material( "tacrp_credit/coalition.png", "smooth" )
local mat_m = Material( "tacrp_credit/militia.png", "smooth" )

local function hp( self, w, h )
	local s = ScreenScaleH

	surface.SetDrawColor( 200, 200, 200 )
	surface.DrawRect( 0, 0, w, h )

	draw.SimpleText( self.Text_Name, "CHR_10", s(4), s(1), color_black )
	return true
end

local function hp2( self, w, h )
	local s = ScreenScaleH

	surface.SetDrawColor( self.Text_Color )
	surface.DrawRect( 0, 0, w, h )

	draw.SimpleText( self.Text_Name, "CHR_10I", s(4), s(2), color_black )
	draw.SimpleText( self.Text_Name, "CHR_10I", s(4), s(1), color_white )
	return true
end

local function hp3( self, w, h )
	local s = ScreenScaleH

	surface.SetDrawColor( 255, 255, 255 )
	surface.DrawRect( 0, 0, w, h )

	if self.Text_Faction == TacRP.FACTION_COALITION then
		surface.SetDrawColor( 255, 255, 255 )
		surface.SetMaterial( mat_c )
		surface.DrawTexturedRect( w-s(36)-h, 0, h, h )
	elseif self.Text_Faction == TacRP.FACTION_MILITIA then
		surface.SetDrawColor( 255, 255, 255 )
		surface.SetMaterial( mat_m )
		surface.DrawTexturedRect( w-s(36)-h, 0, h, h )
	end

	draw.SimpleText( self.Text_Name, "CHR_10", s(4), s(0), color_black )
	draw.SimpleText( self.Text_Cost.." $", "CHR_10", w-s(4), s(0), mony, TEXT_ALIGN_RIGHT )
	return true
end

function TacRPCredit.Shop()
	local s = ScreenScaleH
	if meow then meow:Remove() end
	meow = vgui.Create("DFrame")
	meow:SetSize( s(260), s(360) )
	meow:Center()
	--meow:SetX( s(160) )
	meow:MakePopup()
	meow:SetKeyboardInputEnabled(false)

	meow:DockPadding( s(2), 20+s(2), s(2), s(2) )

	function meow:Paint( w, h )
		surface.SetDrawColor( color_black )
		surface.DrawRect( 0, 0, w, h )
		return true
	end

	local sp = meow:Add("DScrollPanel")
	sp:Dock( FILL )
	sp.VBar:SetWide(0)

	meow.typeheaders = {}
	for type_name, type_table in SortedPairs( TacRPCredit.Cats ) do
		local header = sp:Add("DButton")
		meow.typeheaders[type_name] = header
		header.Text_Name = type_name:Right( -2 )
		header:SetTall( s(12) )
		header:Dock(TOP)
		header:DockMargin( 0, 0, 0, s(2) )
		header:DockPadding( 0, s(1), s(1), s(1) )

		header.Paint = hp
		header.Enabled = false

		header.tierheaders = {}
		function header:DoClick()
			for i, v in pairs( meow.typeheaders ) do
				v.Enabled = (v==self) and (!v.Enabled)
				if v.Enabled then
					for _, k in pairs( v.tierheaders ) do
						k:Show()
					end
					v:InvalidateLayout( true )
					v:SizeToChildren( false, true )
				else
					for _, k in pairs( v.tierheaders ) do
						k:Hide()
					end
					v:SetTall( s(12) )
				end
			end
			return true
		end

		for tier_name, tier_table in SortedPairs( type_table ) do
			local header_tier = header:Add("DPanel")
			header.tierheaders[tier_name] = header_tier
			header_tier.Text_Name = tier_name:Right( -2 )
			header_tier.Text_Color = rtc[header_tier.Text_Name]
			header_tier.Text_Drop = #tier_table == 1
			header_tier:SetTall( s(12) )
			header_tier:Hide() --
			header_tier:Dock(TOP)
			header_tier:DockMargin( s(68), 0, 0, s(1) )
			header_tier:DockPadding( s(44+1), s(1), s(1), s(1) )
				
			header_tier.Paint = hp2

			local moneysorter = {}
			for i, v in ipairs( tier_table ) do
				moneysorter[v] = TacRPCredit.DefinedItems[v]
			end

			for i, v in SortedPairsByValue( moneysorter, true ) do
				local header_weapon = header_tier:Add("DButton")
				local it = weapons.GetStored(i)
				header_weapon.Text_Name = it.PrintName
				header_weapon.Text_Cost = TacRPCredit.DefinedItems[i]
				header_weapon.Text_Faction = it.Faction
				header_weapon:SetTall( s(10) )
				header_weapon:Dock(TOP)
				header_weapon:DockMargin( 0, 0, 0, s(2) )
				header_weapon.Paint = hp3

				function header_weapon:DoClick()
					return true
				end
			end

			header_tier:InvalidateLayout( true )
			header_tier:SizeToChildren( false, true )
		end

		-- header:InvalidateLayout( true )
		-- header:SizeToChildren( false, true )
	end
end

concommand.Add("tcred_buymenu", function()
	TacRPCredit.Shop()
end)