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
    text = GSE.UnEscapeString(editbox:GetText())
    returntext = GSE.TranslateString(text , GetLocale(), GetLocale(), true)
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
	isNewFirstTimeCreated=true
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
    elements = GSE.split(key, ",")
    classid = tonumber(elements[1])
    sequenceName = elements[2]
	
    sequence = GSE.CloneSequence(GSELibrary[classid][sequenceName], true)
	isNewFirstTimeCreated=false
  end
  GSE.GUIEditFrame.SequenceName = sequenceName
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
  GSE.GUIEditFrame.ContentContainer:SelectTab("config")
  incomingframe:Hide()
  if not InCombatLockdown() then
	myUpdateFix()
	GSE.GUIEditFrame:Show()
  end

end

function GSE.getSequenceName()
  
  local names1 = GSE.GetSequenceNames()
  local numberOfSeqs = 0
  local currentSpecID, specname, specicon = GSE.GetCurrentSpecID()
  local newSeqNameTemp = GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters("New"..specname))
  local newSeqName = GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters("New"..specname))
  local newSeqNumber=numberOfSeqs+1
  if not GSE.isEmpty(GSELibrary[0]) then
    numberOfSeqs = 0
    for k,v in pairs(GSELibrary[0]) do
      numberOfSeqs = numberOfSeqs + 1
      for i,j in ipairs(v.MacroVersions) do
        GSELibrary[0][k].MacroVersions[tonumber(i)] = GSE.UnEscapeSequence(j)
      end
    end
  end
  if numberOfSeqs <= 0 then
    if not GSE.isEmpty(GSELibrary[GSE.GetCurrentClassID()]) then
      for k,v in GSE.pairsByKeys(names1) do
        numberOfSeqs = numberOfSeqs + 1 
      end
    end
  end
  newSeqNumber=numberOfSeqs+1
  newSeqNameTemp = GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters("New"..specname..newSeqNumber..GetTime()))
  newSeqNameTemp = GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
  for k,v in GSE.pairsByKeys(names1) do
    local elements = GSE.split(k, ",")
    local classid = tonumber(elements[1])
    local sequencename = elements[2]
	if newSeqNameTemp == sequencename then
	  newSeqNumber=numberOfSeqs+1
	  newSeqNameTemp = GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters("New"..specname..newSeqNumber..GetTime()))
	  newSeqNameTemp = GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
	end
  end
  for name, sequence in pairs(GSELibrary[GSE.GetCurrentClassID()]) do
    if newSeqNameTemp == name then
	  newSeqNumber = numberOfSeqs+1
	  newSeqNameTemp = GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters("New"..specname..newSeqNumber..GetTime()))
	  newSeqNameTemp = GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
	end
  end
  newSeqNameTemp = GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
  newSeqName =  GSE.TrimWhiteSpace(GSE.LowerAndReplaceSpecialCharacters(newSeqNameTemp))
  return newSeqName
end

function GSE.GUIUpdateSequenceList()
  local names = GSE.GetSequenceNames()
  GSE.GUIViewFrame.SequenceListbox:SetList(names)
end

function GSE.GUIToggleClasses(buttonname)
  if buttonname == "class" then
    classradio:SetValue(true)
    specradio:SetValue(false)
  else
    classradio:SetValue(false)
    specradio:SetValue(true)
  end
end


function GSE.GUIUpdateSequenceDefinition(classid, SequenceName, sequence)

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
      vals.sequence = sequence
      vals.classid = classid
      table.insert(GSE.OOCQueue, vals)
      GSE.GUIEditFrame:SetStatusText(string.format(L["Sequence %s saved."], SequenceName))
    end
  end
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
