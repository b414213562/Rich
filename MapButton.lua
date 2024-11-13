-- Inspired by MapButton.lua in RTPlugin

MapButton = class(Turbine.UI.Button)

function MapButton:Constructor(parent, values, coords)
    Turbine.UI.Button.Constructor(self);

    local x = values["x"];
    local y = values["y"];

    self.isHidden = false;

    self.eastWest = values["eastWest"];
    self.northSouth = values["northSouth"];

    self.coords = coords;

    self:SetParent(parent);
    self:SetBackground(_IMAGES["DIGSITE_WHITE"]);
    self:SetSize(16, 16);
    self:SetPosition(x - 8, y - 8);
    self:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);

    self.Click = function (sender, args)
        -- Turbine.Shell.WriteLine("Clicked " .. coords);
        if (self.isHidden) then
            self:Reactivate();
        else
            self:Deactivate();
        end
    end

end

function MapButton:Deactivate()
    self.isHidden = true;
    self:SetBackground(_IMAGES["DIGSITE_WHITE_OPAQUE_50"]);
end

function MapButton:Reactivate()
    self.isHidden = false;
    self:SetBackground(_IMAGES["DIGSITE_WHITE"]);
end

function MapButton:GetDistance(eastWest, northSouth)
    if (self.isHidden) then
        return math.huge;
    end

    local eastWestDistance = self.eastWest - eastWest;
    local northSouthDistance = self.northSouth - northSouth;

    local distance = math.sqrt((eastWestDistance * eastWestDistance) + (northSouthDistance * northSouthDistance));
    return distance;
end

function MapButton:SetInsidePreviewCircle()
    if (not self.isHidden) then
        self:SetBackground(_IMAGES["DIGSITE_YELLOW"]);
    end
end

function MapButton:SetOutsidePreviewCircle()
    if (not self.isHidden) then
        self:SetBackground(_IMAGES["DIGSITE_WHITE"]);
    end
end

function MapButton:Reset()
    self:SetBackground(_IMAGES["DIGSITE_WHITE"]);

    self.isHidden = false;
end
