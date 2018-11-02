-- init
local Frame = CreateFrame("Frame")
Frame:RegisterEvent("ADDON_LOADED")


function Frame:OnEvent(event, ...)

    if event == "ADDON_LOADED" then
        local addon = ...
    if addon == "hideBar" then
 
   
    -- Multibar
    MultiBarBottomRight:SetAlpha(0)
    MultiBarBottomLeft:SetAlpha(0)
    
    -- Hide frame and buttons
    MainMenuBarArtFrameBackground:Hide()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    StatusTrackingBarManager:Hide()
    MainMenuBarArtFrame.PageNumber:Hide()

   -- Hide Actionbuttons
    for i = 1,12 do 
        _G["ActionButton"..i]:SetAlpha(0)
    
    end
    
    
end
end
end


-- Run
Frame:SetScript("OnEvent", Frame.OnEvent)







