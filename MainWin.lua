
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
	btnBarter:SetPosition((tempWidth/2)-(btnBarter:GetWidth()+5),tempHeight-50);
	btnBarter:SetText(_LANG.BARTER[CLIENTLANG]);

	btnBarter.Click = function ()
		if wBarterWinParent == nil then DrawBarterWin() end;
		wBarterWinParent:SetVisible(not wBarterWinParent:IsVisible());
	end


	btnStats = Turbine.UI.Lotro.Button();
	btnStats:SetParent(wMainWinParent);
	btnStats:SetWidth(70);
	btnStats:SetPosition((tempWidth/2)+5,tempHeight-50);
	btnStats:SetText(_LANG.STATS[CLIENTLANG]);

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
	lbltitleDuration:SetText(_LANG.DURATION[CLIENTLANG]);

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
	lbltitleQstTH:SetText(_LANG.THRESET[CLIENTLANG]);

	lblCDTH = Turbine.UI.Label();
	lblCDTH:SetParent(wMainWinParent);
	lblCDTH:SetSize(160,40);
	lblCDTH:SetPosition(20,120);
	lblCDTH:SetFont(TIMEFONT);

	local CURTIME = Turbine.Engine.GetLocalTime();
	if CURTIME > STATS[MYNAME].QUESTTHEXP then
		-- Quest has cooled-down
		lblCDTH:SetText(_LANG.QUESTRESET[CLIENTLANG]);
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
	lbltitleQstBER:SetText(_LANG.BERRESET[CLIENTLANG]);

	lblCDBERRY = Turbine.UI.Label();
	lblCDBERRY:SetParent(wMainWinParent);
	lblCDBERRY:SetSize(160,40);
	lblCDBERRY:SetPosition(20,170);
	lblCDBERRY:SetFont(TIMEFONT);

	if CURTIME > STATS[MYNAME].QUESTBEREXP then
		-- Quest has cooled-down
		lblCDBERRY:SetText(_LANG.QUESTRESET[CLIENTLANG]);
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

    local variables = {
        [_LANG.CAVECLAW[CLIENTLANG]] = {
            ["COUNT"] = 0;
            ["PARTIAL"] = false;
            ["QUICKSLOT_COUNT"] = 0;
            ["QUICKSLOT"] = qsCaveClaws;
            ["LABEL"] = overflowcaveclaws;
        };
        [_LANG.DOWSING[CLIENTLANG]] = {
            ["COUNT"] = 0;
            ["PARTIAL"] = false;
            ["QUICKSLOT_COUNT"] = 0;
            ["QUICKSLOT"] = qsDowsing;
            ["LABEL"] = overflowDowsing;
        };
        [_LANG.PICK[CLIENTLANG]] = {
            ["COUNT"] = 0;
            ["PARTIAL"] = false;
            ["QUICKSLOT_COUNT"] = 0;
            ["QUICKSLOT"] = qsPicks;
            ["LABEL"] = overflowPicks;
        };
        [_LANG.SMALLCACHE[CLIENTLANG]] = {
            ["COUNT"] = 0;
            ["PARTIAL"] = false;
            ["QUICKSLOT_COUNT"] = 0;
            ["QUICKSLOT"] = qsSmallCache;
            ["LABEL"] = overflowSmallCache;
        };
        [_LANG.MEDCACHE[CLIENTLANG]] = {
            ["COUNT"] = 0;
            ["PARTIAL"] = false;
            ["QUICKSLOT_COUNT"] = 0;
            ["QUICKSLOT"] = qsMedCache;
            ["LABEL"] = overflowMedCache;
        };
        [_LANG.LARGECACHE[CLIENTLANG]] = {
            ["COUNT"] = 0;
            ["PARTIAL"] = false;
            ["QUICKSLOT_COUNT"] = 0;
            ["QUICKSLOT"] = qsLargeCache;
            ["LABEL"] = overflowLargeCache;
        };
        [_LANG.HUGECACHE[CLIENTLANG]] = {
            ["COUNT"] = 0;
            ["PARTIAL"] = false;
            ["QUICKSLOT_COUNT"] = 0;
            ["QUICKSLOT"] = qsHugeCache;
            ["LABEL"] = overflowHugeCache;
        };
    };

    -- quickslots always prefer partial stacks over full stacks, but between partials, user can control which populates quickslot, by rearranging in bags
    -- not all of the full-stack cases have been validated for caches, due to daunting test prereqs. Over 50 huge caches (gulp!)

	for i=1, BAGSIZE do
		if MYBAGS:GetItem(i) ~= nil then

			local currentItem = MYBAGS:GetItem(i);
			local currentName = currentItem:GetName();

            -- We need to pay attention to item.QuantityChanged.
            -- If we don't, then merging partial stacks or overflowing a full stack can produce inaccurate counts.

            -- If this is one of the Treasure Hunt items in our quickslots:
            if (variables[currentName]) then
				local quantity = currentItem:GetQuantity();

				variables[currentName].COUNT = variables[currentName].COUNT + quantity;

				if ((quantity < currentItem:GetMaxStackSize()) or (not variables[currentName].PARTIAL)) then
					variables[currentName].QUICKSLOT:SetItem(currentItem);
					if (quantity < currentItem:GetMaxStackSize()) then
						variables[currentName].PARTIAL = true;
					end
					variables[currentName].QUICKSLOT_COUNT = quantity;
				end
				local quantityNotInStack = variables[currentName].COUNT - variables[currentName].QUICKSLOT_COUNT;
				SetOverflowText(variables[currentName].LABEL, quantityNotInStack);

				currentItem.QuantityChanged = currentItem.QuantityChanged or function (sender, args)
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
		if MYWALLET:GetItem(i):GetName() == _LANG.TOKENS[CLIENTLANG] then
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
