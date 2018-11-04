-- Author: Aron Strandberg
--init
local Hide = CreateFrame("Frame")
function Hide_EventHandler(self, event)
-- This solved issues with api calls if player not fully loaded
    if(event == "PLAYER_ENTERING_WORLD") then
        Hide_ActionButton()
        Hide_Bar()
        Hide_Bling()

    end
end

function Hide_Bar()
    MainMenuBarArtFrameBackground:Hide()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    StatusTrackingBarManager:Hide()
    MainMenuBarArtFrame.PageNumber:Hide()
end

function Hide_ActionButton()
-- Hide actionbuttons
    for i = 1,12 do 
        _G["ActionButton".. i]:Hide()

    end
end

function Hide_Bling()
-- Hide GCD Bling, thanks to https://wow.curseforge.com/projects/cooldownreadyflashdisabler
    for k,v in pairs(_G) do
        if type(v)=="table" and type(v.SetDrawBling)=="function" then
            v:SetDrawBling(false)

        end
    end
    hooksecurefunc(getmetatable(ActionButton1Cooldown).__index, 'SetCooldown', function(self)
    self:SetDrawBling(false)
    end)
end


--run
Hide:SetScript("OnEvent", Hide_EventHandler)
Hide:RegisterEvent("PLAYER_ENTERING_WORLD")






