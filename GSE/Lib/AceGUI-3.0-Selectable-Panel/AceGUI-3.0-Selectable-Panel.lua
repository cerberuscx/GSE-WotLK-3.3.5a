local Type = "SelectablePanel"
local Version = 5

local AceGUI = LibStub and LibStub("GSE-AceGUI-3.0", true)
if not AceGUI or (AceGUI:GetWidgetVersion(Type) or 0) >= Version then return end



-------------
-- Widgets --
-------------
--[[
	Widgets must provide the following functions
		Acquire() - Called when the object is aquired, should set everything to a default hidden state
		Release() - Called when the object is Released, should remove any anchors and hide the Widget

	And the following members
		frame - the frame or derivitive object that will be treated as the widget for size and anchoring purposes
		type - the type of the object, same as the name given to :RegisterWidget()

	Widgets contain a table called userdata, this is a safe place to store data associated with the wigdet
	It will be cleared automatically when a widget is released
	Placing values directly into a widget object should be avoided

	If the Widget can act as a container for other Widgets the following
		content - frame or derivitive that children will be anchored to

	The Widget can supply the following Optional Members
]]

--------------------------
-- Selectable Palen	    --
--------------------------
--[[
	This is a simple grouping container, that responds to move over and click.
	It will resize automatically to the height of the controls added to it

  It expects that a Key is set to identify it.
]]


local function OnAcquire(self)
	self:SetWidth(300)
	self:SetHeight(100)
	if self.border then
		self.border:SetAlpha(0)
	end
	if self.selectedBackground then
		self.selectedBackground:SetAlpha(0)
	end
	if self.frame and self.frame.SetBackdropBorderColor then
		self.frame:SetBackdropBorderColor(1, 1, 1, 0)
	end
	self.Clicked = false
	self.ResizeContent = nil
end

local function OnRelease(self)
	self.frame:ClearAllPoints()
	self.frame:Hide()
	self.Clicked = false
	self.ResizeContent = nil
end

local function SelectablePanel_OnClick(self, button)
  if button == "LeftButton" then
    self.obj:SetClicked(not self.obj.Clicked)
  end
	self.obj:Fire("OnClick", self.obj.Clicked, button)
end


local function LayoutFinished(self, width, height)
	if self.noAutoHeight then return end
	self:SetHeight((height or 0) + 20)
end

local function OnWidthSet(self, width)
	local content = self.content
	local contentwidth = width - 20
	if contentwidth < 0 then
		contentwidth = 0
	end
	content:SetWidth(contentwidth)
	content.width = contentwidth
	if self.ResizeContent then
		self.ResizeContent(width)
	end
end

local function OnHeightSet(self, height)
	local content = self.content
	local contentheight = height - 20
	if contentheight < 0 then
		contentheight = 0
	end
	content:SetHeight(contentheight)
	content.height = contentheight
end

local function SetClicked(self, boole)
	if boole then
		self.Clicked = true
		self.border:SetAlpha(1)
		if self.selectedBackground then
			self.selectedBackground:SetAlpha(0.18)
		end
		if self.frame and self.frame.SetBackdropBorderColor then
			self.frame:SetBackdropBorderColor(self.selectedR or 1, self.selectedG or 0.82, self.selectedB or 0, 0.65)
		end
	else
		self.Clicked = false
		self.border:SetAlpha(0)
		if self.selectedBackground then
			self.selectedBackground:SetAlpha(0)
		end
		if self.frame and self.frame.SetBackdropBorderColor then
			self.frame:SetBackdropBorderColor(self.selectedR or 1, self.selectedG or 0.82, self.selectedB or 0, 0)
		end
	end
end

local function SetKey(self, key)
  self.Key = key
end

local function GetKey(self)
  return self.Key
end

local function SetSelectedColor(self, r, g, b)
	self.selectedR, self.selectedG, self.selectedB = r or 1, g or 0.82, b or 0
	local selected = self.Clicked
	self.border:SetVertexColor(self.selectedR, self.selectedG, self.selectedB, 1)
	self.border:SetAlpha(selected and 1 or 0)
	if self.selectedBackground then
		self.selectedBackground:SetVertexColor(self.selectedR, self.selectedG, self.selectedB, 1)
		self.selectedBackground:SetAlpha(selected and 0.18 or 0)
	end
	if self.frame and self.frame.SetBackdropBorderColor then
		self.frame:SetBackdropBorderColor(self.selectedR, self.selectedG, self.selectedB, selected and 0.65 or 0)
	end
end


local function Constructor()
	local frame = CreateFrame("Frame",nil,UIParent)

	local self = {}
	self.type = Type

	self.OnRelease = OnRelease
	self.OnAcquire = OnAcquire
	self.frame = frame
	self.LayoutFinished = LayoutFinished
	self.OnWidthSet = OnWidthSet
	self.OnHeightSet = OnHeightSet


  self.Clicked = false
	self.Key = ""
  self.SetKey = SetKey
	self.GetKey = GetKey
  self.SetClicked = SetClicked
	self.SetSelectedColor = SetSelectedColor

	frame.obj = self

	frame:SetHeight(100)
	frame:SetWidth(100)
	frame:SetFrameStrata("FULLSCREEN_DIALOG")
  frame:SetScript("OnMouseUp", SelectablePanel_OnClick)
  local highlightTexture = frame:CreateTexture(nil, "HIGHLIGHT")
  highlightTexture:SetAllPoints(true)
  highlightTexture:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
	highlightTexture:SetAlpha(0.12)
  frame:EnableMouse(true)

  frame:SetBackdrop({
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 4,
    insets = { left = 2, right = 2, top = 2, bottom = 2 },
  })
  frame:SetBackdropBorderColor(1, 1, 1, 0)

  local background = frame:CreateTexture(nil, "BACKGROUND")
  background:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
  background:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
  background:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
  background:SetVertexColor(0, 0, 0, 0.22)

  local selectedBackground = frame:CreateTexture(nil, "BACKGROUND")
  selectedBackground:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
  selectedBackground:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
  selectedBackground:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
  selectedBackground:SetVertexColor(1.0, 0.82, 0.0, 1)
  selectedBackground:SetAlpha(0)
  self.selectedBackground = selectedBackground

  local border=frame:CreateTexture(nil, "BACKGROUND")
	border:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
	border:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
  border:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 2, 2)
  border:SetWidth(4)
	border:SetVertexColor(1.0, 0.82, 0.0, 0)

  self.border = border

	--Container Support
	local content = CreateFrame("Frame",nil,frame)
	self.content = content
	content.obj = self
	content:SetPoint("TOPLEFT",frame,"TOPLEFT",10,-10)
	content:SetPoint("BOTTOMRIGHT",frame,"BOTTOMRIGHT",-10,10)


	AceGUI:RegisterAsContainer(self)
	return self
end



AceGUI:RegisterWidgetType(Type,Constructor,Version)
