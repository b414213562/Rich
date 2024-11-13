
PreviousUpdate = 0;

function SetStartRound()
	SETTINGS.EVENTSTART = Turbine.Engine.GetLocalTime();
	ROUNDACTIVE = true;

    -- Restore any hidden or marked dig-sites.
    MapWinRoundReset();
end


function SetTimeQuestTH()
	QUESTTH = Turbine.Engine.GetLocalTime() + (15*60);
	STATS[MYNAME].QUESTTHEXP = QUESTTH;
	QUESTTHCOMPLETE = true;
end


function SetTimeQuestBerry()
	QUESTBER = Turbine.Engine.GetLocalTime() + (15*60);
	STATS[MYNAME].QUESTBEREXP = QUESTBER;
	QUESTBERCOMPLETE = true;
end


function SetEndRound()
	if ROUNDACTIVE == true then
		local ROUNDLEN = Turbine.Engine.GetLocalTime() - SETTINGS.EVENTSTART; -- length in seconds.
		STATS[MYNAME].TOTALTIME = STATS[MYNAME].TOTALTIME + ROUNDLEN;
		STATS[MYNAME].TOTALROUNDS = STATS[MYNAME].TOTALROUNDS + 1;

		if STATS[MYNAME].TOTALROUNDS == 1 then
			STATS[MYNAME].SHORTESTROUND = ROUNDLEN;
			STATS[MYNAME].LONGESTROUND = ROUNDLEN;
		else
			if ROUNDLEN < STATS[MYNAME].SHORTESTROUND then STATS[MYNAME].SHORTESTROUND = ROUNDLEN end;
			if ROUNDLEN > STATS[MYNAME].LONGESTROUND then STATS[MYNAME].LONGESTROUND = ROUNDLEN end;
		end

		RefreshStats();
	end

	ROUNDACTIVE = false;
end


function UpdateLabels()
	local CURTIME = Turbine.Engine.GetLocalTime();

    -- Only update if it's been at least a half-second since the last update:
    if (CURTIME < PreviousUpdate + 0.5) then return; end
    PreviousUpdate = CURTIME;

	if ROUNDACTIVE == true then
		lblRoundDuration:SetText(FormatTime(CURTIME-SETTINGS.EVENTSTART));
	else
		lblRoundDuration:SetText(_LANG.WAITINGROUND[CLIENTLANG]);
	end


	if QUESTTHCOMPLETE == true then
		local CURQUESTTIME = QUESTTH - CURTIME;
		if CURQUESTTIME > 0 then
			lblCDTH:SetText(FormatTime(CURQUESTTIME));
		else
			lblCDTH:SetText(_LANG.QUESTRESET[CLIENTLANG]);
		end
	end


	if QUESTBERCOMPLETE == true then
		local CURQUESTTIME = QUESTBER - CURTIME;
		if CURQUESTTIME > 0 then
			lblCDBERRY:SetText(FormatTime(CURQUESTTIME));
		else
			lblCDBERRY:SetText(_LANG.QUESTRESET[CLIENTLANG]);
		end
	end
end



function FormatTime(SECONDS)
	local tempHOUR = 0;
	local tempMIN = 0;
	local tempSEC = 0;

	local sOUTPUT = "";

	tempMIN = math.modf(SECONDS / 60);
	tempSEC = SECONDS - (tempMIN * 60);

	if tempMIN >= 60 then
		tempHOUR = math.modf(tempMIN / 60);
		tempMIN = tempMIN - (tempHOUR * 60);
	end

	if tempHOUR >= 1 then sOUTPUT = sOUTPUT .. tempHOUR .. "h " end;

	if tempMIN >= 1 then sOUTPUT = sOUTPUT .. tempMIN .. "m " end;

	sOUTPUT = sOUTPUT .. tempSEC .. "s";

	return sOUTPUT;
end
