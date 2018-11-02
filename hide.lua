-- init
local Frame = CreateFrame("Frame")
Frame:RegisterEvent("ADDON_LOADED")


function Frame:OnEvent(event, ...)

    if event == "ADDON_LOADED" then
        local addon = ...
    if addon == "hideBar" then

        -- Hide action buttons and the multibarframes
        for id = 1, NUM_ACTIONBAR_BUTTONS do
            RegisterStateDriver(_G["ActionButton" .. id], "visibility", "[exists] show; hide")
            end
            RegisterStateDriver(MultiBarBottomLeft, "visibility", "[exists] show; hide")
            RegisterStateDriver(MultiBarBottomRight, "visibility", "[exists] show; hide")
        

    -- Hide frames and buttons    
    MainMenuBarArtFrameBackground:Hide()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    StatusTrackingBarManager:Hide()
    MainMenuBarArtFrame.PageNumber:Hide()
    
    end
end
end


-- Run
Frame:SetScript("OnEvent", Frame.OnEvent)







