local GSE = GSE
local L = GSE.L

GSE.GUIEditFrame = {}

-- Raise GSE's Blizzard static popups above the AceGUI editor/viewer frames.
-- AceGUI Frames use FULLSCREEN_DIALOG at frame level 100; StaticPopup uses DIALOG.
local function GSE_RaisePopup(self)
  if not self then return end
  self:SetFrameStrata("FULLSCREEN_DIALOG")
  local base = 100
  if GSE.GUIEditFrame and GSE.GUIEditFrame.frame then
    base = math.max(base, GSE.GUIEditFrame.frame:GetFrameLevel() or 0)
  end
  local target = base + 50
  if (self:GetFrameLevel() or 0) < target then
    self:SetFrameLevel(target)
  end
end

local function GSE_ApplyPopupRaise(dialog)
  if type(dialog) ~= "table" then return end
  local originalOnShow = dialog.OnShow
  dialog.OnShow = function(self, ...)
    if originalOnShow then originalOnShow(self, ...) end
    GSE_RaisePopup(self)
  end
end

StaticPopupDialogs["GSE_ConfirmReloadUIDialog"] = {
  text = L["You need to reload the User Interface to complete this task.  Would you like to do this now?"],
  button1 = L["Yes"],
  button2 = L["No"],
  OnAccept = function()
      ReloadUI();
  end,
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}

StaticPopupDialogs["GS-DebugOutput"] = {
  text = "Dump of GS Debug messages",
  button1 = L["Update"],
  button2 = L["Close"],
  OnAccept = function(self, data)
      self.editBox:SetText(GSE.DebugOutput)
  end,
	OnShow = function (self, data)
    self.editBox:SetText(GSE.DebugOutput)
  end,
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
	hasEditBox = true,
}

StaticPopupDialogs['GSE_UPDATE_AVAILABLE'] = {
	text = L["GSE is out of date. You can download the newest version from https://mods.curse.com/addons/wow/gnomesequencer-enhanced."],
	hasEditBox = 1,
	OnShow = function(self)
		self.editBox:SetAutoFocus(false)
		self.editBox:SetWidth(220)
		self.editBox:SetText("https://mods.curse.com/addons/wow/gnomesequencer-enhanced")
		self.editBox:HighlightText()
		ChatEdit_FocusActiveWindow();
	end,
	OnHide = function(self)
		self.editBox:SetWidth(self.editBox.width or 50)
	end,
	hideOnEscape = 1,
	button1 = OKAY,
	EditBoxOnEnterPressed = function(self)
		ChatEdit_FocusActiveWindow();
		self:GetParent():Hide();
	end,
	EditBoxOnEscapePressed = function(self)
		ChatEdit_FocusActiveWindow();
		self:GetParent():Hide();
	end,
	EditBoxOnTextChanged = function(self)
		if(self:GetText() ~= "https://mods.curse.com/addons/wow/gnomesequencer-enhanced") then
			self:SetText("https://mods.curse.com/addons/wow/gnomesequencer-enhanced")
		end
		self:HighlightText()
		self:ClearFocus()
		ChatEdit_FocusActiveWindow();
	end,
	OnEditFocusGained = function(self)
		self:HighlightText()
	end,
	showAlert = 1,
}

StaticPopupDialogs['GSE_SEQUENCEHELP'] = {
	text = L["Copy this link and open it in a Browser."],
	hasEditBox = 1,
  url = "http://www.wowlazymacros.com",
	OnShow = function(self)
		self.editBox:SetAutoFocus(false)
		self.editBox.width = self.editBox:GetWidth()
		self.editBox:SetWidth(220)
		self.editBox:SetText("http://www.wowlazymacros.com")
		self.editBox:HighlightText()
		ChatEdit_FocusActiveWindow();
	end,
	OnHide = function(self)
		self.editBox:SetWidth(50)
		self.editBox.width = nil
	end,
	hideOnEscape = 1,
	button1 = OKAY,
	EditBoxOnEnterPressed = function(self)
		ChatEdit_FocusActiveWindow();
		self:GetParent():Hide();
	end,
	EditBoxOnEscapePressed = function(self)
		ChatEdit_FocusActiveWindow();
		self:GetParent():Hide();
	end,
	EditBoxOnTextChanged = function(self)
		--if(self~=nil and self:GetText() ~= StaticPopupDialogs['GSE_SEQUENCEHELP'].url) then
			self:SetText("http://www.wowlazymacros.com")
		--end
		self:HighlightText()
		self:ClearFocus()
		ChatEdit_FocusActiveWindow();
	end,
	OnEditFocusGained = function(self)
		self:HighlightText()
	end,
	showAlert = 1,
}

StaticPopupDialogs["GSE-SampleMacroDialog"] = {
  text = L["There are No Macros Loaded for this class.  Would you like to load the Sample Macro?"],
  button1 = L["Load"],
  button2 = L["Close"],
  OnAccept = function(self, data)
      --GSE.LoadSampleMacros(GSE.GetCurrentClassID())
  end,
  timeout = 1,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}

StaticPopupDialogs["GSE-MacroImportSuccess"] = {
  text = L["Macro Import Successful."],
  button1 = L["Close"],
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}

StaticPopupDialogs["GSE-MacroImportFailure"] = {
  text = L["Macro unable to be imported."],
  button1 = L["Close"],
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}

StaticPopupDialogs["GSE-DeleteMacroDialog"] = {
  text = "",
  button1 = L["Delete"],
  button2 = L["Cancel"],
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}

for _, dialogName in ipairs({
  "GSE_ConfirmReloadUIDialog",
  "GS-DebugOutput",
  "GSE_UPDATE_AVAILABLE",
  "GSE_SEQUENCEHELP",
  "GSE-SampleMacroDialog",
  "GSE-MacroImportSuccess",
  "GSE-MacroImportFailure",
  "GSE-DeleteMacroDialog",
}) do
  GSE_ApplyPopupRaise(StaticPopupDialogs[dialogName])
end
