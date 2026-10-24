local GSE = GSE
local L = GSE.L
function myUpdateFix()
  GSE:ProcessOOCQueue()
  GSE.ReloadSequences()
  
end
--- This function pops up a confirmation dialog.
function GSE.GUIDeleteSequence(currentSeq, iconWidget)
  StaticPopupDialogs["GSE-DeleteMacroDialog"].text = string.format(L["Are you sure you want to delete %s?  This will delete the macro and all versions.  This action cannot be undone."], GSE.GUIEditFrame.SequenceName)
  StaticPopupDialogs["GSE-DeleteMacroDialog"].OnAccept = function(self, data)
      GSE.GUIConfirmDeleteSequence(GSE.GUIEditFrame.ClassID, GSE.GUIEditFrame.SequenceName)
  end
  StaticPopup_Show ("GSE-DeleteMacroDialog")
  
end

--- This function then deletes the macro
function GSE.GUIConfirmDeleteSequence(classid, sequenceName)
  GSE.GUIViewFrame:Hide()
  GSE.GUIEditFrame:Hide()
  GSE.DeleteSequence(classid, sequenceName)
  GSE.GUIShowViewer()
end


--- Format the text against the GSE Sequence Spec.
function GSE.GUIParseText(editbox)
  if GSEOptions.RealtimeParse then
    local text = GSE.UnEscapeString(editbox:GetText())
    local returntext = GSE.TranslateString(text , GetLocale(), GetLocale(), true)
    editbox:SetText(returntext)
    editbox:SetCursorPosition(string.len(returntext)+2)
  end
end

function GSE.GUILoadEditor(key, incomingframe, recordedstring)
  local classid
  local sequenceName
  local sequence
  
  if GSE.isEmpty(key) then
    classid = GSE.GetCurrentClassID()
    sequenceName = GSE.getSequenceName()
	GSE.isNewFirstTimeCreated=true
    sequence = {
      ["Author"] = GSE.GetCharacterName(),
      ["Talents"] = GSE.GetCurrentTalents(),
      ["Default"] = 1,
      ["SpecID"] = GSE.GetCurrentSpecID();
      ["MacroVersions"] = {
        [1] = {
          ["PreMacro"] = {},
          ["PostMacro"] = {},
          ["KeyPress"] = {},
          ["KeyRelease"] = {},
          ["StepFunction"] = "Sequential",
          [1] = "/say Hello",
        }
      },
    }
    if not GSE.isEmpty(recordedstring) then
      sequence.MacroVersions[1][1] = nil
      sequence.MacroVersions[1] = GSE.SplitMeIntolines(recordedstring)
    end
  else
    local elements = GSE.split(key, ",")
    classid = tonumber(elements[1])
    sequenceName = elements[2]

    local source = GSELibrary[classid] and GSELibrary[classid][sequenceName]
    if type(source) ~= "table" or type(source.MacroVersions) ~= "table" then
      GSE.Print("Unable to load sequence " .. tostring(sequenceName) .. ": invalid saved data.", "GSE")
      return
    end

    sequence = GSE.CloneSequence(source, true)
	GSE.isNewFirstTimeCreated=false
  end
  GSE.GUIEditFrame.SequenceName = sequenceName
  GSE.GUIEditFrame.OriginalSequenceName = (not GSE.isEmpty(key)) and sequenceName or nil
  GSE.GUIEditFrame.Sequence = sequence
  GSE.GUIEditFrame.ClassID = classid
  GSE.GUIEditFrame.Default = sequence.Default
  GSE.GUIEditFrame.PVP = sequence.PVP or sequence.Default
  GSE.GUIEditFrame.Mythic = sequence.Mythic or sequence.Default
  GSE.GUIEditFrame.Raid = sequence.Raid or sequence.Default
  GSE.GUIEditFrame.Dungeon = sequence.Dungeon or sequence.Default
  GSE.GUIEditFrame.Heroic = sequence.Heroic or sequence.Default
  GSE.GUIEditFrame.Party = sequence.Party or sequence.Default
  GSE.GUIEditorPerformLayout(GSE.GUIEditFrame)
  GSE.GUIEditFrame.SelectedTab = "config"
  incomingframe:Hide()
  if not InCombatLockdown() then
	myUpdateFix()
	GSE.GUIEditFrame:Show()
	GSE.GUIEditFrame.ContentContainer:SelectTab("config")
	GSE.RelayoutEditor()
  end

end

function GSE.getSequenceName()
  local names1 = GSE.GetSequenceNames()
  local numberOfSeqs = 0
  local currentSpecID, specname, specicon = GSE.GetCurrentSpecID()
  specname = specname or ""
  local newSeqNameTemp = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters("New"..specname))
  local newSeqName = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters("New"..specname))
  local newSeqNumber=numberOfSeqs+1
  if type(GSELibrary[0]) == "table" then
    numberOfSeqs = 0
    for k,v in pairs(GSELibrary[0]) do
      if type(v) == "table" and type(v.MacroVersions) == "table" then
        numberOfSeqs = numberOfSeqs + 1
        for i,j in ipairs(v.MacroVersions) do
          GSELibrary[0][k].MacroVersions[tonumber(i)] = GSE.UnEscapeSequence(j)
        end
      end
    end
  end
  if numberOfSeqs <= 0 then
    if type(GSELibrary[GSE.GetCurrentClassID()]) == "table" then
      for k,v in GSE.pairsByKeys(names1) do
        numberOfSeqs = numberOfSeqs + 1
      end
    end
  end
  newSeqNumber=numberOfSeqs+1
  newSeqNameTemp = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters("New"..specname..newSeqNumber..GetTime()))
  newSeqNameTemp = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
  for k,v in GSE.pairsByKeys(names1) do
    local elements = GSE.split(k, ",")
    local classid = tonumber(elements[1])
    local sequencename = elements[2]
    if newSeqNameTemp == sequencename then
      newSeqNumber=numberOfSeqs+1
      newSeqNameTemp = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters("New"..specname..newSeqNumber..GetTime()))
      newSeqNameTemp = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
    end
  end
  local currentClassSequences = GSELibrary[GSE.GetCurrentClassID()]
  if type(currentClassSequences) == "table" then
    for name, sequence in pairs(currentClassSequences) do
      if newSeqNameTemp == name then
        newSeqNumber = numberOfSeqs+1
        newSeqNameTemp = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters("New"..specname..newSeqNumber..GetTime()))
        newSeqNameTemp = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
      end
    end
  end
  newSeqNameTemp = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
  newSeqName = GSE.NormalizeSequenceName(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
  return newSeqName
end

function GSE.GUIUpdateSequenceList()
  local names = GSE.GetSequenceNames()
  GSE.GUIViewFrame.SequenceListbox:SetList(names)
end

function GSE.GUIToggleClasses(buttonname)
  if not classradio or not specradio then
    return
  end
  if buttonname == "class" then
    classradio:SetValue(true)
    specradio:SetValue(false)
  else
    classradio:SetValue(false)
    specradio:SetValue(true)
  end
end


function GSE.GUIUpdateSequenceDefinition(classid, SequenceName, sequence, previousName)

  if type(sequence) ~= "table" or type(sequence.MacroVersions) ~= "table" then
    GSE.Print(L["Unable to process content.  Fix table and try again."], "GSE")
    return
  end
  SequenceName = GSE.NormalizeSequenceName(SequenceName)
  -- Changes have been made so save them
  for k,v in ipairs(sequence.MacroVersions) do
    sequence.MacroVersions[k] = GSE.TranslateSequenceFromTo(v, GetLocale(), "enUS", SequenceName)
    sequence.MacroVersions[k] = GSE.UnEscapeSequence(sequence.MacroVersions[k])
  end

  if not GSE.isEmpty(SequenceName) then
    if GSE.isEmpty(classid) then
      classid = GSE.GetCurrentClassID()
    end
    if not GSE.isEmpty(SequenceName) then
      local vals = {}
      vals.action = "Replace"
      vals.sequencename = SequenceName
      vals.previousname = previousName
      vals.sequence = sequence
      vals.classid = classid
      table.insert(GSE.OOCQueue, vals)
      GSE.GUIEditFrame:SetStatusText(string.format(L["Sequence %s saved."], SequenceName))
    end
  end
end


--- Returns a conflict message if a sequence or macro with this name already exists.
function GSE.GetSequenceNameConflict(classid, newName, originalName)
  if GSE.isEmpty(newName) then
    return L["No Sequence Name"]
  end
  if originalName and newName == originalName then
    return nil
  end
  local originalClassid = tonumber(classid)
  local lowerName = string.lower(newName)
  for cid, library in pairs(GSELibrary) do
    if type(library) == "table" then
      for name, sequence in pairs(library) do
        if type(name) == "string"
          and type(sequence) == "table"
          and type(sequence.MacroVersions) == "table"
          and string.lower(name) == lowerName
          and not (originalName and originalClassid and cid == originalClassid and name == originalName) then
          return L["A sequence with that name already exists."]
        end
      end
    end
  end
  local macroIndex = GetMacroIndexByName(newName)
  if macroIndex and macroIndex ~= 0 then
    if originalName then
      local oldIndex = GetMacroIndexByName(originalName)
      if oldIndex and oldIndex ~= 0 and oldIndex == macroIndex then
        return nil
      end
    end
    return L["A macro with that name already exists."]
  end
  return nil
end

--- Validate the editor name and grey out Save when the name is taken.
function GSE.ValidateEditorSequenceName()
  local frame = GSE.GUIEditFrame
  if not frame or not frame.nameeditbox then
    return true
  end
  local newName = GSE.NormalizeSequenceName(frame.nameeditbox:GetText())
  local conflict = GSE.GetSequenceNameConflict(frame.ClassID, newName, frame.OriginalSequenceName)
  if conflict then
    if frame.SaveButton then
      frame.SaveButton:SetDisabled(true)
    end
    frame:SetStatusText("|cffff0000" .. conflict .. "|r")
    return false
  end
  if frame.SaveButton then
    frame.SaveButton:SetDisabled(false)
  end
  frame:SetStatusText("")
  return true
end


function GSE.GUIGetColour(option)
  hex = string.gsub(option, "#","")
  return tonumber("0x".. string.sub(option,5,6))/255, tonumber("0x"..string.sub(option,7,8))/255, tonumber("0x"..string.sub(option,9,10))/255
end

function  GSE.GUISetColour(option, r, g, b)
  option = string.format("|c%02x%02x%02x%02x", 255 , r*255, g*255, b*255)
end


function GSE:OnInitialize()
    GSE.GUIRecordFrame:Hide()
    GSE.GUIVersionFrame:Hide()
    GSE.GUIEditFrame:Hide()
    GSE.GUIViewFrame:Hide()
end


function GSE.OpenOptionsPanel()
  local config = LibStub:GetLibrary("AceConfigDialog-3.0")
  config:Open("GSE")
  --config:SelectGroup("GSSE", "Debug")

end
