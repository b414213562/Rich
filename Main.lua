-- Turbine Imports..
import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";

-- Libraries..
import "GaluhadPlugins.Rich.TurbineFiles.CallBack";
import "GaluhadPlugins.Rich.TurbineFiles.Class";

-- Plugin Imports..
import "GaluhadPlugins.Rich.Globals";
import "GaluhadPlugins.Rich.DropDown";
import "GaluhadPlugins.Rich.UTF";
import "GaluhadPlugins.Rich.Strings";
import "GaluhadPlugins.Rich.Tables";
import "GaluhadPlugins.Rich.OnScreen";
import "GaluhadPlugins.Rich.Timer";
import "GaluhadPlugins.Rich.ChatLogger";
import "GaluhadPlugins.Rich.MainWin";
import "GaluhadPlugins.Rich.Stats";
import "GaluhadPlugins.Rich.Commands";
import "GaluhadPlugins.Rich.Barter";
import "GaluhadPlugins.Rich.BarterWin";
import "GaluhadPlugins.Rich.GeneralFunctions";


function saveData()

	-- Store the settings table.
	Turbine.PluginData.Save(Turbine.DataScope.Character, "Rich_Settings", SETTINGS);
	Turbine.PluginData.Save(Turbine.DataScope.Server, "Rich_Stats", STATS);

end


function loadData()

	-- SETTINGS ----------------------------------------------------------------------------------
	local SavedSettings = {};

	-- Load the settings
	function GetSavedSettings()
		SavedSettings = Turbine.PluginData.Load(Turbine.DataScope.Character, "Rich_Settings");
	end

	if pcall(GetSavedSettings) then
		-- Loaded without error
		SavedSettings = Turbine.PluginData.Load(Turbine.DataScope.Character, "Rich_Settings");
	else
		-- Loaded with errors
		SavedSettings = nil;
		Turbine.Shell.WriteLine("Error loading saved settings");
	end


		-- Check the saved settings to make sure it is still compatible with newer updates, add in any missing default settings
	if type(SavedSettings) == 'table' then

		local tempSETTINGS = {};
		tempSETTINGS = deepcopy(DEFAULT_SETTINGS);

		SETTINGS = mergeTables(tempSETTINGS,SavedSettings);

	else

		SETTINGS = deepcopy(DEFAULT_SETTINGS);

	end

    -- only keep the event start time if it was less than 2 minutes ago:
    if ((Turbine.Engine.GetLocalTime() - SETTINGS.EVENTSTART) > (60 * 2)) then
        SETTINGS.EVENTSTART = 0;
    end
    if SETTINGS.EVENTSTART > 0 then ROUNDACTIVE = true; end


	-- STATS ---------------------------------------------------------------------------------------
	local SavedStats = {};

	-- Load the settings
	function GetSavedStats()
		SavedStats = Turbine.PluginData.Load(Turbine.DataScope.Server, "Rich_Stats");
	end

	if pcall(GetSavedStats) then
		-- Loaded without error
		SavedStats = Turbine.PluginData.Load(Turbine.DataScope.Server, "Rich_Stats");
	else
		-- Loaded with errors
		SavedStats = nil;
		Turbine.Shell.WriteLine("Error loading saved stats");
	end


		-- Check the saved settings to make sure it is still compatible with newer updates, add in any missing default settings
	if type(SavedStats) == 'table' then

		local tempSTATS = {};
		tempSTATS = deepcopy(_STATS);

		STATS = mergeTables(tempSTATS,SavedStats);

	else

		STATS = deepcopy(_STATS);

	end

end


function DrawWindows()
	DrawMainWindow();
	DrawStatWindow();
end


Turbine.Plugin.Unload = function (sender, args)

	-- Save the data when the plugin unloads.
	saveData();

end


function PluginMessage(Message)

	Turbine.Shell.WriteLine("<rgb=#" .. SETTINGS.MSGCOLOR .. ">" .. PLUGINNAME .. ": " .. Message .. ".</rgb>");

end


-- Initiate load sequence
loadData();
DrawWindows();
InitiateChatLogger();
RegisterCommands();

