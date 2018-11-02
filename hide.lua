-- init
local Frame = CreateFrame("Frame")
Frame:RegisterEvent("ADDON_LOADED")


function Frame:OnEvent(event, ...)

    if event == "ADDON_LOADED" then
        local addon = ...
    if addon == "hideBar" then
 
    -- Hide specific frames and buttons
    MainMenuBarArtFrameBackground:Hide()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    StatusTrackingBarManager:Hide()
    MainMenuBarArtFrame.PageNumber:Hide()

   -- Hide actionbuttons
    for i = 1,12 do 
        _G["ActionButton"..i]:SetAlpha(0)
    
    end

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
end
end


-- Run
Frame:SetScript("OnEvent", Frame.OnEvent)







