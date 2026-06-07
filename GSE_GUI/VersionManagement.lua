local GNOME,_ = ...

local GSE = GSE

local AceGUI = LibStub("AceGUI-3.0")
local L = GSE.L
local libS = LibStub:GetLibrary("AceSerializer-3.0")
local libC = LibStub:GetLibrary("LibCompress")
local libCE = libC:GetAddonEncodeTable()
local currentSequence = ""
local otherversionlistboxvalue = nil

local versionframe = AceGUI:Create("Frame")
GSE.GUIVersionFrame = versionframe
versionframe:Hide()

versionframe:SetTitle(L["Manage Versions"])
versionframe:SetStatusText(L["Gnome Sequencer: Sequence Version Manager"])
versionframe:SetCallback("OnClose", function(widget)  versionframe:Hide(); GSE.GUIViewFrame:Show() end)
versionframe:SetLayout("List")

local columnGroup = AceGUI:Create("SimpleGroup")
columnGroup:SetFullWidth(true)
columnGroup:SetLayout("Flow")

local leftGroup = AceGUI:Create("SimpleGroup")
leftGroup:SetFullWidth(true)
leftGroup:SetLayout("List")

local rightGroup = AceGUI:Create("SimpleGroup")
rightGroup:SetFullWidth(true)
rightGroup:SetLayout("List")

local activesequencebox = AceGUI:Create("MultiLineEditBox")
activesequencebox:SetLabel(L["Active Version: "])
activesequencebox:SetNumLines(10)
activesequencebox:DisableButton(true)
activesequencebox:SetFullWidth(true)
leftGroup:AddChild(activesequencebox)

local otherversionlistbox = AceGUI:Create("Dropdown")
otherversionlistbox:SetLabel(L["Select Other Version"])
otherversionlistbox:SetWidth(150)
otherversionlistbox:SetCallback("OnValueChanged", function (obj,event,key) GSE.ChangeOtherSequence(key) end)
rightGroup:AddChild(otherversionlistbox)

local otherSequenceVersions = AceGUI:Create("MultiLineEditBox")
otherSequenceVersions:SetNumLines(11)
otherSequenceVersions:DisableButton(true)
otherSequenceVersions:SetFullWidth(true)
rightGroup:AddChild(otherSequenceVersions)

columnGroup:AddChild(leftGroup)
columnGroup:AddChild(rightGroup)

versionframe:AddChild(columnGroup)

local othersequencebuttonGroup = AceGUI:Create("SimpleGroup")
othersequencebuttonGroup:SetFullWidth(true)
othersequencebuttonGroup:SetLayout("Flow")

local actbutton = AceGUI:Create("Button")
actbutton:SetText(L["Make Active"])
actbutton:SetWidth(150)
actbutton:SetCallback("OnClick", function() GSE.SetActiveSequence(otherversionlistboxvalue) end)
othersequencebuttonGroup:AddChild(actbutton)

local delbutton = AceGUI:Create("Button")
delbutton:SetText(L["Delete Version"])
delbutton:SetWidth(150)
delbutton:SetCallback("OnClick", function()
  if not GSE.isEmpty(otherversionlistboxvalue) then
    GSE.DeleteSequenceVersion(currentSequence, otherversionlistboxvalue)
    otherversionlistbox:SetList(GSE.GetKnownSequenceVersions(currentSequence))
    otherSequenceVersions:SetText("")
  end
end)
othersequencebuttonGroup:AddChild(delbutton)


versionframe:AddChild(othersequencebuttonGroup)

function GSE.ChangeOtherSequence(key)
  otherversionlistboxvalue = key
  if not GSE.isEmpty(currentSequence) then
    local elements = GSE.split(currentSequence, ",")
    local classid = tonumber(elements[1])
    local sequenceName = elements[2]
    if GSELibrary[classid] and GSELibrary[classid][sequenceName] and GSELibrary[classid][sequenceName].MacroVersions then
      local ver = GSELibrary[classid][sequenceName].MacroVersions[tonumber(key)]
      if ver then
        otherSequenceVersions:SetText(GSE.ExportSequence(ver, sequenceName, true, "STRING", true))
      end
    end
  end
end

function GSE.SetActiveSequence(key)
  if not GSE.isEmpty(currentSequence) and not GSE.isEmpty(key) then
    local elements = GSE.split(currentSequence, ",")
    local classid = tonumber(elements[1])
    local sequenceName = elements[2]
    if GSELibrary[classid] and GSELibrary[classid][sequenceName] then
      GSELibrary[classid][sequenceName].Default = tonumber(key)
      GSE.Print(L["Active version set to "] .. key)
    end
  end
end

function GSE.DeleteSequenceVersion(currentSeq, version)
  if not GSE.isEmpty(currentSeq) and not GSE.isEmpty(version) then
    local elements = GSE.split(currentSeq, ",")
    local classid = tonumber(elements[1])
    local sequenceName = elements[2]
    if GSELibrary[classid] and GSELibrary[classid][sequenceName] and GSELibrary[classid][sequenceName].MacroVersions then
      GSELibrary[classid][sequenceName].MacroVersions[tonumber(version)] = nil
      GSE.Print(L["Version "] .. version .. L[" deleted"])
    end
  end
end

function GSE.GetKnownSequenceVersions(currentSeq)
  local versions = {}
  if not GSE.isEmpty(currentSeq) then
    local elements = GSE.split(currentSeq, ",")
    local classid = tonumber(elements[1])
    local sequenceName = elements[2]
    if GSELibrary[classid] and GSELibrary[classid][sequenceName] and GSELibrary[classid][sequenceName].MacroVersions then
      for k in pairs(GSELibrary[classid][sequenceName].MacroVersions) do
        versions[tostring(k)] = L["Version "] .. k
      end
    end
  end
  return versions
end
