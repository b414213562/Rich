
function DrawMainWindow()

	local tempWidth = 200;
	local tempHeight = 345;

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
	wMainBack:SetSize(197,344);
	wMainBack:SetPosition(2,-5);
	wMainBack:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
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

	overflowcaveclaws = CreateOverflowLabel(23, 188);

	dowsing_underlay = Turbine.UI.Control();
	dowsing_underlay:SetParent(wMainWinParent);
	dowsing_underlay:SetSize(32,32);
	dowsing_underlay:SetPosition(63,203);
	dowsing_underlay:SetBackground(_IMAGES.GREY_DOWSING);
	dowsing_underlay:SetMouseVisible(false);

	qsDowsing = Turbine.UI.Lotro.ItemControl();
	qsDowsing:SetParent(wMainWinParent);
	qsDowsing:SetPosition(60,200);

	overflowDowsing = CreateOverflowLabel(63, 188);

	picks_underlay = Turbine.UI.Control();
	picks_underlay:SetParent(wMainWinParent);
	picks_underlay:SetSize(32,32);
	picks_underlay:SetPosition(103,203);
	picks_underlay:SetBackground(_IMAGES.GREY_PICK);
	picks_underlay:SetMouseVisible(false);

	qsPicks = Turbine.UI.Lotro.ItemControl();
	qsPicks:SetParent(wMainWinParent);
	qsPicks:SetPosition(100,200);

	overflowPicks = CreateOverflowLabel(103, 188);

	tokens_underlay = Turbine.UI.Control();
	tokens_underlay:SetParent(wMainWinParent);
	tokens_underlay:SetSize(32,32);
	tokens_underlay:SetPosition(143, 203);
	tokens_underlay:SetBackground(_IMAGES.GREY_TOKENS);
	tokens_underlay:SetMouseVisible(false);
	tokens_underlay:SetVisible(false);

	cTokens = NewItemInfo(1879206049);
	cTokens:SetParent(wMainWinParent);
	cTokens:SetPosition(143, 203);


	treasuresmall_underlay = Turbine.UI.Control();
	treasuresmall_underlay:SetParent(wMainWinParent);
	treasuresmall_underlay:SetSize(32,32);
	treasuresmall_underlay:SetPosition(23,245);
	treasuresmall_underlay:SetBackground(_IMAGES.GREY_TREASURESMALL);
	treasuresmall_underlay:SetMouseVisible(false);

	qsSmallCache = Turbine.UI.Lotro.ItemControl();
	qsSmallCache:SetParent(wMainWinParent);
	qsSmallCache:SetPosition(20,242);

	overflowSmallCache = CreateOverflowLabel(23, 280);

	treasuresmed_underlay = Turbine.UI.Control();
	treasuresmed_underlay:SetParent(wMainWinParent);
	treasuresmed_underlay:SetSize(32,32);
	treasuresmed_underlay:SetPosition(63,245);
	treasuresmed_underlay:SetBackground(_IMAGES.GREY_TREASUREMED);
	treasuresmed_underlay:SetMouseVisible(false);

	qsMedCache = Turbine.UI.Lotro.ItemControl();
	qsMedCache:SetParent(wMainWinParent);
	qsMedCache:SetPosition(60,242);

	overflowMedCache = CreateOverflowLabel(63, 280);

	treasureslarge_underlay = Turbine.UI.Control();
	treasureslarge_underlay:SetParent(wMainWinParent);
	treasureslarge_underlay:SetSize(32,32);
	treasureslarge_underlay:SetPosition(103,245);
	treasureslarge_underlay:SetBackground(_IMAGES.GREY_TREASURELARGE);
	treasureslarge_underlay:SetMouseVisible(false);

	qsLargeCache = Turbine.UI.Lotro.ItemControl();
	qsLargeCache:SetParent(wMainWinParent);
	qsLargeCache:SetPosition(100,242);

	overflowLargeCache = CreateOverflowLabel(103, 280);

	treasureshuge_underlay = Turbine.UI.Control();
	treasureshuge_underlay:SetParent(wMainWinParent);
	treasureshuge_underlay:SetSize(32,32);
	treasureshuge_underlay:SetPosition(143,245);
	treasureshuge_underlay:SetBackground(_IMAGES.GREY_TREASUREHUGE);
	treasureshuge_underlay:SetMouseVisible(false);

	qsHugeCache = Turbine.UI.Lotro.ItemControl();
	qsHugeCache:SetParent(wMainWinParent);
	qsHugeCache:SetPosition(140,242);

	overflowHugeCache = CreateOverflowLabel(143, 280);

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

---Factory for overflow labels.
---@param left number
---@param top number
---@return Label
function CreateOverflowLabel(left, top)
	local overflowLabel = Turbine.UI.Label();
	overflowLabel:SetParent(wMainWinParent);
	overflowLabel:SetSize(32,32);
	overflowLabel:SetPosition(left, top);
	overflowLabel:SetVisible(true);

    return overflowLabel;
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

    -- quickslots always prefer partial stacks over full stacks, but between partials, user can control which populates quickslot, by rearranging in bags
    -- not all of the full-stack cases have been validated for caches, due to daunting test prereqs. Over 50 huge caches (gulp!)

	local PARTIALCAVECLAWSTACK = false;
	local PARTIALDOWSINGSTACK = false;
	local PARTIALPICKSTACK = false;
	local PARTIALSMALLCACHESTACK = false;
	local PARTIALMEDCACHESTACK = false;
	local PARTIALLARGECACHESTACK = false;

	local CAVECLAWSINQUICKSLOT = 0;
	local DOWSINGINQUICKSLOT = 0;
	local PICKSINQUICKSLOT = 0;
	local SMALLCACHESINQUICKSLOT = 0;
	local MEDCACHESINQUICKSLOT = 0;
	local LARGECACHESINQUICKSLOT = 0;
	local HUGECACHESINQUICKSLOT = 0;


	for i=1, BAGSIZE do
		if MYBAGS:GetItem(i) ~= nil then

			local CURITEM = MYBAGS:GetItem(i);
			local CURNAME = CURITEM:GetName();

			if CURNAME == _LANG.CAVECLAW[SETTINGS.LANGUAGE] then
				local THISSTACKSIZE = CURITEM:GetQuantity();
				local NOTINSTACK;

				CAVECLAWCOUNT = CAVECLAWCOUNT + THISSTACKSIZE;

				if ((THISSTACKSIZE < CURITEM:GetMaxStackSize()) or (not PARTIALCAVECLAWSTACK)) then
					qsCaveClaws:SetItem(CURITEM);
					if (THISSTACKSIZE < CURITEM:GetMaxStackSize()) then
						PARTIALCAVECLAWSTACK = true;
					end
					CAVECLAWSINQUICKSLOT = THISSTACKSIZE;
				end
				NOTINSTACK = CAVECLAWCOUNT - CAVECLAWSINQUICKSLOT;
				SetOverflowText(overflowcaveclaws, NOTINSTACK);
				
-- need to fire on QuantityChanged events, otherwise merging partial stacks and overflowing a full stack, can produce inaccurate counts

				CURITEM.QuantityChanged = CURITEM.QuantityChanged or function (sender, args)
					LocateItems();
				end
			end

			if CURNAME == _LANG.DOWSING[SETTINGS.LANGUAGE] then
				local THISSTACKSIZE = CURITEM:GetQuantity();
				local NOTINSTACK, SHOWNINQUICKSLOT;

				DOWSINGCOUNT = DOWSINGCOUNT + THISSTACKSIZE;

				if ((THISSTACKSIZE < CURITEM:GetMaxStackSize()) or (not PARTIALDOWSINGSTACK)) then
					qsDowsing:SetItem(CURITEM);
					if (THISSTACKSIZE < CURITEM:GetMaxStackSize()) then
						PARTIALDOWSINGSTACK = true;
					end
					DOWSINGINQUICKSLOT = THISSTACKSIZE;
				end
				NOTINSTACK = DOWSINGCOUNT - DOWSINGINQUICKSLOT;
				SetOverflowText(overflowDowsing, NOTINSTACK);

				CURITEM.QuantityChanged = CURITEM.QuantityChanged or function (sender, args)
					LocateItems();
				end
			end

			if CURNAME == _LANG.PICK[SETTINGS.LANGUAGE] then
				local THISSTACKSIZE = CURITEM:GetQuantity();
				local NOTINSTACK;

				PICKCOUNT = PICKCOUNT + THISSTACKSIZE;

				if ((THISSTACKSIZE < CURITEM:GetMaxStackSize()) or (not PARTIALPICKSTACK)) then
					qsPicks:SetItem(CURITEM);
					if (THISSTACKSIZE < CURITEM:GetMaxStackSize()) then
						PARTIALPICKSTACK = true;
					end
					PICKSINQUICKSLOT = THISSTACKSIZE;
				end
				NOTINSTACK = PICKCOUNT - PICKSINQUICKSLOT;
				SetOverflowText(overflowPicks, NOTINSTACK);

				CURITEM.QuantityChanged = CURITEM.QuantityChanged or function (sender, args)
					LocateItems();
				end
			end

			if CURNAME == _LANG.SMALLCACHE[SETTINGS.LANGUAGE] then
				local THISSTACKSIZE = CURITEM:GetQuantity();
				SMALLCACHECOUNT = SMALLCACHECOUNT + THISSTACKSIZE;
				if ((THISSTACKSIZE < CURITEM:GetMaxStackSize()) or (not PARTIALSMALLCACHESTACK)) then
					qsSmallCache:SetItem(CURITEM);
					if (THISSTACKSIZE < CURITEM:GetMaxStackSize()) then
						PARTIALSMALLCACHESTACK = true;
					end
					SMALLCACHESINQUICKSLOT = THISSTACKSIZE;
				end
				NOTINSTACK = SMALLCACHECOUNT - SMALLCACHESINQUICKSLOT;
				SetOverflowText(overflowSmallCache, NOTINSTACK);

				CURITEM.QuantityChanged = CURITEM.QuantityChanged or function (sender, args)
					LocateItems();
				end
			end

			if CURNAME == _LANG.MEDCACHE[SETTINGS.LANGUAGE] then
				local THISSTACKSIZE = CURITEM:GetQuantity();
				MEDIUMCACHECOUNT = MEDIUMCACHECOUNT + THISSTACKSIZE;
				if ((THISSTACKSIZE < CURITEM:GetMaxStackSize()) or (not PARTIALMEDIUMCACHESTACK)) then
					qsMedCache:SetItem(CURITEM);
					if (THISSTACKSIZE < CURITEM:GetMaxStackSize()) then
						PARTIALMEDIUMCACHESTACK = true;
					end
					MEDCACHESINQUICKSLOT = THISSTACKSIZE;
				end
				NOTINSTACK = MEDIUMCACHECOUNT - MEDCACHESINQUICKSLOT;
				SetOverflowText(overflowMedCache, NOTINSTACK);

				CURITEM.QuantityChanged = CURITEM.QuantityChanged or function (sender, args)
					LocateItems();
				end
			end

			if CURNAME == _LANG.LARGECACHE[SETTINGS.LANGUAGE] then
				local THISSTACKSIZE = CURITEM:GetQuantity();
				LARGECACHECOUNT = LARGECACHECOUNT + THISSTACKSIZE;
				if ((THISSTACKSIZE < CURITEM:GetMaxStackSize()) or (not PARTIALLARGECACHESTACK)) then
					qsLargeCache:SetItem(CURITEM);
					if (THISSTACKSIZE < CURITEM:GetMaxStackSize()) then
						PARTIALLARGECACHESTACK = true;
					end
					LARGECACHESINQUICKSLOT = THISSTACKSIZE;
				end
				NOTINSTACK = LARGECACHECOUNT - LARGECACHESINQUICKSLOT;
				SetOverflowText(overflowLargeCache, NOTINSTACK);

				CURITEM.QuantityChanged = CURITEM.QuantityChanged or function (sender, args)
					LocateItems();
				end
			end

			if CURNAME == _LANG.HUGECACHE[SETTINGS.LANGUAGE] then
				local THISSTACKSIZE = CURITEM:GetQuantity();
				HUGECACHECOUNT = HUGECACHECOUNT + THISSTACKSIZE;
				if ((THISSTACKSIZE < CURITEM:GetMaxStackSize()) or (not PARTIALHUGECACHESTACK)) then
					qsHugeCache:SetItem(CURITEM);
					if (THISSTACKSIZE < CURITEM:GetMaxStackSize()) then
						PARTIALHUGECACHESTACK = true;
					end
					HUGECACHESINQUICKSLOT = THISSTACKSIZE;
				end
				NOTINSTACK = HUGECACHECOUNT - HUGECACHESINQUICKSLOT;
				SetOverflowText(overflowHugeCache, NOTINSTACK);

				CURITEM.QuantityChanged = CURITEM.QuantityChanged or function (sender, args)
					LocateItems();
				end
			end
		end
	end

	RefreshStats();

end

function SetOverflowText(ctl, num)
	if (num == 0) then
		ctl:SetText("");
	else
		if (string.len(tostring(num)) > 2) then
			if (string.len(tostring(num)) > 3) then
				ctl:SetText("ZOMG");
			else
				ctl:SetText(num.."+");
			end
		else
			ctl:SetText(num.." +");
		end
	end
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
	else
		TOKENCOUNT = 0;
	end

	TOKENOLDCOUNT = TOKENCOUNT;
	--tokens_label_underlay:SetText(comma_value(TOKENCOUNT));

	cTokens:SetQuantity(TOKENCOUNT);
	if (TOKENCOUNT > 0) then
		tokens_underlay:SetVisible(false);
		cTokens:SetVisible(true);
	else
		tokens_underlay:SetVisible(true);
		cTokens:SetVisible(false);
		tokens_underlay:SetWantsUpdates(false);
	end

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
