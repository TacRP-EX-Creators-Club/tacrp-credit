
local fn = "Myriad Pro"--"Bahnschrift"
local sizes = {24, 20, 16, 10}
for i, v in ipairs(sizes) do
	surface.CreateFont( "CHR_"..v, {
		font = fn,
		size = v,
		weight = 0,
	})
	surface.CreateFont( "CHR_"..v.."I", {
		font = fn,
		size = v,
		italic = true,
		weight = 0,
	})
end

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

local function qt( text, font, w, h, alignx, aligny )
	draw.SimpleText( text, font, w-1, h-1, color_black, alignx, aligny )
	draw.SimpleText( text, font, w,   h-1, color_black, alignx, aligny )
	draw.SimpleText( text, font, w+1, h-1, color_black, alignx, aligny )

	draw.SimpleText( text, font, w-1, h, color_black, alignx, aligny )
	draw.SimpleText( text, font, w+1, h, color_black, alignx, aligny )

	draw.SimpleText( text, font, w-1, h+1, color_black, alignx, aligny )
	draw.SimpleText( text, font, w,   h+1, color_black, alignx, aligny )
	draw.SimpleText( text, font, w+1, h+1, color_black, alignx, aligny )

	draw.SimpleText( text, font, w, h, color_white, alignx, aligny )
end

function TacRPCredit.Shop()
	if Frame then Frame:Remove() Frame = nil end
	Frame = vgui.Create( "DFrame" ) -- Create a Frame to contain everything.
	Frame:SetTitle( "" )
	Frame:SetSize( 5+150+5+5+5+155+155+155+155+5+10, 750 )
	Frame:Center()
	Frame:MakePopup()
	Frame:SetSizable( true )
	Frame:DockPadding( 5, 5+20+5, 5, 5 )

	Frame:ShowCloseButton( false )
	function Frame:Paint( w, h )
		surface.SetDrawColor( 127, 127, 127, 255 )
		surface.DrawRect( 0, 0, w, h )
		return true
	end

	local searchbar = Frame:Add("DTextEntry")
	searchbar:SetPos( Frame:GetWide()/2 - 300/2, 5 )
	searchbar:SetWide( 300 )
	searchbar:SetTall( 20 )
	function searchbar:Paint( w, h )
		surface.SetDrawColor( 191, 191, 191, 255 )
		surface.DrawRect( 0, 0, w, h )

		local val = self:GetValue()
		if val == "" then
			val = "Filter.."
		end

		draw.SimpleText( val, "CHR_20", 2, 0, color_black )
	end

	local closebutton = Frame:Add("DButton")
	closebutton:SetPos( Frame:GetWide() - 5 - 20, 5 )
	closebutton:SetSize( 20, 20 )
	function closebutton:Paint( w, h )
		surface.SetDrawColor( 63, 63, 63, 255 )
		surface.DrawRect( 0, 0, w, h )

		qt( "X", "CHR_20", 6, 0 )
		return true
	end
	function closebutton:DoClick()
		Frame:Remove()
		return true
	end

	function Frame:PerformLayout( w, h )
		searchbar:SetPos( w/2 - 300/2, 5 )
		closebutton:SetPos( w - 5 - 20, 5 )
	end

	local sheet = vgui.Create( "DColumnSheet", Frame )
	sheet.Navigation:SetWidth( 150 )
	sheet.Navigation:DockMargin( 0, 0, 5, 0 )

	sheet.Navigation.VBar:SetWide(15)
	sheet.Navigation.VBar:SetHideButtons(true)
	sheet.Navigation.VBar:DockMargin( 0, 0, 0, 0 )
	function sheet.Navigation.VBar:Paint( w, h ) return true end
	function sheet.Navigation.VBar.btnGrip:Paint( w, h )
		surface.SetDrawColor( 63, 63, 63, 255 )
		surface.DrawRect( 5, 0, w-5, h )
	end

	sheet:Dock( FILL )

	for t1_name, t1_info in SortedPairs( TacRPCredit.Cats ) do

		local TypeName = t1_name:Right(-2)

		local panel1 = vgui.Create( "DPanel", sheet )
		panel1.Paint = function( self, w, h ) return true end
		panel1:Dock(FILL)
		local result = sheet:AddSheet( "", panel1 )

		result.Button:DockMargin( 0, 0, 0, 2 )
		result.Button:SetTall( 24 )
		function result.Button:Paint( w, h )
			if sheet:GetActiveButton() == self then
				surface.SetDrawColor( 255, 127, 0, 255 )
			else
				surface.SetDrawColor( 63, 63, 63, 255 )
			end
			surface.DrawRect( 0, 0, w, h )

			qt( TypeName, "CHR_20I", 4, 2 )
		end


		local scroller = panel1:Add("DScrollPanel")
		scroller:Dock(FILL)
		scroller.VBar:SetWide(10)
		scroller.VBar:SetHideButtons(true)

		function scroller.VBar:Paint( w, h ) return true end
		function scroller.VBar.btnGrip:Paint( w, h )
			surface.SetDrawColor( 63, 63, 63, 255 )
			surface.DrawRect( 0, 0, w, h )
		end

		function scroller.VBar:SetUp( _barsize_, _canvassize_ )
			self.BarSize = _barsize_
			self.CanvasSize = math.max( _canvassize_ - _barsize_, 0 )
			self:SetEnabled( true )
			self:InvalidateLayout()
		end
		
		-- header.tierheaders[tier_name] = header_tier
		-- header_tier.Text_Name = tier_name:Right( -2 )
		-- header_tier.Text_Color = rtc[header_tier.Text_Name]

		local typeheaders = {}
		for tier_name, tier_table in SortedPairs( t1_info ) do
			local ccat = scroller:Add("DCollapsibleCategory")
			ccat.Text_Name = tier_name:Right( -2 )
			ccat.Text_Color = rtc[ccat.Text_Name] or color_white
			ccat:Dock(TOP)
			ccat:DockMargin( 0, 0, 5, 5 )
			ccat:DockPadding( 5, 0, 0, 0 )
			ccat:SetLabel( "" or ccat.Text_Name )

			function ccat:Paint( w, h )
				surface.SetDrawColor( ccat.Text_Color )
				surface.DrawRect( 0, 0, w, h )

				qt( ccat.Text_Name, "CHR_16I", 4, 2 )
			end

			local grid = vgui.Create("DGrid", ccat)
			grid:Dock( TOP )
			grid:SetCols( 4 )
			grid:SetColWide( 150+5 )
			grid:SetRowHeight( 75+5 )

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
					qt( Text_Name, "CHR_20", 4, h-20 )

					-- money
					surface.SetFont("CHR_16I")
					local tns = surface.GetTextSize(Text_Cost)
					surface.SetDrawColor( 30, 160, 30 )
					surface.DrawRect( w-(tns+6)-2-2, 0, (tns+6)+2+2, 16 )
					qt( Text_Cost, "CHR_16I", w-3, 0, TEXT_ALIGN_RIGHT )
					qt( "$", "CHR_10I", w-3-tns-1, 3, TEXT_ALIGN_RIGHT )

					return true
				end
				grid:AddItem(weapon)
			end
		end

	end

end

concommand.Add("tcred_buymenu", TacRPCredit.Shop)

--TacRPCredit.Shop()
