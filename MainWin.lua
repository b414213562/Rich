
function DrawMainWindow()

	local tempWidth = 200;
	local tempHeight = 330;

	-- Main Parent window to hold all the elements
	wMainWinParent = Turbine.UI.Lotro.Window();
	wMainWinParent:SetSize(tempWidth,tempHeight);
	wMainWinParent:SetPosition(SETTINGS.MAINWIN.X,SETTINGS.MAINWIN.Y);
	wMainWinParent:SetText(PLUGINNAME);
	wMainWinParent:SetVisible(SETTINGS.MAINWIN.VISIBLE);

	Onscreen(wMainWinParent); -- Makes sure the window is still onscreen (perhaps user changed resolution since last playing)

	-- Background control to hold the background image
	wMainBack = Turbine.UI.Control();
	wMainBack:SetParent(wMainWinParent);
	wMainBack:SetSize(197,329);
	wMainBack:SetPosition(2,-5);
	wMainBack:SetBlendMode(4);
	wMainBack:SetBackground(_IMAGES.MAINBACK);
	wMainBack:SetMouseVisible(false);

	btnBarter = Turbine.UI.Lotro.Button();
	btnBarter:SetParent(wMainWinParent);
	btnBarter:SetWidth(70);
	btnBarter:SetPosition((tempWidth/2)-(btnBarter:GetWidth()+5),tempHeight-40);
	btnBarter:SetText(_LANG.BARTER[SETTINGS.LANGUAGE]);

	btnBarter.Click = function ()
		if wBarterWinParent == nil then DrawBarterWin() end;
		wBarterWinParent:SetVisible(not wBarterWinParent:IsVisible());
	end


	btnStats = Turbine.UI.Lotro.Button();
	btnStats:SetParent(wMainWinParent);
	btnStats:SetWidth(70);
	btnStats:SetPosition((tempWidth/2)+5,tempHeight-40);
	btnStats:SetText(_LANG.STATS[SETTINGS.LANGUAGE]);

	btnStats.Click = function (sender, args)
		SETTINGS.STATWIN.VISIBLE = true;
		wStatWinParent:SetVisible(true);
	end


	-- Labels ---------------------------------------------------------
	lbltitleDuration = Turbine.UI.Label();
	lbltitleDuration:SetParent(wMainWinParent);
	lbltitleDuration:SetSize(160,20);
	lbltitleDuration:SetPosition(10,50);
	lbltitleDuration:SetFont(BFONT);
	lbltitleDuration:SetForeColor(YELLOW);
	lbltitleDuration:SetText(_LANG.DURATION[SETTINGS.LANGUAGE]);

	lblRoundDuration = Turbine.UI.Label();
	lblRoundDuration:SetParent(wMainWinParent);
	lblRoundDuration:SetSize(160,40);
	lblRoundDuration:SetPosition(20,70);
	lblRoundDuration:SetFont(TIMEFONT);


	lbltitleQstTH = Turbine.UI.Label();
	lbltitleQstTH:SetParent(wMainWinParent);
	lbltitleQstTH:SetSize(160,20);
	lbltitleQstTH:SetPosition(10,100);
	lbltitleQstTH:SetFont(BFONT);
	lbltitleQstTH:SetForeColor(YELLOW);
	lbltitleQstTH:SetText(_LANG.THRESET[SETTINGS.LANGUAGE]);

	lblCDTH = Turbine.UI.Label();
	lblCDTH:SetParent(wMainWinParent);
	lblCDTH:SetSize(160,40);
	lblCDTH:SetPosition(20,120);
	lblCDTH:SetFont(TIMEFONT);

	local CURTIME = Turbine.Engine.GetLocalTime();
	if CURTIME > STATS[MYNAME].QUESTTHEXP then
		-- Quest has cooled-down
		lblCDTH:SetText(_LANG.QUESTRESET[SETTINGS.LANGUAGE]);
	else
		QUESTTH = STATS[MYNAME].QUESTTHEXP;
		QUESTTHCOMPLETE = true;
	end

	lbltitleQstBER = Turbine.UI.Label();
	lbltitleQstBER:SetParent(wMainWinParent);
	lbltitleQstBER:SetSize(160,20);
	lbltitleQstBER:SetPosition(10,150);
	lbltitleQstBER:SetFont(BFONT);
	lbltitleQstBER:SetForeColor(YELLOW);
	lbltitleQstBER:SetText(_LANG.BERRESET[SETTINGS.LANGUAGE]);

	lblCDBERRY = Turbine.UI.Label();
	lblCDBERRY:SetParent(wMainWinParent);
	lblCDBERRY:SetSize(160,40);
	lblCDBERRY:SetPosition(20,170);
	lblCDBERRY:SetFont(TIMEFONT);

	if CURTIME > STATS[MYNAME].QUESTBEREXP then
		-- Quest has cooled-down
		lblCDBERRY:SetText(_LANG.QUESTRESET[SETTINGS.LANGUAGE]);
	else
		QUESTBER = STATS[MYNAME].QUESTBEREXP;
		QUESTBERCOMPLETE = true;
	end

	-- Quickslots ---------------------------------------------------------------------

	caveclaw_underlay = Turbine.UI.Control();
	caveclaw_underlay:SetParent(wMainWinParent);
	caveclaw_underlay:SetSize(32,32);
	caveclaw_underlay:SetPosition(23,203);
	caveclaw_underlay:SetBackground(_IMAGES.GREY_CAVECLAW);
	caveclaw_underlay:SetMouseVisible(false);

	qsCaveClaws = Turbine.UI.Lotro.ItemControl();
	qsCaveClaws:SetParent(wMainWinParent);
	qsCaveClaws:SetPosition(20,200);


	dowsing_underlay = Turbine.UI.Control();
	dowsing_underlay:SetParent(wMainWinParent);
	dowsing_underlay:SetSize(32,32);
	dowsing_underlay:SetPosition(63,203);
	dowsing_underlay:SetBackground(_IMAGES.GREY_DOWSING);
	dowsing_underlay:SetMouseVisible(false);

	qsDowsing = Turbine.UI.Lotro.ItemControl();
	qsDowsing:SetParent(wMainWinParent);
	qsDowsing:SetPosition(60,200);


	picks_underlay = Turbine.UI.Control();
	picks_underlay:SetParent(wMainWinParent);
	picks_underlay:SetSize(32,32);
	picks_underlay:SetPosition(103,203);
	picks_underlay:SetBackground(_IMAGES.GREY_PICK);
	picks_underlay:SetMouseVisible(false);

	qsPicks = Turbine.UI.Lotro.ItemControl();
	qsPicks:SetParent(wMainWinParent);
	qsPicks:SetPosition(100,200);


	cTokens = NewItemInfo(1879206049);
	cTokens:SetParent(wMainWinParent);
	cTokens:SetPosition(140,200);


	treasuresmall_underlay = Turbine.UI.Control();
	treasuresmall_underlay:SetParent(wMainWinParent);
	treasuresmall_underlay:SetSize(32,32);
	treasuresmall_underlay:SetPosition(23,245);
	treasuresmall_underlay:SetBackground(_IMAGES.GREY_TREASURESMALL);
	treasuresmall_underlay:SetMouseVisible(false);

	qsSmallCache = Turbine.UI.Lotro.ItemControl();
	qsSmallCache:SetParent(wMainWinParent);
	qsSmallCache:SetPosition(20,242);


	treasuresmed_underlay = Turbine.UI.Control();
	treasuresmed_underlay:SetParent(wMainWinParent);
	treasuresmed_underlay:SetSize(32,32);
	treasuresmed_underlay:SetPosition(63,245);
	treasuresmed_underlay:SetBackground(_IMAGES.GREY_TREASUREMED);
	treasuresmed_underlay:SetMouseVisible(false);

	qsMedCache = Turbine.UI.Lotro.ItemControl();
	qsMedCache:SetParent(wMainWinParent);
	qsMedCache:SetPosition(60,242);


	treasureslarge_underlay = Turbine.UI.Control();
	treasureslarge_underlay:SetParent(wMainWinParent);
	treasureslarge_underlay:SetSize(32,32);
	treasureslarge_underlay:SetPosition(103,245);
	treasureslarge_underlay:SetBackground(_IMAGES.GREY_TREASURELARGE);
	treasureslarge_underlay:SetMouseVisible(false);

	qsLargeCache = Turbine.UI.Lotro.ItemControl();
	qsLargeCache:SetParent(wMainWinParent);
	qsLargeCache:SetPosition(100,242);


	treasureshuge_underlay = Turbine.UI.Control();
	treasureshuge_underlay:SetParent(wMainWinParent);
	treasureshuge_underlay:SetSize(32,32);
	treasureshuge_underlay:SetPosition(143,245);
	treasureshuge_underlay:SetBackground(_IMAGES.GREY_TREASUREHUGE);
	treasureshuge_underlay:SetMouseVisible(false);

	qsHugeCache = Turbine.UI.Lotro.ItemControl();
	qsHugeCache:SetParent(wMainWinParent);
	qsHugeCache:SetPosition(140,242);


	LocateItems();
	GetTokenIndex();

	MYBAGS.ItemAdded = function (sender,args)
		LocateItems();
	end

	MYBAGS.ItemMoved = function (sender,args)
		LocateItems();
	end

	MYBAGS.ItemRemoved = function (sender,args)
		wMainBack:SetWantsUpdates(true);
	end

	wMainBack.Update = function (sender, args)
		wMainBack:SetWantsUpdates(false);
		LocateItems();
	end

	MYBAGS.SizeChanged = function (sender,args)
		LocateItems();
	end

	wMainWinParent:SetWantsUpdates(true);

	wMainWinParent.Update = function (sender, args)
		UpdateLabels();
	end

	-- Window events
	wMainWinParent.Closing = function()
		SETTINGS.MAINWIN.VISIBLE = false;
	end

	wMainWinParent.PositionChanged = function()
		SETTINGS.MAINWIN.X = wMainWinParent:GetLeft();
		SETTINGS.MAINWIN.Y = wMainWinParent:GetTop();
	end

end


function LocateItems()

	local BAGSIZE = MYBAGS:GetSize();


	local CAVECLAWCOUNT = 0;
	local DOWSINGCOUNT = 0;
	local PICKCOUNT = 0;
	local SMALLCACHECOUNT = 0;
	local MEDIUMCACHECOUNT = 0;
	local LARGECACHECOUNT = 0;
	local HUGECACHECOUNT = 0;


	for i=1, BAGSIZE do
		if MYBAGS:GetItem(i) ~= nil then

			local CURITEM = MYBAGS:GetItem(i);
			local CURNAME = CURITEM:GetName();

			if CURNAME == _LANG.CAVECLAW[SETTINGS.LANGUAGE] then
				CAVECLAWCOUNT = CAVECLAWCOUNT + CURITEM:GetQuantity();
				qsCaveClaws:SetItem(CURITEM);
			end

			if CURNAME == _LANG.DOWSING[SETTINGS.LANGUAGE] then
				DOWSINGCOUNT = DOWSINGCOUNT + CURITEM:GetQuantity();
				qsDowsing:SetItem(CURITEM);
			end

			if CURNAME == _LANG.PICK[SETTINGS.LANGUAGE] then
				PICKCOUNT = PICKCOUNT + CURITEM:GetQuantity();
				qsPicks:SetItem(CURITEM);
			end

			if CURNAME == _LANG.SMALLCACHE[SETTINGS.LANGUAGE] then
				SMALLCACHECOUNT = SMALLCACHECOUNT + CURITEM:GetQuantity();
				qsSmallCache:SetItem(CURITEM);
			end

			if CURNAME == _LANG.MEDCACHE[SETTINGS.LANGUAGE] then
				MEDIUMCACHECOUNT = MEDIUMCACHECOUNT + CURITEM:GetQuantity();
				qsMedCache:SetItem(CURITEM);
			end

			if CURNAME == _LANG.LARGECACHE[SETTINGS.LANGUAGE] then
				LARGECACHECOUNT = LARGECACHECOUNT + CURITEM:GetQuantity();
				qsLargeCache:SetItem(CURITEM);
			end

			if CURNAME == _LANG.HUGECACHE[SETTINGS.LANGUAGE] then
				HUGECACHECOUNT = HUGECACHECOUNT + CURITEM:GetQuantity();
				qsHugeCache:SetItem(CURITEM);
			end
		end
	end

	RefreshStats();

end


function GetTokenCount()

	if TOKENINDEX > 0 then
		TOKENCOUNT = MYWALLET:GetItem(TOKENINDEX):GetQuantity();
		local QTYNEWTOKENS = TOKENCOUNT - TOKENOLDCOUNT;

		if QTYNEWTOKENS > 0 then -- looted rather than spent
			STATS[MYNAME].TOTALTOKENS = STATS[MYNAME].TOTALTOKENS + QTYNEWTOKENS;
		else	-- spent rather than looted
			STATS[MYNAME].TOTALSPENT = STATS[MYNAME].TOTALSPENT + math.abs(QTYNEWTOKENS);
		end

		--tokens_image:SetBackground(MYWALLET:GetItem(TOKENINDEX):GetImage());
	else
		TOKENCOUNT = 0;
		--tokens_image:SetBackground(_IMAGES.GREY_TOKENS);
	end

	TOKENOLDCOUNT = TOKENCOUNT;
	--tokens_label_underlay:SetText(comma_value(TOKENCOUNT));

	cTokens:SetQuantity(TOKENCOUNT);

	RefreshStats();

end


function GetTokenIndex()

	TOKENINDEX = 0;

	for i=1, MYWALLET:GetSize() do
		if MYWALLET:GetItem(i):GetName() == _LANG.TOKENS[SETTINGS.LANGUAGE] then
			TOKENINDEX = i;
			TOKENOLDCOUNT = MYWALLET:GetItem(TOKENINDEX):GetQuantity();

			if STATS[MYNAME].TOTALTOKENS == 0 and TOKENOLDCOUNT > 0 then STATS[MYNAME].TOTALTOKENS = TOKENOLDCOUNT end;

			MYWALLET:GetItem(i).QuantityChanged = function (sender,args)
				GetTokenCount();
			end

			break;
		end
	end

	GetTokenCount();

end


function comma_value(amount)
  local formatted = amount
  while true do
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end
