
local fn = "Myriad Pro"--"Bahnschrift"
surface.CreateFont( "CHR_24", {
	font = fn,
	size = 24,
	weight = 0,
})
surface.CreateFont( "CHR_20", {
	font = fn,
	size = 20,
	weight = 0,
})
surface.CreateFont( "CHR_16", {
	font = fn,
	size = 16,
	weight = 0,
})
surface.CreateFont( "CHR_24I", {
	font = fn,
	size = 24,
	italic = true,
	weight = 0,
})
surface.CreateFont( "CHR_20I", {
	font = fn,
	size = 20,
	italic = true,
	weight = 0,
})
surface.CreateFont( "CHR_16I", {
	font = fn,
	size = 16,
	italic = true,
	weight = 0,
})

local rtc = {
	["Value"]			= Color( 85,		84,		86 ),
	["Consumer"]		= Color( 100,		116,	134 ),
	["Security"]		= Color( 79,		143,	228 ),
	["Operator"]		= Color( 100,		20,		220 ),
	["Elite"]			= Color( 240,		44,		44 ),
	["Special"]			= Color( 155,		126,	110 ),
}
local mony = Color( 0, 150, 0 )

local mat_c = Material( "tacrp_credit/coalition.png", "smooth" )
local mat_m = Material( "tacrp_credit/militia.png", "smooth" )

function TacRPCredit.Shop()
	if Frame then Frame:Remove() Frame = nil end
	Frame = vgui.Create( "DFrame" ) -- Create a Frame to contain everything.
	Frame:SetTitle( "TCred2" )
	Frame:SetSize( 5+100+5+4+4+154+154+154+154+154, 650 )
	Frame:Center()
	Frame:MakePopup()
	Frame:SetSizable( true )

	local sheet = vgui.Create( "DColumnSheet", Frame )
	sheet.Navigation:SetWidth( 100 )
	sheet.Navigation:DockMargin( 0, 0, 4, 0 )
	sheet:Dock( FILL )

	for t1_name, t1_info in SortedPairs( TacRPCredit.Cats ) do

		local TypeName = t1_name:Right(-2)

		local panel1 = vgui.Create( "DPanel", sheet )
		panel1.Paint = function( self, w, h ) return true end 
		panel1:Dock(FILL)
		sheet:AddSheet( TypeName, panel1 )

		local scroller = panel1:Add("DScrollPanel")
		scroller:Dock(FILL)
		scroller.VBar:SetWide(0)
		
		-- header.tierheaders[tier_name] = header_tier
		-- header_tier.Text_Name = tier_name:Right( -2 )
		-- header_tier.Text_Color = rtc[header_tier.Text_Name]

		local typeheaders = {}
		for tier_name, tier_table in SortedPairs( t1_info ) do
			local ccat = scroller:Add("DCollapsibleCategory")
			ccat.Text_Name = tier_name:Right( -2 )
			ccat.Text_Color = rtc[ccat.Text_Name] or color_white
			ccat:Dock(TOP)
			ccat:DockPadding( 4, 0, 0, 0 )
			ccat:SetLabel( ccat.Text_Name )

			function ccat:Paint( w, h )
				surface.SetDrawColor( ccat.Text_Color )
				surface.DrawRect( 0, 0, w, h )
			end

			local grid = vgui.Create("DGrid", ccat)
			grid:Dock( TOP )
			grid:SetCols( 4 )
			grid:SetColWide( 150+4 )
			grid:SetRowHeight( 75+4 )

			local ccatp = ccat.PerformLayout
			function ccat:PerformLayout(w, h)
				ccatp(ccat, w, h)
				grid:SetCols( math.floor(self:GetWide()/(150+4)) )
			end

			for i, classname in ipairs(tier_table) do
				local weapon = vgui.Create("DButton")
				weapon:SetSize( 150, 75 )

				local it = weapons.GetStored(classname)
				if !it then
					print( classname .. " isn't real, skipping" )
					continue
				end
				local Text_Name = it.AbbrevName or it.PrintName
				local Text_Cost = TacRPCredit.DefinedItems[classname]
				local Text_Faction = it.Faction

				function weapon:Paint(w, h)
					surface.SetDrawColor( 255, 255, 255, 16 )
					surface.DrawRect( 0, 0, w, h )

					surface.SetDrawColor( 255, 255, 255 )
					local themat = Material( "entities/" .. classname .. ".png" )
					surface.SetMaterial( themat, "mips smooth" )
				
					local blep = h*2
					surface.DrawTexturedRect( w/2 - blep/2, h/2 - blep/2, blep, blep )
					

					surface.SetFont("CHR_20")
					local tns = surface.GetTextSize(Text_Name)
					surface.SetDrawColor( 0, 0, 0, 200 )
					surface.DrawRect( 0, h - 20, 4+tns+4, 20 )
				
					-- name
					draw.SimpleText( Text_Name, "CHR_20", 4-1, h-20-1, color_black )
					draw.SimpleText( Text_Name, "CHR_20", 4,   h-20-1, color_black )
					draw.SimpleText( Text_Name, "CHR_20", 4+1, h-20-1, color_black )
				
					draw.SimpleText( Text_Name, "CHR_20", 4-1, h-20, color_black )

					draw.SimpleText( Text_Name, "CHR_20", 4+1, h-20, color_black )
			
					draw.SimpleText( Text_Name, "CHR_20", 4-1, h-20+1, color_black )
					draw.SimpleText( Text_Name, "CHR_20", 4,   h-20+1, color_black )
					draw.SimpleText( Text_Name, "CHR_20", 4+1, h-20+1, color_black )

					draw.SimpleText( Text_Name, "CHR_20", 4, h-20, color_white )

					-- money
					--draw.SimpleText( Text_Cost.." $", "CHR_24I", w-4-1, -1, color_white, TEXT_ALIGN_RIGHT )
					--draw.SimpleText( Text_Cost.." $", "CHR_24I", w-4,   -1, color_white, TEXT_ALIGN_RIGHT )
					--draw.SimpleText( Text_Cost.." $", "CHR_24I", w-4+1, -1, color_white, TEXT_ALIGN_RIGHT )
--
					--draw.SimpleText( Text_Cost.." $", "CHR_24I", w-4-1, 0, color_white, TEXT_ALIGN_RIGHT )
--
					--draw.SimpleText( Text_Cost.." $", "CHR_24I", w-4+1, 0, color_white, TEXT_ALIGN_RIGHT )
--
					--draw.SimpleText( Text_Cost.." $", "CHR_24I", w-4-1, 1, color_white, TEXT_ALIGN_RIGHT )
					--draw.SimpleText( Text_Cost.." $", "CHR_24I", w-4,   1, color_white, TEXT_ALIGN_RIGHT )
					--draw.SimpleText( Text_Cost.." $", "CHR_24I", w-4+1, 1, color_white, TEXT_ALIGN_RIGHT )
					

					
					surface.SetFont("CHR_16I")
					local tns = surface.GetTextSize(Text_Cost.." $")
					surface.SetDrawColor( 0, 150, 0 )
					surface.DrawRect( w-tns-2-2, 0, tns+2+2, 16 )
					draw.SimpleText( Text_Cost.." $", "CHR_16I", w-2, 0, color_white, TEXT_ALIGN_RIGHT )

					return true
				end
				grid:AddItem(weapon)
			end
		end

	end

end

concommand.Add("tcred_buymenu", TacRPCredit.Shop)

--TacRPCredit.Shop()
