
SETTINGS = {}; -- Table used when loading settings.
TEMP_SETTINGS = {};

MYCHAR = Turbine.Gameplay.LocalPlayer.GetInstance();
MYNAME = MYCHAR:GetName();
MYBAGS = MYCHAR:GetBackpack();
MYWALLET = MYCHAR:GetWallet();

MYWALLET.ItemAdded = function (sender,args)
	GetTokenIndex();
end

MYWALLET.ItemRemoved = function (sender,args)
	tokens_underlay:SetWantsUpdates(true);
	tokens_underlay.Update = function(sender, args)
		GetTokenIndex();
        tokens_underlay:SetWantsUpdates(false);
	end
	GetTokenIndex();
end


TOKENCOUNT = 0;
TOKENINDEX = 0;
TOKENOLDCOUNT = 0;


-- This function takes a turbine color and returns the appropriate hex value for that color to be used in RGB tags
function HexTBColor(TURBINECOLOR)

	local function HEXRGB(IN)
	local B,K,OUT,I,D=16,"0123456789ABCDEF","",0
		if IN == 0 then return "00" end;
		while IN>0 do
		I=I+1
		IN,D=math.floor(IN/B),math.mod(IN,B)+1
		OUT=string.sub(K,D,D)..OUT
	end
	if string.len(OUT) == 1 then OUT = "0" .. OUT end;
		return OUT
	end


	return HEXRGB(math.ceil(TURBINECOLOR.R*255)) .. HEXRGB(math.ceil(TURBINECOLOR.G*255)) .. HEXRGB(math.ceil(TURBINECOLOR.B*255));

end


STATS = {};

_STATS = {
	[MYNAME] = {
		["TOTALROUNDS"] = 0;		-- Number of rounds
		["SHORTESTROUND"] = 0;		-- Length of shortest round, in seconds
		["LONGESTROUND"] = 0;		-- Length of longest round, in seconds
		["TOTALTIME"] = 0;			-- Total length of all rounds, in seconds
		["TOTALTOKENS"] = 0;		-- Total number of tokens looted
		["TOTALSPENT"] = 0;			-- Total number of tokens spent
		["TOTALSMALL"] = 0;			-- Total number of small caches looted
		["TOTALMEDIUM"] = 0;		-- Total number of medium caches looted
		["TOTALLARGE"] = 0;			-- Total number of large caches looted
		["TOTALHUGE"] = 0;			-- Total number of huge caches looted
		["QUESTTHEXP"] = 0;			-- Quest 'Treasure Hunt' expiration/reset time
		["QUESTBEREXP"] = 0;		-- Quest 'Berries' expiration/reset time
	};
};


RESOURCEDIR = "GaluhadPlugins/Rich/Resources/";
_IMAGES = {

	["GREY_CAVECLAW"] = RESOURCEDIR .. "CaveClaw.tga";
	["GREY_DOWSING"] = RESOURCEDIR .. "DowsingGem.tga";
	["GREY_TOKENS"] = RESOURCEDIR .. "Tokens.tga";
	["GREY_TREASUREHUGE"] = RESOURCEDIR .. "Treasure_Huge.tga";
	["GREY_TREASURELARGE"] = RESOURCEDIR .. "Treasure_Large.tga";
	["GREY_TREASUREMED"] = RESOURCEDIR .. "Treasure_Medium.tga";
	["GREY_TREASURESMALL"] = RESOURCEDIR .. "Treasure_Small.tga";
	["GREY_PICK"] = RESOURCEDIR .. "TreasurePick.tga";
	["MAINBACK"] = RESOURCEDIR .. "Main_Back.tga";
	["BARTERBACK"] = RESOURCEDIR .. "BarterBack.tga";

};


_QUALITYCOLORS =
{
	[0] = Turbine.UI.Color.White;			-- Undefined
	[5] = Turbine.UI.Color.White;			-- Common
	[4] = Turbine.UI.Color.Yellow;			-- Uncommon
	[2] = Turbine.UI.Color.Magenta;			-- Rare
	[3] = Turbine.UI.Color.Aqua;			-- Incomparable
	[1] = Turbine.UI.Color.Orange;			-- Legendary
};


QUESTTH = 0;
QUESTBER = 0;
ROUNDACTIVE = false;
QUESTTHCOMPLETE = false;
QUESTBERCOMPLETE = false;

PLUGINNAME = "Rich!";

SCREENWIDTH = Turbine.UI.Display.GetWidth();
SCREENHEIGHT = Turbine.UI.Display.GetHeight();
TRANSPARENT = Turbine.UI.Color(0,0,0,0); -- ARGB
WHITE = Turbine.UI.Color(1,1,1);
BLACK = Turbine.UI.Color(0,0,0);
GREEN = Turbine.UI.Color(0,1,0);
YELLOW = Turbine.UI.Color(1,1,0);
ORANGE = Turbine.UI.Color(247/255,148/255,29/255);

HFONT = Turbine.UI.Lotro.Font.TrajanPro16;
BFONT = Turbine.UI.Lotro.Font.TrajanPro14;
HFONTCOLOR = Turbine.UI.Color((201/255),(195/255),(98/255));

LISTFONT = Turbine.UI.Lotro.Font.Verdana12;
TIMEFONT = Turbine.UI.Lotro.Font.Verdana14;


-- Random Variables
blDRAGGING = false;
relX = 0;
relY = 0;

-- Detect client lang.
CLIENTLANG = "ENGLISH";
if Turbine.Shell.IsCommand("hilfe") then
	CLIENTLANG = "GERMAN";
elseif Turbine.Shell.IsCommand("aide") then
	CLIENTLANG = "FRENCH";
elseif Turbine.Shell.IsCommand("плагины") then
	CLIENTLANG = "RUSSIAN";
end

-- Default Settings
DEFAULT_SETTINGS =
	{
	["LANGUAGE"] = CLIENTLANG;
	["MSGCOLOR"] = "FFFFFF";
    ["EVENTSTART"] = 0;

	["MAINWIN"] =
		{
		["VISIBLE"] = true;
		["X"] = (SCREENWIDTH/2)-225;
		["Y"] = SCREENHEIGHT/3;
		};

	["STATWIN"] =
		{
		["VISIBLE"] = true;
		["X"] = (SCREENWIDTH/2)-200;
		["Y"] = SCREENHEIGHT/3;
		};

	["BARTERWIN"] =
		{
		["X"] = (SCREENWIDTH/2)-200;
		["Y"] = SCREENHEIGHT/3;
		};

	};

