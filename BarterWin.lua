
function DrawBarterWin()

	wBarterWinParent = Turbine.UI.Lotro.Window();
	wBarterWinParent:SetSize(480,500);
	wBarterWinParent:SetPosition(SETTINGS.BARTERWIN.X,SETTINGS.BARTERWIN.Y);
	wBarterWinParent:SetVisible(false);
	wBarterWinParent:SetText(_LANG.BARTERITEMS[SETTINGS.LANGUAGE]);

	wBarterWinBack = Turbine.UI.Control();
	wBarterWinBack:SetParent(wBarterWinParent);
	wBarterWinBack:SetSize(480,500);
	wBarterWinBack:SetPosition(1,-2);
	wBarterWinBack:SetBackground(_IMAGES.BARTERBACK);
	wBarterWinBack:SetBlendMode(4);
	wBarterWinBack:SetMouseVisible(false);

	lblBarterFestival = Turbine.UI.Label();
	lblBarterFestival:SetParent(wBarterWinParent);
	lblBarterFestival:SetPosition(30,40);
	lblBarterFestival:SetSize(420,30);
	lblBarterFestival:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	lblBarterFestival:SetFont(Turbine.UI.Lotro.Font.TrajanPro16);
	lblBarterFestival:SetForeColor(YELLOW);
	lblBarterFestival:SetText(_LANG.TREASUREHUNT[SETTINGS.LANGUAGE]);
	--lblBarterFestival:SetBackColor(Turbine.UI.Color.White);

	lstBarterItems = Turbine.UI.ListBox();
	lstBarterItems:SetParent(wBarterWinParent);
	lstBarterItems:SetSize(422,380);
	lstBarterItems:SetPosition(25,80);

	slstBarterItems = Turbine.UI.Lotro.ScrollBar();
	slstBarterItems:SetParent(wBarterWinParent);
	slstBarterItems:SetSize(8,lstBarterItems:GetHeight());
	slstBarterItems:SetPosition(lstBarterItems:GetLeft()+lstBarterItems:GetWidth()+2,lstBarterItems:GetTop());
	slstBarterItems:SetOrientation(Turbine.UI.Orientation.Vertical);
	slstBarterItems:SetZOrder(200000);
	slstBarterItems:SetVisible(false);

	lstBarterItems:SetVerticalScrollBar(slstBarterItems);

	RefreshBarterList();


	-- Events
	wBarterWinParent.PositionChanged = function()
		SETTINGS.BARTERWIN.X = wBarterWinParent:GetLeft();
		SETTINGS.BARTERWIN.Y = wBarterWinParent:GetTop();
	end

end


function RefreshBarterList()

	lstBarterItems:ClearItems();

	local ROWWIDTH = 422;
	local ROWHEIGHT = 45;

	for k,v in ipairs (_BARTER) do

		local ROWHOLDER = Turbine.UI.Control();
		ROWHOLDER:SetSize(ROWWIDTH,ROWHEIGHT);

		local ROWBACK = Turbine.UI.Control();
		ROWBACK:SetParent(ROWHOLDER);
		ROWBACK:SetSize(ROWWIDTH,ROWHEIGHT-5);
		ROWBACK:SetBackground(_IMAGES.BARTERITEMSBACK);
		ROWBACK:SetBlendMode(4);

		local item = 0;
		if type(v[1]) == 'string' then
			item = NewItemInfo(v[1],true);
		else
			item = NewItemInfo(v[1]);
		end

		local cItemInspect = Turbine.UI.Lotro.ItemInfoControl();
		cItemInspect:SetParent(ROWBACK);
		cItemInspect:SetSize(36,36);
		cItemInspect:SetPosition(1,1);
		cItemInspect:SetItemInfo(item:GetItemInfo());
		cItemInspect:SetQuantity(1);

		if v[3] ~= nil then cItemInspect:SetQuantity(v[3]) end;

		local lblItemName = Turbine.UI.Label();
		lblItemName:SetParent(ROWBACK);
		lblItemName:SetPosition(40,2);
		lblItemName:SetSize(ROWWIDTH-150,36);
		lblItemName:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
		lblItemName:SetForeColor(_QUALITYCOLORS[item:GetItemInfo():GetQuality()]);
		--lblItemName:SetBackColor(Turbine.UI.Color.Red);
		lblItemName:SetFont(Turbine.UI.Lotro.Font.TrajanPro14);
		lblItemName:SetText(item:GetItemInfo():GetName());

		local lstTokensNeeded = Turbine.UI.ListBox();
		lstTokensNeeded:SetParent(ROWBACK);
		lstTokensNeeded:SetSize(110,36);
		lstTokensNeeded:SetPosition(ROWWIDTH-lstTokensNeeded:GetWidth(),0);
		lstTokensNeeded:SetOrientation(Turbine.UI.Orientation.Horizontal);
		--lstTokensNeeded:SetBackColor(Turbine.UI.Color.Red);

		if type(v[2])=='table' then
			for k,v in pairs (v[2]) do
				local tokenItem = NewItemInfo(_TOKENS[k]);
				if tokenItem ~= nil then
					local cTokenInspect = Turbine.UI.Lotro.ItemInfoControl();
					cTokenInspect:SetParent(ROWBACK);
					cTokenInspect:SetSize(36,36);
					cTokenInspect:SetPosition(1,1);
					cTokenInspect:SetItemInfo(tokenItem:GetItemInfo());
					cTokenInspect:SetQuantity(v);

					lstTokensNeeded:AddItem(cTokenInspect);
				end
			end
		end

		lstBarterItems:AddItem(ROWHOLDER);
	end

	lstBarterItems:SetSelectedIndex(1);
end




