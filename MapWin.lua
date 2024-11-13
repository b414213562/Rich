
-- inspired by RTPlugin:
function GetConvertCoordsToXYFunction(cornerCoords)
    return function(eastWest, northSouth)
        local x = 505 * (eastWest - cornerCoords.west) / (cornerCoords.east - cornerCoords.west);
        local y = 663 * (northSouth - cornerCoords.north) / (cornerCoords.south - cornerCoords.north);
        return { x = x, y = y, eastWest = eastWest, northSouth = northSouth };
    end
end

LowLandsCornerCoordinates = {
    west = -99.3736,
    north = -17.2266,
    east = -98.3512,
    south = -18.5759
};
LowLandsCoords = GetConvertCoordsToXYFunction(LowLandsCornerCoordinates);
DigSites = {
    ["17.3014S 98.6527W"] = LowLandsCoords(-98.6527, -17.3014);
    ["17.3122S 98.5723W"] = LowLandsCoords(-98.5723, -17.3122);
    ["17.3583S 98.8351W"] = LowLandsCoords(-98.8351, -17.3583);
    ["17.3598S 98.7340W"] = LowLandsCoords(-98.7340, -17.3598);
    ["17.4239S 98.6344W"] = LowLandsCoords(-98.6344, -17.4239);
    ["17.4289S 98.7535W"] = LowLandsCoords(-98.7535, -17.4289);
    ["17.4332S 98.9096W"] = LowLandsCoords(-98.9096, -17.4332);
    ["17.4533S 98.4891W"] = LowLandsCoords(-98.4891, -17.4533);
    ["17.4669S 98.8331W"] = LowLandsCoords(-98.8331, -17.4669);
    ["17.4876S 98.6488W"] = LowLandsCoords(-98.6488, -17.4876);
    ["17.5148S 98.7494W"] = LowLandsCoords(-98.7494, -17.5148);
    ["17.5186S 99.0124W"] = LowLandsCoords(-99.0124, -17.5186);
    ["17.5274S 99.1420W"] = LowLandsCoords(-99.1420, -17.5274);
    ["17.5369S 98.5099W"] = LowLandsCoords(-98.5099, -17.5369);
    ["17.5437S 98.5646W"] = LowLandsCoords(-98.5646, -17.5437);
    ["17.5582S 99.2978W"] = LowLandsCoords(-99.2978, -17.5582);
    ["17.5911S 99.0494W"] = LowLandsCoords(-99.0494, -17.5911);
    ["17.6088S 98.6894W"] = LowLandsCoords(-98.6894, -17.6088);
    ["17.6153S 98.5883W"] = LowLandsCoords(-98.5883, -17.6153);
    ["17.6608S 98.8986W"] = LowLandsCoords(-98.8986, -17.6608);
    ["17.6823S 99.1876W"] = LowLandsCoords(-99.1876, -17.6823);
    ["17.6876S 99.3435W"] = LowLandsCoords(-99.3435, -17.6876);
    ["17.6973S 99.0035W"] = LowLandsCoords(-99.0035, -17.6973);
    ["17.7069S 98.6628W"] = LowLandsCoords(-98.6628, -17.7069);
    ["17.7257S 98.9381W"] = LowLandsCoords(-98.9381, -17.7257);
    ["17.7562S 98.4876W"] = LowLandsCoords(-98.4876, -17.7562);
    ["17.7566S 99.2521W"] = LowLandsCoords(-99.2521, -17.7566);
    ["17.7670S 98.8595W"] = LowLandsCoords(-98.8595, -17.7670);
    ["17.7795S 99.0329W"] = LowLandsCoords(-99.0329, -17.7795);
    ["17.7942S 98.6765W"] = LowLandsCoords(-98.6765, -17.7942);
    ["17.8044S 98.6051W"] = LowLandsCoords(-98.6051, -17.8044);
    ["17.8100S 98.4936W"] = LowLandsCoords(-98.4936, -17.8100);
    ["17.8212S 99.1133W"] = LowLandsCoords(-99.1133, -17.8212);
    ["17.8376S 99.0034W"] = LowLandsCoords(-99.0034, -17.8376);
    ["17.8484S 98.6519W"] = LowLandsCoords(-98.6519, -17.8484);
    ["17.8534S 98.9516W"] = LowLandsCoords(-98.9516, -17.8534);
    ["17.8776S 99.2519W"] = LowLandsCoords(-99.2519, -17.8776);
    ["17.8885S 98.5977W"] = LowLandsCoords(-98.5977, -17.8885);
    ["17.9030S 98.9727W"] = LowLandsCoords(-98.9727, -17.9030);
    ["17.9086S 98.8318W"] = LowLandsCoords(-98.8318, -17.9086);
    ["17.9129S 98.9021W"] = LowLandsCoords(-98.9021, -17.9129);
    ["17.9141S 98.5422W"] = LowLandsCoords(-98.5422, -17.9141);
    ["17.9348S 99.1892W"] = LowLandsCoords(-99.1892, -17.9348);
    ["17.9544S 98.6674W"] = LowLandsCoords(-98.6674, -17.9544);
    ["17.9607S 98.8818W"] = LowLandsCoords(-98.8818, -17.9607);
    ["17.9631S 98.5965W"] = LowLandsCoords(-98.5965, -17.9631);
    ["17.9658S 98.9554W"] = LowLandsCoords(-98.9554, -17.9658);
    ["17.9681S 98.7748W"] = LowLandsCoords(-98.7748, -17.9681);
    ["17.9693S 99.0680W"] = LowLandsCoords(-99.0680, -17.9693);
    ["17.9694S 98.8255W"] = LowLandsCoords(-98.8255, -17.9694);
    ["17.9759S 98.5208W"] = LowLandsCoords(-98.5208, -17.9759);
    ["17.9825S 98.4430W"] = LowLandsCoords(-98.4430, -17.9825);
    ["17.9852S 98.7217W"] = LowLandsCoords(-98.7217, -17.9852);
    ["18.0208S 99.3032W"] = LowLandsCoords(-99.3032, -18.0208);
    ["18.0211S 99.0144W"] = LowLandsCoords(-99.0144, -18.0211);
    ["18.0278S 99.1431W"] = LowLandsCoords(-99.1431, -18.0278);
    ["18.0451S 98.8239W"] = LowLandsCoords(-98.8239, -18.0451);
    ["18.0558S 98.9248W"] = LowLandsCoords(-98.9248, -18.0558);
    ["18.0747S 99.2249W"] = LowLandsCoords(-99.2249, -18.0747);
    ["18.0848S 99.1431W"] = LowLandsCoords(-99.1431, -18.0848);
    ["18.0987S 99.2995W"] = LowLandsCoords(-99.2995, -18.0987);
    ["18.1339S 98.8299W"] = LowLandsCoords(-98.8299, -18.1339);
    ["18.1348S 99.1024W"] = LowLandsCoords(-99.1024, -18.1348);
    ["18.1398S 98.9260W"] = LowLandsCoords(-98.9260, -18.1398);
    ["18.1970S 99.0703W"] = LowLandsCoords(-99.0703, -18.1970);
    ["18.2249S 98.8986W"] = LowLandsCoords(-98.8986, -18.2249);
    ["18.2358S 99.1312W"] = LowLandsCoords(-99.1312, -18.2358);
    ["18.2362S 98.8349W"] = LowLandsCoords(-98.8349, -18.2362);
    ["18.2549S 99.0485W"] = LowLandsCoords(-99.0485, -18.2549);
    ["18.2805S 98.9549W"] = LowLandsCoords(-98.9549, -18.2805);
    ["18.3087S 99.0415W"] = LowLandsCoords(-99.0415, -18.3087);
    ["18.3339S 98.8342W"] = LowLandsCoords(-98.8342, -18.3339);
    ["18.3406S 99.1199W"] = LowLandsCoords(-99.1199, -18.3406);
    ["18.4639S 98.8353W"] = LowLandsCoords(-98.8353, -18.4639);
    ["18.4815S 98.9350W"] = LowLandsCoords(-98.9350, -18.4815);

    ["18.3501S 98.9199W"] = LowLandsCoords(-98.9199, -18.3501);
    ["18.4192S 99.0001W"] = LowLandsCoords(-99.0001, -18.4192);
    ["18.4284S 99.0557W"] = LowLandsCoords(-99.0557, -18.4284);
    ["18.3467S 99.0070W"] = LowLandsCoords(-99.0070, -18.3467);
    ["18.2804S 99.2077W"] = LowLandsCoords(-99.2077, -18.2804);
    ["17.4617S 98.5776W"] = LowLandsCoords(-98.5776, -17.4617);
}

function DrawMapWin()
    wMapWinParent = Turbine.UI.Lotro.Window();

    wMapWinParent.mapWidth = 505;
    wMapWinParent.mapHeight = 663;

    wMapWinParent.circleRadius = 103 / 2; -- Observed: 119/2 in place of 99/2
    wMapWinParent.caveClawDistance = 0.105; -- seems correct based on testing against a huge deposit

    local windowLeftBorder = 20;
    local windowRightBorder = 20;
    local windowTopBorder = 40;
    local windowBottomBorder = 20;

    local caveClawControlsHeight = 50;

    wMapWinParent.cornerCoordinates = LowLandsCornerCoordinates;

    wMapWinParent:SetSize(
        wMapWinParent.mapWidth + windowLeftBorder + windowRightBorder,
        wMapWinParent.mapHeight + windowTopBorder + windowBottomBorder + caveClawControlsHeight);
    wMapWinParent:SetPosition(SETTINGS.MAPWIN.X, SETTINGS.MAPWIN.Y);
    wMapWinParent:SetText(_LANG.MAP[CLIENTLANG]);
    wMapWinParent:SetVisible(SETTINGS.MAPWIN.VISIBLE);

    -- A control to hold the map:
    local map = Turbine.UI.Window();
    wMapWinParent.map = map;
    map:SetParent(wMapWinParent);
    map:SetPosition(windowLeftBorder, windowTopBorder);
    map:SetSize(wMapWinParent.mapWidth, wMapWinParent.mapHeight);
    map:SetBackground(_IMAGES.LOW_LANDS_RADAR);
    map:SetMouseVisible(false);
    map:SetVisible(true);

    -- A control to hold the /loc arrow:
    local testControl = Turbine.UI.Control();
    testControl:SetBackground(_IMAGES["MAPPOINT"]);
    testControl:SetStretchMode(2);
    local imageWidth = testControl:GetWidth();
    local imageHeight = testControl:GetHeight();

    local finalImageWidth = 28;
    local finalImageHeight = 28;

    local mapPoint = Turbine.UI.Window();
    wMapWinParent.mapPoint = mapPoint;
    mapPoint:SetParent(map);
    mapPoint:SetSize(imageWidth, imageHeight);
    mapPoint:SetBackground(_IMAGES["MAPPOINT"]);

    mapPoint:SetStretchMode(1);
    mapPoint:SetSize(finalImageWidth, finalImageHeight);

    mapPoint.width = finalImageWidth;
    mapPoint.height = finalImageHeight;
    mapPoint.radius = mapPoint.width / 2;

    mapPoint:SetVisible(false);
    mapPoint:SetMouseVisible(false);
    mapPoint:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
    mapPoint.refreshTime = 0;

    local decayTime = 5;
    local decayDelayTime = 3;

    mapPoint.Update = function(sender, args)
        local delta = Turbine.Engine.GetGameTime() - mapPoint.refreshTime;
        -- gradually fade us out:
        -- Ignore the first decayDelayTime seconds, then fade out evenly across the rest.
        -- e.g.: after 1 second seconds: (5 - 1) / (5 - 3) = 4 / 2, = 100% opacity
        --       after 2 second seconds: (5 - 2) / (5 - 3) = 3 / 2, = 100% opacity
        --       after 4 second seconds: (5 - 4) / (5 - 3) = 1 / 2, = 50% opacity

        local opacity = (decayTime - delta)/(decayTime - decayDelayTime);
        mapPoint:SetOpacity(opacity);
        wMapWinParent.previewCircle:SetOpacity(opacity);
        if (delta > 5) then
            mapPoint:SetWantsUpdates(false);
            mapPoint:SetVisible(false);
            wMapWinParent.previewCircle:SetVisible(false);

            for i, value in ipairs(wMapWinParent.map.DigSites) do
                value:SetOutsidePreviewCircle("white");
            end
        end
    end

    -- the preview circle:
    local previewCircle = Turbine.UI.Window();
    wMapWinParent.previewCircle = previewCircle;
    previewCircle:SetParent(map);
    previewCircle:SetSize(wMapWinParent.circleRadius * 2, wMapWinParent.circleRadius * 2);
    previewCircle:SetBackground(_IMAGES["PREVIEW_CIRCLE"]);
    previewCircle:SetVisible(false);
    previewCircle:SetMouseVisible(false);
    previewCircle:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);

    -- Label for the coords of the cursor:
    -- local coordLabel = Turbine.UI.Label();

    -- Storage for cave-claw circles:
    map.CaveClaws = {};

    -- Icons for each Dig-site. (See RTPlugin for ideas here.)
    map.DigSites = {};
    local i = 0;
    for key, value in pairs(DigSites) do
        i = i + 1;
        map.DigSites[i] = MapButton(map, value, key);

    end

    local caveClawControls = Turbine.UI.Control();
    caveClawControls:SetParent(wMapWinParent);
    caveClawControls:SetSize(wMapWinParent.mapWidth, caveClawControlsHeight);
    caveClawControls:SetPosition(windowLeftBorder, windowTopBorder + wMapWinParent.mapHeight);
    --caveClawControls:SetBackColor(Turbine.UI.Color.DarkBlue);

    local locWidth = 100;
    local locQuickslot = Turbine.UI.Lotro.Quickslot();
    locQuickslot:SetParent(caveClawControls);
    locQuickslot:SetSize(locWidth, 25);
    locQuickslot:SetPosition(5, 3)
    locQuickslot:SetAllowDrop(false);
    locQuickslot:SetVisible(true);

    local locLabel = Turbine.UI.Label();
    locLabel:SetParent(caveClawControls);
    locLabel:SetSize(locWidth, 25);
    locLabel:SetPosition(5, 3);
    locLabel:SetMouseVisible(false);
    locLabel:SetBackColor(Turbine.UI.Color(0.1,0.15,0.3));
    locLabel:SetFont(Turbine.UI.Lotro.Font.Verdana12);
    locLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
    locLabel:SetText(GetString(_LANG.DETECT_OFFSET));

    locQuickslot.MouseEnter = function(sender, args)
        locLabel:SetBackColor(Turbine.UI.Color(0.2,0.25,0.4));
        locLabel:SetForeColor(YELLOW);
    end

    locQuickslot.MouseLeave = function(sender, args)
        locLabel:SetBackColor(Turbine.UI.Color(0.1,0.15,0.3));
        locLabel:SetForeColor(WHITE);
    end

    local servertimeShortcut = Turbine.UI.Lotro.Shortcut();
    servertimeShortcut:SetType(Turbine.UI.Lotro.ShortcutType.Alias);
    servertimeShortcut:SetData(GetString(_LANG.LOC_COMMAND))
    locQuickslot:SetShortcut(servertimeShortcut);

    local caveClawActivatedButton = Turbine.UI.Lotro.Button();
    caveClawActivatedButton:SetParent(caveClawControls);
    caveClawActivatedButton:SetWidth(GetString(_LANG.DEPLOY_CAVE_CLAW_WIDTH));
    caveClawActivatedButton:SetPosition(locWidth + 10, 5);
    caveClawActivatedButton:SetText(GetString(_LANG.DEPLOY_CAVE_CLAW));
    caveClawActivatedButton.Click = function(sender, args)
        if (not wMapWinParent.lastKnownPosition) then return; end

        local caveClawCircle = Turbine.UI.Window();
        table.insert(map.CaveClaws, caveClawCircle);
        caveClawCircle:SetParent(map);
        caveClawCircle:SetSize(wMapWinParent.circleRadius * 2, wMapWinParent.circleRadius * 2);
        caveClawCircle:SetBackground(_IMAGES["CAVE_CLAW_CIRCLE"]);
        caveClawCircle:SetVisible(true);
        caveClawCircle:SetMouseVisible(false);
        caveClawCircle:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);

        local pixels = PixelsFromCoords(wMapWinParent.lastKnownPosition);
        caveClawCircle:SetPosition(pixels.x - wMapWinParent.circleRadius, pixels.y - wMapWinParent.circleRadius);

        previewCircle:SetVisible(false);
    end

    local resetWidth = GetString(_LANG.RESET_MAP_WIDTH);
    local btnReset = Turbine.UI.Lotro.Button();
    btnReset:SetParent(caveClawControls);
    btnReset:SetWidth(resetWidth);
    btnReset:SetPosition(wMapWinParent.mapWidth - resetWidth - 5, 5);
    btnReset:SetText(GetString(_LANG.RESET_MAP));
    btnReset.Click = function (sender, args)
        MapWinRoundReset();
    end

    -- second row:
    local resultLabel = Turbine.UI.Label();
    resultLabel:SetParent(caveClawControls);
    resultLabel:SetSize(125, 20);
    resultLabel:SetPosition(20, 30);
    resultLabel:SetMouseVisible(false);
    resultLabel:SetFont(Turbine.UI.Lotro.Font.Verdana12);
    resultLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
    resultLabel:SetText(GetString(_LANG.CAVE_CLAW_RESULT));

    local values = {
        [1] = "UNCOMMON";
        [2] = "RARE";
        [3] = "INCOMPARABLE";
        -- [4] = "LEGENDARY"; -- You only get this if you found the huge treasure chest. 
        -- Pick it up!
    }

    for key, value in pairs(values) do
        local caveClawValueButton = Turbine.UI.Lotro.Button();
        caveClawValueButton:SetParent(caveClawControls);
        caveClawValueButton:SetText(GetString(_LANG[value]));
        caveClawValueButton:SetWidth(100);
        caveClawValueButton:SetPosition(caveClawActivatedButton:GetWidth() + 10 + 105 * (key - 1), 30);
        caveClawValueButton.Click = function(sender, args)
            local caveClawCircle = map.CaveClaws[#map.CaveClaws];
            caveClawCircle:SetBackground(_IMAGES["CAVE_CLAW_CIRCLE_" .. value]);

            if (value == "UNCOMMON") then
                -- hide any dig-sites in range of this circle
                for mapButtonIndex, mapButton in ipairs(wMapWinParent.map.DigSites) do
                    local distance = mapButton:GetDistance(
                        wMapWinParent.lastKnownPosition.longitude,
                        wMapWinParent.lastKnownPosition.latitude);
                    if (distance <= wMapWinParent.caveClawDistance) then
                        mapButton:Deactivate();
                    end
                end
            end
        end
    end

    AddCallback(wMapWinParent, "PositionChanged", function(sender, args)
        SETTINGS.MAPWIN.X = wMapWinParent:GetLeft();
        SETTINGS.MAPWIN.Y = wMapWinParent:GetTop();
    end);

    AddCallback(wMapWinParent, "Closing", function(sender, args)
        MapSetVisible(false);
    end);


end

function MapWinRoundReset()
    for i, value in ipairs(wMapWinParent.map.DigSites) do
        value:Reset();
    end
    for i, value in ipairs(wMapWinParent.map.CaveClaws) do
        value:SetParent(nil);
        value:SetVisible(false);
    end
    wMapWinParent.map.CaveClaws = {};
end

---Sets the corner coordinates used in calculating image position from /loc text.
---@param cornerCoords table A table with west, north, east, and south entries.
function MapSetCornerCoordinates(cornerCoords)
    wMapWinParent.cornerCoordinates = cornerCoords;
end


function MapSetVisible(newVisibility)
    if (wMapWinParent == nil) then return; end
    SETTINGS.MAPWIN.VISIBLE = newVisibility;
    wMapWinParent:SetVisible(SETTINGS.MAPWIN.VISIBLE);
    if (newVisibility) then
        wMapWinParent:Activate();
    end
end

function MapSetMapPointRotation(newRotation)
    -- rotating only works correctly if the element is visible:
    if (not wMapWinParent.mapPoint:IsVisible()) then return; end

    wMapWinParent.mapPoint.rotation = newRotation;
    local baseRotation = 90; -- Red arrow points right by default
    local compositeRotation = baseRotation - newRotation;

    -- rotating only works correctly if the element is visible:
    wMapWinParent.mapPoint:SetRotation({ x = 0, y = 0, z = compositeRotation } );
end

function MapMoveMapPoint(x, y, heading)
    local pointRadius = wMapWinParent.mapPoint.radius;

    -- If the arrow would be off screen, don't let it leave:
    local offMap = false;
    if (x < 0) then x = 0; offMap = true; end
    if (y < 0) then y = 0; offMap = true; end
    if (x > wMapWinParent.mapWidth) then x = wMapWinParent.mapWidth; offMap = true; end
    if (y > wMapWinParent.mapHeight) then y = wMapWinParent.mapHeight; offMap = true; end

    wMapWinParent.mapPoint:SetVisible(not offMap);
    -- Adjust the rotation if the arrow is visible:
    if (wMapWinParent.mapPoint:IsVisible()) then
        MapSetMapPointRotation(heading);
    end

    -- Adjust the final point to account for the size of the map point:
    wMapWinParent.mapPoint:SetPosition(x - pointRadius, y - pointRadius);

    -- Let it phase out:
    wMapWinParent.mapPoint.refreshTime = Turbine.Engine.GetGameTime();
    wMapWinParent.mapPoint:SetWantsUpdates(true);

    -- overlay the previewCircle:
    wMapWinParent.previewCircle:SetVisible(not offMap);
    wMapWinParent.previewCircle:SetPosition(x - wMapWinParent.circleRadius, y - wMapWinParent.circleRadius);

    -- Update color of dig sites:
    for i, value in ipairs(wMapWinParent.map.DigSites) do
        local distance = value:GetDistance(
            wMapWinParent.lastKnownPosition.longitude,
            wMapWinParent.lastKnownPosition.latitude);
        if (distance <= wMapWinParent.caveClawDistance) then
            value:SetInsidePreviewCircle("yellow");
        else
            value:SetOutsidePreviewCircle("white");
        end
    end

end

function MapHandleStandardChatMessage(message)
    if (not wMapWinParent:IsVisible()) then return; end

    local coordinates = MapParseChatLocation(message);
    if (coordinates) then
        wMapWinParent.lastKnownPosition = coordinates;
        local pixels = PixelsFromCoords(coordinates);

        MapMoveMapPoint(pixels.x, pixels.y, coordinates.heading)
    end
end

-- Todo: the bounding coordinates and map pixel count should be parameterized.
function PixelsFromCoords(coords)

    local west = wMapWinParent.cornerCoordinates.west;
    local north = wMapWinParent.cornerCoordinates.north;
    local east = wMapWinParent.cornerCoordinates.east;
    local south = wMapWinParent.cornerCoordinates.south;

    local x = wMapWinParent.mapWidth * (coords.longitude - west) / (east - west);
    local y = wMapWinParent.mapHeight * (coords.latitude - north) / (south - north);
    return { x = x, y = y };
end

-- Buried Treasure (Low Lands) examples:
-- You are on Treebeard server 15 at r1 lx486 ly1058 ox134.57 oy42.20 oz566.89 h271.4. Game timestamp 105781816.258.
-- You are on Treebeard server 15 at r1 lx479 ly1069 ox146.70 oy108.47 oz596.31 h313.6. Game timestamp 105782758.738.
local LOC_MESSAGES = {
    -- Needed for Buried Treasure:
    'r(%d+) lx(%d+%.?%d*) ly(%d+%.?%d*) ox(%d+%.?%d*) oy(%d+%.?%d*) oz(%d+%.?%d*) h(%d+%.?%d*)',
    'r(%d+) lx(%d+%.?%d*) ly(%d+%.?%d*) ox(%d+%.?%d*) oy(%d+%.?%d*) oz(%d+%.?%d*)',

    -- Other locations from Wapyoint, not likely to match:
    -- 'r(%d+) lx(%d+%.?%d*) ly(%d+%.?%d*) i%d+ ox(%d+%.?%d*) oy(%d+%.?%d*) oz(%d+%.?%d*) h(%d+%.?%d*)',
    -- 'r(%d+) lx(%d+%.?%d*) ly(%d+%.?%d*) i%d+ ox(%d+%.?%d*) oy(%d+%.?%d*) oz(%d+%.?%d*)',
	-- 'r(%d+) lx(%d+%.?%d*) ly(%d+%.?%d*) i%d+ cInside ox(%d+%.?%d*) oy(%d+%.?%d*) oz(%d+%.?%d*) h(%d+%.?%d*)',
	-- 'r(%d+) lx(%d+%.?%d*) ly(%d+%.?%d*) i%d+ cInside ox(%d+%.?%d*) oy(%d+%.?%d*) oz(%d+%.?%d*)',
	-- 'r(%d+) lx(%d+%.?%d*) ly(%d+%.?%d*) cInside ox(%d+%.?%d*) oy(%d+%.?%d*) oz(%d+%.?%d*) h(%d+%.?%d*)',
	-- 'r(%d+) lx(%d+%.?%d*) ly(%d+%.?%d*) cInside ox(%d+%.?%d*) oy(%d+%.?%d*) oz(%d+%.?%d*)'
};

function MapParseChatLocation(message)
    for i, suffix in ipairs(LOC_MESSAGES) do
        local r, lx, ly, ox, oy, oz, h = message:match(suffix);
        if r ~= nil then

            h = h or 0; -- heading is not always included. Fill it in if missing.
            local x = (( math.floor( EuroNormalize(lx) / 8 ) * 160 + EuroNormalize(ox) ) - 29360) / 200;
            local y = (( math.floor( EuroNormalize(ly) / 8 ) * 160 + EuroNormalize(oy) ) - 24880) / 200;
            return { longitude = x, latitude = y, heading = h };
        end
    end
end

-- End of "Where am I" code
