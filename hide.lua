-- Author: Aron Strandberg
--init
local Hide = CreateFrame("Frame")
function Hide_Handler(self, event)
    Hide_ActionButton()
    if(event == "PLAYER_ENTERING_WORLD") then

        Hide_ActionButton()
        Hide_Bar()
        Hide_Bling()
    end
    -- Solved issue with showing abilities when moving abilities or hovering spell in spellbook
    if(event == "ACTIONBAR_HIDEGRID") then
        Hide_ActionButton()
    
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

-- Counter the MultiActionBar update function
hooksecurefunc("MultiActionBar_Update", Hide_Handler)

--run
Hide:SetScript("OnEvent", Hide_Handler)
Hide:RegisterEvent("PLAYER_ENTERING_WORLD")
Hide:RegisterEvent("ACTIONBAR_HIDEGRID")






