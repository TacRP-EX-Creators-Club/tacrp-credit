
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


local moneystore = {
    -- Sidearm
        -- Elite
        ["tacrp_mtx_dual"]                      = 1450,
        ["tacrp_io_fiveseven"]                  = 1000,
        -- Operator
        ["tacrp_sd_dual_1911"]                  = 1300,
        ["tacrp_io_af2011"]                     = 1000,
        ["tacrp_h_hardballer"]                  = 1000,
        ["tacrp_h_dual_hardballers"]            = 1000,
        ["tacrp_p250"]                          = 300,
        -- Security
        ["tacrp_sd_dual_usp"]                   = 1050,
        ["tacrp_sd_dual_ppk"]                   = 750,
        ["tacrp_gsr1911"]                       = 650,
        ["tacrp_ex_usp"]                        = 650,
        ["tacrp_io_p226"]                       = 550,
        ["tacrp_sd_ppk"]                        = 550,
        ["tacrp_p2000"]                         = 500,
        -- Consumer
        ["tacrp_sd_dualies"]                    = 1000,
        ["tacrp_ar_ar15pistol"]                 = 750,
        ["tacrp_sd_tt33"]                       = 450,
        ["tacrp_io_ab10"]                       = 400,
        ["tacrp_ex_m1911"]                      = 350,
        ["tacrp_ex_glock"]                      = 300,
        ["tacrp_vertec"]                        = 300,
        ["tacrp_io_ruger"]                      = 250,
    -- Machine Pistol
        -- Elite
        ["tacrp_xd45"]                          = 1000,
        -- Operator
        ["tacrp_sd_dual_uzis"]                  = 1450,
        ["tacrp_io_vp70"]                       = 1000,
        ["tacrp_sphinx"]                        = 1000,
        ["tacrp_uzi"]                           = 1000,
        -- Security
        ["tacrp_io_glock18"]                    = 1000,
        ["tacrp_io_tec9"]                       = 1000,
        -- Consumer
        ["tacrp_ex_mac10"]                      = 1000,
        ["tacrp_skorpion"]                      = 1000,
    -- Magnum Pistol
        -- Elite
        ["tacrp_sd_dual_degala"]                = 1200,
        ["tacrp_io_m500"]                       = 1000,
        ["tacrp_h_executioner"]                 = 1000,
        ["tacrp_io_degala"]                     = 1000,
        -- Operator
        ["tacrp_mr96"]                          = 1000,
        -- Security
        ["tacrp_sd_contender"]                  = 1250,
        ["tacrp_io_automag"]                    = 1000,
        -- Consumer
        ["tacrp_io_t850"]                       = 1000,
        ["tacrp_sd_1858"]                       = 950,
    -- Submachine Gun
        -- Elite
        ["tacrp_superv"]                        = 1000,
        ["tacrp_pdw"]                           = 1000,
        -- Operator
        ["tacrp_mp7"]                           = 1000,
        ["tacrp_ex_mp9"]                        = 1000,
        ["tacrp_p90"]                           = 1000,
        -- Security
        ["tacrp_sd_bizon"]                      = 1300,
        ["tacrp_io_mx4"]                        = 1000,
        ["tacrp_ex_ump45"]                      = 1000,
        ["tacrp_ak_ak74u"]                      = 1000,
        ["tacrp_mp5"]                           = 1000,
        -- Consumer
        ["tacrp_io_coltsmg"]                    = 1000,
        ["tacrp_sd_mp40"]                       = 1000,
        ["tacrp_sd_thompson"]                   = 1000,
    -- Assault Rifle
        -- Elite
        ["tacrp_sd_aac_hb"]                     = 1450,
        ["tacrp_ar_hk416"]                      = 1000,
        ["tacrp_ar_vltor"]                      = 1000,
        ["tacrp_sg551"]                         = 1000,
        ["tacrp_ak_ak12"]                       = 1000,
        ["tacrp_ak_an94"]                       = 1000,
        -- Operator
        ["tacrp_ex_m4a1"]                       = 2800,
        ["tacrp_ex_ak47"]                       = 2500,
        ["tacrp_g36k"]                          = 1000,
        ["tacrp_sd_groza"]                      = 1000,
        ["tacrp_io_xm8car"]                     = 1000,
        ["tacrp_io_val"]                        = 1000,
        ["tacrp_aug"]                           = 1000,
        ["tacrp_ar_m16a4"]                      = 1000,
        ["tacrp_m4"]                            = 1000,
        ["tacrp_ak_aek971"]                     = 1000,
        -- Security
        ["tacrp_ak_ak74"]                       = 1000,
        ["tacrp_ak_rk95"]                       = 1000,
        ["tacrp_io_fnc"]                        = 1000,
        ["tacrp_amd65"]                         = 1000,
        ["tacrp_io_m16a2"]                      = 1000,
        ["tacrp_sd_famas"]                      = 1000,
        ["tacrp_ar_lr300"]                      = 1000,
        -- Consumer
        ["tacrp_k1a"]                           = 1000,
        ["tacrp_ak47"]                          = 1000,
        ["tacrp_ar_m16a1"]                      = 1000,
    -- Machine Gun
        -- Elite
        ["tacrp_mg4"]                           = 1000,
        -- Operator
        ["tacrp_sd_pkm"]                        = 1000,
        ["tacrp_io_xm8lmg"]                     = 1000,
        -- Security
        ["tacrp_io_rpk"]                        = 1000,
        -- Consumer
        ["tacrp_ak_galil_lmg"]                  = 1000,
    -- Shotgun
        -- Elite
        ["tacrp_ks23"]                          = 1000,
        ["tacrp_m4star10"]                      = 1000,
        ["tacrp_h_spas12"]                      = 1000,
        ["tacrp_h_jackhammer"]                  = 1000,
        -- Operator
        ["tacrp_fp6"]                           = 1000,
        ["tacrp_io_saiga"]                      = 1000,
        -- Security
        ["tacrp_io_870"]                        = 1000,
        ["tacrp_tgs12"]                         = 1000,
        -- Consumer
        ["tacrp_sd_db"]                         = 1150,
        ["tacrp_bekas"]                         = 1000,
        ["tacrp_sd_superx3"]                    = 1000,
    -- Sporter Carbine
        -- Operator
        ["tacrp_io_sl8"]                        = 1000,
        ["tacrp_h_nitrorifle"]                  = 1000,
        ["tacrp_ar_gilboa"]                     = 1000,
        -- Security
        ["tacrp_sd_m1carbine"]                  = 1000,
        ["tacrp_io_star15"]                     = 1000,
        ["tacrp_io_usc"]                        = 1000,
        ["tacrp_civ_p90"]                       = 1000,
        -- Consumer
        ["tacrp_m1"]                            = 1000,
        ["tacrp_io_cx4"]                        = 1000,
        ["tacrp_io_k98_varmint"]                = 1000,
        ["tacrp_sd_vz58"]                       = 1000,
        ["tacrp_civ_mp5"]                       = 1000,
        ["tacrp_sd_1022"]                       = 950,
    -- Launcher
        -- Special
        ["tacrp_io_chinalake"]                  = 1000,
        ["tacrp_m320"]                          = 1000,
        ["tacrp_rpg7"]                          = 1000,
        ["tacrp_h_smaw"]                        = 1000,
        ["tacrp_h_xm25"]                        = 1000,
    -- Precision Rifle
        -- Elite
        ["tacrp_io_sg550r"]                     = 1000,
        ["tacrp_io_sg550"]                      = 1000,
        ["tacrp_hk417"]                         = 1000,
        -- Operator
        ["tacrp_io_vss"]                        = 1000,
        ["tacrp_io_m14"]                        = 1000,
        ["tacrp_io_scarh"]                      = 1000,
        -- Security
        ["tacrp_sd_g3"]                         = 1000,
        ["tacrp_dsa58"]                         = 1000,
        ["tacrp_m14"]                           = 1000,
        -- Consumer
        ["tacrp_ak_galil_sniper"]               = 1000,
    -- Sniper Rifle
        -- Elite
        ["tacrp_sd_wa2000"]                     = 6200,
        ["tacrp_as50"]                          = 5850,
        ["tacrp_h_intervention"]                = 5700,
        -- Operator
        ["tacrp_ex_hecate"]                     = 4750,
        ["tacrp_sd_delisle"]                    = 1000,
        ["tacrp_io_trg42"]                      = 1000,
        -- Security
        ["tacrp_io_k98"]                        = 1000,
        ["tacrp_uratio"]                        = 1000,
        -- Consumer
        ["tacrp_spr"]                           = 1000,
        ["tacrp_ak_svd"]                        = 1000,
        ["tacrp_pa_sako85"]                     = 1000,
    -- Special Weapon
        -- Special
        ["tacrp_h_jdj"]                         = 6550,
        ["tacrp_sd_gyrojet"]                    = 1200,
    -- Melee Weapon
        -- Special
        ["tacrp_riot_shield"]                   = 1200,
        ["tacrp_knife"]                         = 100,
        ["tacrp_knife2"]                        = 100,
    -- Equipment
        -- Special
        ["tacrp_c4_detonator"]                  = 600,
        ["tacrp_medkit"]                        = 600,
    -- Throwable
        -- Special
        ["tacrp_nade_gas"]                      = 800,
        ["tacrp_nade_thermite"]                 = 800,
        ["tacrp_nade_charge"]                   = 600,
        ["tacrp_nade_smoke"]                    = 600,
        ["tacrp_nade_flashbang"]                = 400,
        ["tacrp_nade_frag"]                     = 400,
}


local splitpercat = {}

for class, cash in pairs( moneystore ) do
	-- GetStored won't get the grenades SubCatTier and Type
	local wt = weapons.Get(class)

	do
		local sct = wt.SubCatType or "9IDK"
		if !splitpercat[ sct ] then
			splitpercat[ sct ] = {}
		end
		local t = splitpercat[ sct ]
	end

	do
		local sct = wt.SubCatType or "9IDK"
		local scTier = wt.SubCatTier or "9TIERLESS"
		if !splitpercat[sct][ scTier ] then
			splitpercat[sct][ scTier ] = {}
		end
		local t = splitpercat[sct][ scTier ]
		table.insert( t, class )
	end

end

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

local function listitout()
	MsgN("weh = {")
	for i, v in SortedPairs( splitpercat ) do
		--MsgC( color_white, (i:Right(-2)).."\n" )
		MsgN( "    -- " .. (i:Right(-2)) )
		for a, b in SortedPairs( v ) do
			local te = a:Right(-2)
			--MsgC( rtc[te], "\t"..(te).."\n" )
			MsgN( "        -- "..(te) )

			local moneysorter = {}
			for i, v in ipairs( b ) do
				moneysorter[v] = moneystore[v]
			end

			for me, ow in SortedPairsByValue( moneysorter, true ) do
				local message = "        " .. "[\""..me.."\"]" .. "                                    "
				message = message:Left( 8+40 )
				message = message .. "= " .. ow .. ","
				MsgN( message )
			end
		end
	end
	MsgN("}")
end

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

function genmeow()
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
	for type_name, type_table in SortedPairs( splitpercat ) do
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
				moneysorter[v] = moneystore[v]
			end

			for i, v in SortedPairsByValue( moneysorter, true ) do
				local header_weapon = header_tier:Add("DButton")
				local it = weapons.GetStored(i)
				header_weapon.Text_Name = it.PrintName
				header_weapon.Text_Cost = moneystore[i]
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

concommand.Add("fesi_buymenu", function()
	genmeow()
end)
concommand.Add("fesi_listweps", function()
	listitout()
end)
--genmeow()
--PrintTable( splitpercat )