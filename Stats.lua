
function DrawStatWindow()

	-- Main Parent window to hold all the elements
	wStatWinParent = Turbine.UI.Lotro.Window();
	wStatWinParent:SetSize(600,340);
	wStatWinParent:SetPosition(SETTINGS.STATWIN.X,SETTINGS.STATWIN.Y);
	wStatWinParent:SetText(_LANG.STATS[CLIENTLANG]);
	wStatWinParent:SetVisible(SETTINGS.STATWIN.VISIBLE);

	Onscreen(wStatWinParent); -- Makes sure the window is still onscreen (perhaps user changed resolution since last playing)


	-- Generate the list of character names stored in the stat table -------------------------------------------------------------
	local _LISTNAMES = {};

	for k,v in pairs (STATS) do
		table.insert(_LISTNAMES,k);
	end

	table.sort(_LISTNAMES);

	ddListNames = DropDown.Create(_LISTNAMES,MYNAME);
	ddListNames:SetParent(wStatWinParent);
	ddListNames:ApplyWidth(150);
	ddListNames:SetPosition(30,50);
	ddListNames:SetVisible(true);

	ddListNames.ItemChanged = function ()
		UpdateStats(ddListNames:GetText());
	end

	------------------------------------------------------------------------------------------------------------------------------

	_lblStats = {};

	local curTop = 90;

	-- Create labels for stats
	for i=0, 10 do	-- Rows needed for stats = 10 (+1 for headers = 11 total)

		_lblStats[i] = {};

		-- Label
		_lblStats[i][0] = Turbine.UI.Label();
		_lblStats[i][0]:SetParent(wStatWinParent);
		_lblStats[i][0]:SetPosition(30,curTop);
		_lblStats[i][0]:SetSize(200,18);
		_lblStats[i][0]:SetForeColor(Turbine.UI.Color.DarkKhaki);
		_lblStats[i][0]:SetFont(Turbine.UI.Lotro.Font.Verdana14);
		_lblStats[i][0]:SetText("-");

		-- Char stat
		_lblStats[i][1] = Turbine.UI.Label();
		_lblStats[i][1]:SetParent(wStatWinParent);
		_lblStats[i][1]:SetPosition(_lblStats[i][0]:GetLeft()+_lblStats[i][0]:GetWidth()+20,curTop);
		_lblStats[i][1]:SetSize(170,18);
		_lblStats[i][1]:SetFont(Turbine.UI.Lotro.Font.Verdana14);
		_lblStats[i][1]:SetMarkupEnabled(true);
		_lblStats[i][1]:SetText("-");

		-- All char total
		_lblStats[i][2] = Turbine.UI.Label();
		_lblStats[i][2]:SetParent(wStatWinParent);
		_lblStats[i][2]:SetPosition(_lblStats[i][1]:GetLeft()+_lblStats[i][1]:GetWidth()+20,curTop);
		_lblStats[i][2]:SetSize(170,18);
		_lblStats[i][2]:SetFont(Turbine.UI.Lotro.Font.Verdana14);
		_lblStats[i][2]:SetText("-");

		-- Increments
		curTop = curTop + 20;

	end

	-- Set the label headers
	for i=0, 2 do
		_lblStats[0][i]:SetFont(Turbine.UI.Lotro.Font.TrajanPro15);
		_lblStats[0][i]:SetForeColor(Turbine.UI.Color.Orange);
		_lblStats[0][i]:SetText(_LANG.STATHEADS[i][CLIENTLANG]);
	end

	-- Set the row labels
	for i=0, 9 do
		_lblStats[i+1][0]:SetText(_LANG.STATLBLS[i][CLIENTLANG]);
	end

	UpdateStats(ddListNames:GetText());


	-- Window events
	wStatWinParent.Activated = function()
		UpdateStats(ddListNames:GetText());
	end


	wStatWinParent.Closing = function()
		SETTINGS.STATWIN.VISIBLE = false;
	end

	wStatWinParent.PositionChanged = function()
		SETTINGS.STATWIN.X = wStatWinParent:GetLeft();
		SETTINGS.STATWIN.Y = wStatWinParent:GetTop();
	end

end


function UpdateStats(CHARACTER)

	--if wStatWinParent:IsVisible() == false then return end;

	for i=0, 9 do

		local CURSTAT = _LANG.STATLBLS[i].LINK;
		local CHARSTAT = 0;
		local ALLCHARSTAT = 0;

		if i==1 then ALLCHARSTAT = 3600 end;

		-- Stat for selected character
		if STATS[CHARACTER][CURSTAT] ~= nil then
			CHARSTAT = STATS[CHARACTER][CURSTAT];
		else
			CHARSTAT = 0;
			STATS[CHARACTER][CURSTAT] = 0;
		end

		-- stat for all characters
		for k,v in pairs (STATS) do
			if v[CURSTAT] ~= nil then
				if i==1 then
					-- Shortest Round
					if v[CURSTAT] < ALLCHARSTAT then ALLCHARSTAT = v[CURSTAT] end;
				elseif i==2 then
					-- Longest Round
					if v[CURSTAT] > ALLCHARSTAT then ALLCHARSTAT = v[CURSTAT] end;
				else
					ALLCHARSTAT = ALLCHARSTAT + v[CURSTAT];
				end
			else
				v[CURSTAT] = 0;
			end
		end

		local CHARPERCENT = 0;
		if ALLCHARSTAT ~= 0 then CHARPERCENT = math.floor((CHARSTAT/ALLCHARSTAT)*100) end;

		-- Adjust times from seconds to hours/minutes/seconds where relevant
		-- rows: 1, 2, 3,
		if i==1 or i==2 or i==3 then
			CHARSTAT = FormatTime(CHARSTAT);
			ALLCHARSTAT = FormatTime(ALLCHARSTAT);
		end

		_lblStats[i+1][1]:SetText(CHARSTAT .. "  <rgb=#" .. HexTBColor(Turbine.UI.Color.DarkGray) .. ">(" .. CHARPERCENT .. "%)</rgb>");	-- Selected Character
		_lblStats[i+1][2]:SetText(ALLCHARSTAT);	-- All Characters Total

	end

end


function RefreshStats()

	-- This function refreshes the stat labels when something has been looted
	-- But only if the selected character is the current character

	if ddListNames == nil then return end;

	if ddListNames:GetText() == MYNAME then
		UpdateStats(MYNAME);
	end

end

