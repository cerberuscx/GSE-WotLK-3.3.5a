local GNOME,_ = ...

local GSE = GSE
local Statics = GSE.Static

local AceGUI = LibStub("AceGUI-3.0")
local L = GSE.L
local libS = LibStub:GetLibrary("AceSerializer-3.0")
local libC = LibStub:GetLibrary("LibCompress")
local libCE = libC:GetAddonEncodeTable()
local editkey = ""


local viewframe = AceGUI:Create("Frame")
viewframe:SetTitle(L["Sequence Viewer"])


GSE.GUIViewFrame = viewframe

viewframe:Hide()
local sequenceboxtext = AceGUI:Create("MultiLineEditBox")
local remotesequenceboxtext = AceGUI:Create("MultiLineEditBox")

viewframe.panels = {}
viewframe.SequenceName = ""
viewframe.ClassID = 0

-- Set maximum resize bounds based on screen size
local maxHeight = GetScreenHeight() - 40
local maxWidth = GetScreenWidth() - 40
viewframe.frame:SetMaxResize(maxWidth, maxHeight)

-- Add resize constraints to prevent window from going off screen
viewframe.frame:SetScript("OnSizeChanged", function ()
  local Left, Bottom, Width, Height = viewframe.frame:GetBoundsRect()
  local screenHeight = GetScreenHeight()
  local screenWidth = GetScreenWidth()
  local maxHeight = screenHeight - 40  -- Leave some space at top/bottom
  local maxWidth = screenWidth - 40    -- Leave some space at sides
  
  -- Get current position
  local top = viewframe.frame:GetTop()
  local bottom = viewframe.frame:GetBottom()
  local left = viewframe.frame:GetLeft()
  local right = viewframe.frame:GetRight()
  
  -- Check if we need to constrain the size or reposition
  local needsResize = false
  local needsMove = false
  local newHeight = Height
  local newWidth = Width
  
  if Height > maxHeight then
    newHeight = maxHeight
    needsResize = true
  end
  
  if Width > maxWidth then
    newWidth = maxWidth
    needsResize = true
  end
  
  -- Check if window is going off screen edges
  if top and top > screenHeight then
    needsMove = true
  end
  
  if bottom and bottom < 0 then
    needsMove = true
  end
  
  if left and left < 0 then
    needsMove = true
  end
  
  if right and right > screenWidth then
    needsMove = true
  end
  
  -- Apply constraints if needed
  if needsResize then
    viewframe.frame:SetHeight(newHeight)
    viewframe.frame:SetWidth(newWidth)
  end
  
  -- Reposition if off screen
  if needsMove then
    local newPoint = {}
    newPoint.x = math.min(math.max(left or 20, 20), screenWidth - newWidth - 20)
    newPoint.y = math.min(math.max(bottom or 20, 20), screenHeight - newHeight - 20)
    viewframe.frame:ClearAllPoints()
    viewframe.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", newPoint.x, newPoint.y)
  end
  
  viewframe:DoLayout()
end)

function viewframe:clearpanels(widget, selected)
  GSE.PrintDebugMessage("widget = " .. widget:GetKey(), "GUI")
  for k,v in pairs(viewframe.panels) do
    GSE.PrintDebugMessage("k " .. k, "GUI")
    if k == widget:GetKey() then
      GSE.PrintDebugMessage ("matching key", "GUI")
      local elements = GSE.split(widget:GetKey(), ",")
      if selected then
        viewframe.ClassID = elements[1]
        viewframe.SequenceName = elements[2]
        viewframe.EditButton:SetDisabled(false)
        viewframe.DuplicateButton:SetDisabled(false)
        viewframe.ExportButton:SetDisabled(false)
        editkey = k
      else
        viewframe.ClassID = 0
        viewframe.SequenceName = ""
        viewframe.EditButton:SetDisabled(true)
        viewframe.DuplicateButton:SetDisabled(true)
        viewframe.ExportButton:SetDisabled(true)
        editkey = ""
      end

      viewframe.panels[k]:SetClicked(true)
    else
      GSE.PrintDebugMessage ("other widget key", "GUI")
      GSE.PrintDebugMessage("reprinting k " .. k, "GUI")
      local wid = viewframe.panels[k]
      wid:SetClicked(false)
    end
  end

  GSE.GUIConfigureMacroButton(viewframe.MacroIconButton)

end

function GSE.GUICreateSequencePanels(frame, container, key)
  local elements = GSE.split(key, ",")
  local classid = tonumber(elements[1])
  local sequencename = elements[2]
  local fontName, fontHeight, fontFlags = GameFontNormal:GetFont()
  local font = GameFontNormal:GetFontObject()
  local origjustifyV = font:GetJustifyV()
  font:SetJustifyV("BOTTOM")

  local selpanel = AceGUI:Create("SelectablePanel")
  selpanel:SetKey(key)
  selpanel:SetFullWidth(true)
  selpanel:SetHeight(300)
  viewframe.panels[key] = selpanel
  selpanel:SetCallback("OnClick", function(widget, _, selected, button)
    viewframe:clearpanels(widget, selected)
    if button == "RightButton" then
      GSE.GUILoadEditor(widget:GetKey(), viewframe)
    end
  end)

  local label = AceGUI:Create("Label")
  label:SetText(sequencename)
  label:SetFont(fontName, fontHeight + 4 , fontFlags)
  label:SetColor(GSE.GUIGetColour(GSEOptions.KEYWORD))
  selpanel:AddChild(label)

  local columngroup = AceGUI:Create("SimpleGroup")
  columngroup:SetFullWidth(true)
  columngroup:SetLayout("Flow")

  local column1 = AceGUI:Create("SimpleGroup")
  column1:SetWidth(560)
  column1:SetLayout("List")


  columngroup:AddChild(column1)



  local helplabel = AceGUI:Create("Label")
  local helptext = L["No Help Information Available"]
 

  if not GSE.isEmpty(GSELibrary[classid][sequencename].Help) then
     helptext = GSELibrary[classid][sequencename].Help
  end
  
  helplabel:SetFullWidth(true)
  helplabel:SetFontObject(font)
  helplabel:SetText(helptext )
  column1:AddChild(helplabel)

  local row2 = AceGUI:Create("SimpleGroup")
  row2:SetLayout("Flow")
  row2:SetFullWidth(true)

  local talentsHead = AceGUI:Create("Label")
  talentsHead:SetFont(fontName, fontHeight + 2 , fontFlags)
  talentsHead:SetText(L["Talents"] ..":")
  talentsHead:SetColor(GSE.GUIGetColour(GSEOptions.KEYWORD))
  talentsHead:SetWidth(60)
  row2:AddChild(talentsHead)

  local talentslabel = AceGUI:Create("Label")
  if not GSE.isEmpty(GSELibrary[classid][sequencename].Talents) then
    talentslabel:SetText(GSELibrary[classid][sequencename].Talents)
  end
  talentslabel:SetWidth(80)
  talentslabel:SetFontObject(font)
  row2:AddChild(talentslabel)

  local spacerlabel1 = AceGUI:Create("Label")
  spacerlabel1:SetText("")
  spacerlabel1:SetWidth(5)
  row2:AddChild(spacerlabel1)

  local urlHead = AceGUI:Create("Label")
  urlHead:SetFont(fontName, fontHeight + 2 , fontFlags)
  urlHead:SetText(L["Help URL"] ..":")
  urlHead:SetColor(GSE.GUIGetColour(GSEOptions.EmphasisColour))
  urlHead:SetWidth(70)
  row2:AddChild(urlHead)

  local urlval = "https://wowlazymacros.com"
  local urllabel = AceGUI:Create("InteractiveLabel")
  if not GSE.isEmpty(GSELibrary[classid][sequencename].Helplink) then
   urlval = GSELibrary[classid][sequencename].Helplink
  end
  urllabel:SetFontObject(font)
  urllabel:SetText(urlval)
  urllabel:SetCallback("OnClick", function()
    StaticPopupDialogs['GSE_SEQUENCEHELP'].url = urlval
    --StaticPopup_Show('GSE_SEQUENCEHELP')
  end)
  urllabel:SetColor(GSE.GUIGetColour(GSEOptions.WOWSHORTCUTS))
  urllabel:SetWidth(280)
  row2:AddChild(urllabel)


  local column2 = AceGUI:Create("SimpleGroup")
  column2:SetWidth(60)
  column2:SetLayout("List")
  columngroup:AddChild(column2)


  local viewiconpicker = AceGUI:Create("Icon")

  viewiconpicker.frame:RegisterForDrag("LeftButton")
  viewiconpicker.frame:SetScript("OnDragStart", function()
    PickupMacro(sequencename)
  end)
  selpanel.Icon = viewiconpicker
  viewiconpicker:SetImage(GSE.GetMacroIcon(classid, sequencename))
  viewiconpicker:SetImageSize(50,50)
  column2:AddChild(viewiconpicker)

  selpanel:AddChild(columngroup)
  selpanel:AddChild(row2)

  container:AddChild(selpanel)
  font:SetJustifyV(origjustifyV)
end

function GSE.GUIViewerToolbar(container)


  local buttonGroup = AceGUI:Create("SimpleGroup")
  buttonGroup:SetFullWidth(true)
  buttonGroup:SetLayout("Flow")

  local newbutton = AceGUI:Create("Button")
  newbutton:SetText(L["New"])
  newbutton:SetWidth(150)
  newbutton:SetCallback("OnClick", function() GSE.isNewFirstTimeCreated=true,GSE.GUILoadEditor(nil, viewframe) end)
  buttonGroup:AddChild(newbutton)

  local updbutton = AceGUI:Create("Button")
  updbutton:SetText(L["Edit"])
  updbutton:SetWidth(150)
  updbutton:SetCallback("OnClick", function() 
	--editframe.save = false
    GSE.GUIEditFrame:SetStatusText("")
	GSE.GUILoadEditor(editkey, viewframe) 
  end)
  updbutton:SetDisabled(true)
  buttonGroup:AddChild(updbutton)
  viewframe.EditButton = updbutton

  local dupbutton = AceGUI:Create("Button")
  dupbutton:SetText(L["Duplicate"])
  dupbutton:SetWidth(150)
  dupbutton:SetCallback("OnClick", function()
    local classid = viewframe.ClassID
    local sequencename = viewframe.SequenceName
    if not GSE.isEmpty(classid) and not GSE.isEmpty(sequencename) then
      -- Clone the sequence
      local originalSequence = GSELibrary[classid][sequencename]
      local clonedSequence = GSE.CloneSequence(originalSequence, true)
      
      -- Generate a unique name
      local newName = sequencename .. "_Copy"
      local counter = 1
      while GSELibrary[classid][newName] do
        newName = sequencename .. "_Copy" .. counter
        counter = counter + 1
      end
      
      -- Save the cloned sequence
      GSE.AddSequenceToCollection(newName, clonedSequence, classid)
      
      -- Refresh the viewer
      GSE.UpdateSequenceList()
      GSE.GUIShowViewer()
      
      -- Show success message
      GSE.Print(string.format(L["Sequence %s duplicated as %s"], sequencename, newName), GNOME)
    end
  end)
  dupbutton:SetDisabled(true)
  buttonGroup:AddChild(dupbutton)
  viewframe.DuplicateButton = dupbutton

  local impbutton = AceGUI:Create("Button")
  impbutton:SetText(L["Import"])
  impbutton:SetWidth(150)
  impbutton:SetCallback("OnClick", function() GSE.GUIViewFrame:Hide(); GSE.GUIImportFrame:Show() end)
  buttonGroup:AddChild(impbutton)

  local expbutton = AceGUI:Create("Button")
  expbutton:SetText(L["Export"])
  expbutton:SetWidth(150)
  expbutton:SetCallback("OnClick", function()
    GSE.GUIExportSequence(viewframe.ClassID, viewframe.SequenceName)
  end)
  buttonGroup:AddChild(expbutton)
  expbutton:SetDisabled(true)
  viewframe.ExportButton = expbutton

  local tranbutton = AceGUI:Create("Button")
  tranbutton:SetText(L["Send"])
  tranbutton:SetWidth(150)
  tranbutton:SetCallback("OnClick", function() GSE.GUIShowTransmissionGui(viewframe.ClassID .. "," .. viewframe.SequenceName) end)
  buttonGroup:AddChild(tranbutton)

  local disableSeqbutton = AceGUI:Create("Button")
  disableSeqbutton:SetDisabled(true)
  disableSeqbutton:SetText(L["Create Icon"])
  disableSeqbutton:SetWidth(150)


  buttonGroup:AddChild(disableSeqbutton)
  viewframe.MacroIconButton = disableSeqbutton
  local eOptionsbutton = AceGUI:Create("Button")
  eOptionsbutton:SetText(L["Options"])
  eOptionsbutton:SetWidth(150)
  eOptionsbutton:SetCallback("OnClick", function() GSE.OpenOptionsPanel() end)
  buttonGroup:AddChild(eOptionsbutton)

  local recordwindowbutton = AceGUI:Create("Button")
  recordwindowbutton:SetText(L["Record Macro"])
  recordwindowbutton:SetWidth(150)
  recordwindowbutton:SetCallback("OnClick", function() GSE.GUIViewFrame:Hide(); GSE.GUIRecordFrame:Show() end)
  buttonGroup:AddChild(recordwindowbutton)

  container:AddChild(buttonGroup)

  sequenceboxtext = sequencebox
end



function GSE.GUIViewerLayout(mcontainer)
  mcontainer:SetStatusText(L["Gnome Sequencer: Sequence Viewer"])
  mcontainer:SetCallback("OnClose", function(widget) viewframe:Hide() end)
  mcontainer:SetLayout("List")


  local scrollcontainer = AceGUI:Create("SimpleGroup")
  scrollcontainer:SetFullWidth(true)
  scrollcontainer:SetHeight(370)
  scrollcontainer:SetLayout("Fill")


  mcontainer:AddChild(scrollcontainer)
  local contentcontainer = AceGUI:Create("ScrollFrame")
  contentcontainer:SetLayout("list")
  scrollcontainer:AddChild(contentcontainer)
  viewframe.ScrollContainer = contentcontainer

  GSE.GUIViewerToolbar(mcontainer)

end

function GSE.GUIShowViewer()
  local names = GSE.GetSequenceNames()

  viewframe:ReleaseChildren()
  GSE.GUIViewerLayout(viewframe)
  local cclassid = -1
  for k,v in GSE.pairsByKeys(names) do
    local elements = GSE.split(k, ",")
    local tclassid = tonumber(elements[1])
    if tclassid ~= cclassid then
      cclassid = tclassid
      local fontName, fontHeight, fontFlags = GameFontNormal:GetFont()
      local sectionspacer1 = AceGUI:Create("Label")
      sectionspacer1:SetText(" ")
      sectionspacer1:SetFont(fontName, 4 , fontFlags)
      viewframe.ScrollContainer:AddChild(sectionspacer1)
      local sectionheader = AceGUI:Create("Label")
      sectionheader:SetText(Statics.wotlkSpecIDList[cclassid])
      sectionheader:SetFont(fontName, fontHeight + 6 , fontFlags)
      sectionheader:SetColor(GSE.GUIGetColour(GSEOptions.COMMENT))
      viewframe.ScrollContainer:AddChild(sectionheader)
      local sectionspacer2 = AceGUI:Create("Label")
      sectionspacer2:SetText(" ")
      sectionspacer2:SetFont(fontName, 2 , fontFlags)
      viewframe.ScrollContainer:AddChild(sectionspacer2)
    end
    GSE.GUICreateSequencePanels(viewframe,viewframe.ScrollContainer, k)
  end
  viewframe:Show()
end

function GSE.GUIConfigureMacroButton(button)
  if GSE.OOCCheckMacroCreated(GSE.GUIViewFrame.SequenceName) then
    button:SetText(L["Delete Icon"])
    button:SetCallback("OnClick", function()
      GSE.DeleteMacroStub(GSE.GUIViewFrame.SequenceName)
      GSE.GUIConfigureMacroButton(button)
      GSE.GUIViewFrame.panels[viewframe.ClassID .."," .. GSE.GUIViewFrame.SequenceName].Icon:SetImage(GSE.GetMacroIcon(tonumber(viewframe.ClassID), GSE.GUIViewFrame.SequenceName))
    end)
  else
    button:SetText(L["Create Icon"])
    button:SetCallback("OnClick", function()
      GSE.OOCCheckMacroCreated(GSE.GUIViewFrame.SequenceName, true)
      GSE.GUIConfigureMacroButton(button)
      GSE.GUIViewFrame.panels[viewframe.ClassID .."," .. GSE.GUIViewFrame.SequenceName].Icon:SetImage(GSE.GetMacroIcon(tonumber(viewframe.ClassID), GSE.GUIViewFrame.SequenceName))
    end)
  end
  if GSE.isEmpty(GSE.GUIViewFrame.SequenceName) then
    button:SetDisabled(true)
  else
    button:SetDisabled(false)
  end
  if GSE.GUIViewFrame.ClassID == 0 or GSE.GUIViewFrame.ClassID == GSE.GetCurrentClassID() then
    button:SetDisabled(true)
  end

end
