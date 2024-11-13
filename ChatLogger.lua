
-- Chat log filter.
-- Controls chat messages and actions the appropriate functions based on the message.

function InitiateChatLogger()

	CHATLOG = Turbine.Chat;
	CHATLOG.Received = function (sender, args)

		local tempMessage = tostring(args.Message);

		--Turbine.Shell.WriteLine(args.ChatType.." = "..args.Message);

		if args.ChatType == Turbine.ChatType.Standard then
			FilterStandard(tempMessage);
		end

		if args.ChatType == Turbine.ChatType.Quest then
			FilterQuest(tempMessage);
		end

		if args.ChatType == 36 then		-- Loot channel
			FilterLoot(tempMessage);
		end
	end
end


function FilterLoot(cMessage)
	if (string.find(cMessage, _LANG.SMALLCACHE[CLIENTLANG]) ~= nil) and (string.find(cMessage, _LANG.ACQUIRED[CLIENTLANG]) ~= nil) then
		STATS[MYNAME].TOTALSMALL = STATS[MYNAME].TOTALSMALL + 1;
		RefreshStats();
		return;
	end

	if (string.find(cMessage, _LANG.MEDCACHE[CLIENTLANG]) ~= nil) and (string.find(cMessage, _LANG.ACQUIRED[CLIENTLANG]) ~= nil) then
		STATS[MYNAME].TOTALMEDIUM = STATS[MYNAME].TOTALMEDIUM + 1;
		RefreshStats();
		return;
	end

	if (string.find(cMessage, _LANG.LARGECACHE[CLIENTLANG]) ~= nil) and (string.find(cMessage, _LANG.ACQUIRED[CLIENTLANG]) ~= nil) then
		STATS[MYNAME].TOTALLARGE = STATS[MYNAME].TOTALLARGE + 1;
		RefreshStats();
		return;
	end

	if (string.find(cMessage, _LANG.HUGECACHE[CLIENTLANG]) ~= nil) and (string.find(cMessage, _LANG.ACQUIRED[CLIENTLANG]) ~= nil) then
		STATS[MYNAME].TOTALHUGE = STATS[MYNAME].TOTALHUGE + 1;
		RefreshStats();
		return;
	end
end


function FilterStandard(cMessage)
-- Filters here for use with the Standard channel.
    MapHandleStandardChatMessage(cMessage);

	if string.find(cMessage,_LANG.NEWROUND[CLIENTLANG]) ~= nil then
		SetStartRound();
		return;
	end

	if string.find(cMessage,_LANG.ENDROUND[CLIENTLANG]) ~= nil then
		SetEndRound();
		return;
	end
end


function FilterQuest(cMessage)
-- Filters here for use with the Quest channel.
	if (string.find(cMessage,_LANG.COMPTREASUREHUNT[CLIENTLANG]) ~= nil) and (string.find(cMessage,_LANG.COMPLETED[CLIENTLANG]) ~= nil) then
		SetTimeQuestTH();
		return;
	end

	if (string.find(cMessage,_LANG.COMPBERRIES[CLIENTLANG]) ~= nil) and (string.find(cMessage,_LANG.COMPLETED[CLIENTLANG]) ~= nil) then
		SetTimeQuestBerry();
		return;
	end

	if string.find(cMessage,_LANG.NEWTREASUREHUNT[CLIENTLANG]) ~= nil then
		QUESTTHCOMPLETE = false;
		lblCDTH:SetText(_LANG.INPROGRESS[CLIENTLANG]);
		return;
	end

	if string.find(cMessage,_LANG.NEWBERRIES[CLIENTLANG]) ~= nil then
		QUESTBERCOMPLETE = false;
		lblCDBERRY:SetText(_LANG.INPROGRESS[CLIENTLANG]);
		return;
	end

	if string.find(cMessage,_LANG.BERRIES[CLIENTLANG]) ~= nil then

		return;
	end
end



