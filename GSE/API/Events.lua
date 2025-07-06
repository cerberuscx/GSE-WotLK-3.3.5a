local GNOME, _ = ...

local GSE = GSE

local currentclassDisplayName, currentenglishclass=UnitClass("player")
local currentclassId = GSE.GetCurrentClassID()
local L = GSE.L
local Statics = GSE.Static

local GCD, GCD_Update_Timer


--- This function is used to debug a sequence and trace its execution.
function GSE.TraceSequence(button, step, task)
  if GSE.UnsavedOptions.DebugSequenceExecution then
    -- Note to self do i care if its a loop sequence?
    local isUsable, notEnoughMana = IsUsableSpell(task)
    local usableOutput, manaOutput, GCDOutput, CastingOutput
    if isUsable then
      usableOutput = GSEOptions.CommandColour .. "Able To Cast" .. Statics.StringReset
    else
      usableOutput =  GSEOptions.UNKNOWN .. "Not Able to Cast" .. Statics.StringReset
    end
    if notEnoughMana then
      manaOutput = GSEOptions.UNKNOWN .. "Resources Not Available".. Statics.StringReset
    else
      manaOutput =  GSEOptions.CommandColour .. "Resources Available" .. Statics.StringReset
    end
    local castingspell, _, _, _, _, _, castspellid, _ = UnitCastingInfo("player")
    if not GSE.isEmpty(castingspell) then
      CastingOutput = GSEOptions.UNKNOWN .. "Casting " .. castingspell .. Statics.StringReset
    else
      CastingOutput = GSEOptions.CommandColour .. "Not actively casting anything else." .. Statics.StringReset
    end
    GCDOutput =  GSEOptions.CommandColour .. "GCD Free" .. Statics.StringReset
    if GCD then
      GCDOutput = GSEOptions.UNKNOWN .. "GCD In Cooldown" .. Statics.StringReset
    end
    GSE.PrintDebugMessage(button .. "," .. step .. "," .. (task and task or "nil")  .. "," .. usableOutput .. "," .. manaOutput .. "," .. GCDOutput .. "," .. CastingOutput, Statics.SequenceDebug)
  end
end



function GSE:UNIT_FACTION()
  --local pvpType, ffa, _ = GetZonePVPInfo()
  if UnitIsPVP("player") then
    GSE.PVPFlag = true
  else
    GSE.PVPFlag = false
  end
  GSE.PrintDebugMessage("PVP Flag toggled to " .. tostring(GSE.PVPFlag), Statics.DebugModules["API"])
  GSE.ReloadSequences()
end

function getInstacneInfoLocal()
	local inInstance, instancetype = IsInInstance()
	local _, _, difficultyIndex, _, _, playerDifficulty, isDynamic = GetInstanceInfo()
	
	if inInstance and instancetype == "raid" then
		if isDynamic and difficultyIndex == 4 then
			if playerDifficulty == 0 then
				idtext:SetText("25H")
			end
		end
		if isDynamic and difficultyIndex == 3 then
			if playerDifficulty == 0 then
				idtext:SetText("10H")
			end
		end
		if isDynamic and difficultyIndex == 2 then
			if playerDifficulty == 0 then
				idtext:SetText("25")
			end
			if playerDifficulty == 1 then
				idtext:SetText("25H") 
			end
		end
		if isDynamic and difficultyIndex == 1 then
			if playerDifficulty == 0 then
				idtext:SetText("10") 
			end
			if playerDifficulty == 1 then
				idtext:SetText("10H") 
			end
		end
		if not isDynamic then
			if difficultyIndex == 1 then
				idtext:SetText("10") 
			end
			if difficultyIndex == 2 then
				idtext:SetText("25") 
			end
			if difficultyIndex == 3 then
				idtext:SetText("10H") 
			end
			if difficultyIndex == 4 then
				idtext:SetText("25H") 
			end
		end
	end
	if not inInstance then
		idtext:SetText("") 
	end
end
function GSE:PARTY_MEMBERS_CHANGED()
if (InCombatLockdown()~=1) then
GSE:ZONE_CHANGED_NEW_AREA()
end
end
function GSE:ZONE_CHANGED_NEW_AREA()
 -- local name, type1, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, mapID, instanceGroupSize = GetInstanceInfo()
 ---dynamicDifficulty reflected the normal/heroic switch and difficultyID the 10/25 player switch for dynamic instances). 
 ---GetRaidDifficulty,GetDungeonDifficulty,IsInInstance,GetInstanceInfo(),GetInstanceDifficulty()
 -----3 → 10 Player
-------------4 → 25 Player
-------------5 → 10 Player (Heroic)
-------------6 → 25 Player (Heroic)
----1 5 players normal
-----2 5 players heroic
-- GetInstanceDifficulty()
-- SetDungeonDifficulty

-- 1 → 5 Player & Scenario
-- 2 → 5 Player (Heroic)
--SetRaidDifficulty
-- 1 → 10 Player
-- 2 → 25 Player
-- 3 → 10 Player (Heroic)
-- 4 → 25 Player (Heroic)

-- 10 → 40 Player
-- Notes
local inInstance, instancetype = IsInInstance()
--local _, _, difficultyIndex, _, _, playerDifficulty, isDynamic = GetInstanceInfo()

  local name, type1, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance = GetInstanceInfo()
  if type1 == "arena" or type1 == "pvp" then
    GSE.PVPFlag = true
  else
    GSE.PVPFlag = false
  end
  if difficulty == 23 then
    GSE.inMythic = true
  else
    GSE.inMythic = false
  end
  if ((IsInInstance()==1) and (instancetype=="party")) then
    GSE.inDungeon = true
  else
    GSE.inDungeon = false
  end
  
  if (difficulty == 2 or difficult == 24 or difficulty==4) then
    GSE.inHeroic = true
  else
    GSE.inHeroic = false
  end
  if ((IsInInstance()==1) and (instancetype=="raid")) then
    GSE.inRaid = true
  else
    GSE.inRaid = false
  end
  if (GetNumPartyMembers()>0) then
    GSE.inParty = true
  else
    GSE.inParty = false
  end
  GSE.PrintDebugMessage("PVP: " .. tostring(GSE.PVPFlag) .. " inMythic: " .. tostring(GSE.inMythic) .. " inRaid: " .. tostring(GSE.inRaid) .. " inDungeon " .. tostring(GSE.inDungeon) .. " inHeroic " .. tostring(GSE.inHeroic), Statics.DebugModules["API"])
  GSE.ReloadSequences()
end

function GSE:PLAYER_ENTERING_WORLD()
  GSE.PrintAvailable = true
  GSE.PerformPrint()
end

function GSE:ADDON_LOADED(event, addon)
  if GSE.isEmpty(GSELibrary) then
    GSELibrary = {}
  end
  if GSE.isEmpty(GSELibrary[GSE.GetCurrentClassID()]) then
    GSELibrary[GSE.GetCurrentClassID()] = {}
  end
  if GSE.isEmpty(GSELibrary[0]) then
    GSELibrary[0] = {}
  end

  local counter = 0

  for k,v in pairs(GSELibrary[GSE.GetCurrentClassID()]) do
    counter = counter + 1
    for i,j in ipairs(v.MacroVersions) do
      GSELibrary[GSE.GetCurrentClassID()][k].MacroVersions[tonumber(i)] = GSE.UnEscapeSequence(j)
    end
  end
  if not GSE.isEmpty(GSELibrary[0]) then

    for k,v in pairs(GSELibrary[0]) do
      counter = counter + 1
      for i,j in ipairs(v.MacroVersions) do
        GSELibrary[0][k].MacroVersions[tonumber(i)] = GSE.UnEscapeSequence(j)
      end
    end
  end
  if counter <= 0 then
    --StaticPopup_Show ("GSE-SampleMacroDialog")
  end
  GSE.PrintDebugMessage("I am loaded")
  GSEOptions.UnfoundSpells = {}
  GSEOptions.ErroneousSpellID = {}
  GSEOptions.UnfoundSpellIDs = {}
  GSE:ZONE_CHANGED_NEW_AREA()
  GSE:SendMessage(Statics.CoreLoadedMessage)

  -- Register the Sample Macros
  local seqnames = {}
  table.insert(seqnames, "Assorted Sample Macros")
  GSE.RegisterAddon("Samples", GSE.VersionString, seqnames)

  GSE:RegisterMessage(Statics.ReloadMessage, "processReload")

  LibStub("AceConfig-3.0"):RegisterOptionsTable("GSE", GSE.GetOptionsTable(), {"gseo"})
  if addon == GNOME then
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("GSE", "|cffff0000GSE:|r Gnome Sequencer Enhanced")
    if not GSEOptions.HideLoginMessage then
      GSE.Print(GSEOptions.AuthorColour .. L["GnomeSequencer-Enhanced loaded.|r  Type "] .. GSEOptions.CommandColour .. L["/gs help|r to get started."], GNOME)
    end
  end

  -- added in 2.1.0
  if GSE.isEmpty(GSEOptions.MacroResetModifiers) then
    GSEOptions.MacroResetModifiers = {}
    GSEOptions.MacroResetModifiers["LeftButton"] = false
    GSEOptions.MacroResetModifiers["RighttButton"] = false
    GSEOptions.MacroResetModifiers["MiddleButton"] = false
    GSEOptions.MacroResetModifiers["Button4"] = false
    GSEOptions.MacroResetModifiers["Button5"] = false
    GSEOptions.MacroResetModifiers["LeftAlt"] = false
    GSEOptions.MacroResetModifiers["RightAlt"] = false
    GSEOptions.MacroResetModifiers["Alt"] = false
    GSEOptions.MacroResetModifiers["LeftControl"] = false
    GSEOptions.MacroResetModifiers["RightControl"] = false
    GSEOptions.MacroResetModifiers["Control"] = false
    GSEOptions.MacroResetModifiers["LeftShift"] = false
    GSEOptions.MacroResetModifiers["RightShift"] = false
    GSEOptions.MacroResetModifiers["Shift"] = false
    GSEOptions.MacroResetModifiers["LeftAlt"] = false
    GSEOptions.MacroResetModifiers["RightAlt"] = false
    GSEOptions.MacroResetModifiers["AnyMod"] = false
  end

  -- Fix issue where IsAnyShiftKeyDown() was referenced instead of IsShiftKeyDown() #327
  if not GSE.isEmpty(GSEOptions.MacroResetModifiers["AnyShift"]) then
    GSEOptions.MacroResetModifiers["Shift"] = GSEOptions.MacroResetModifiers["AnyShift"]
    GSEOptions.MacroResetModifiers["AnyShift"] = nil
  end
  if not GSE.isEmpty(GSEOptions.MacroResetModifiers["AnyControl"]) then
    GSEOptions.MacroResetModifiers["Control"] = GSEOptions.MacroResetModifiers["AnyControl"]
    GSEOptions.MacroResetModifiers["AnyControl"] = nil
  end
  if not GSE.isEmpty(GSEOptions.MacroResetModifiers["AnyAlt"]) then
    GSEOptions.MacroResetModifiers["Alt"] = GSEOptions.MacroResetModifiers["AnyAlt"]
    GSEOptions.MacroResetModifiers["AnyAlt"] = nil
  end

  -- Added in 2.2
  if GSE.isEmpty(GSEOptions.UseVerboseFormat) then
    GSEOptions.UseVerboseFormat = true
  end
end
local function AFTER_UNIT_SPELLCAST_SUCCEEDED()
	GCD = nil
	GSE.PrintDebugMessage("GCD OFF")
end

local myAceTimer = LibStub("AceTimer-3.0"):Embed(GSE)

function GSE:UNIT_SPELLCAST_SUCCEEDED(event, unit, spell)
  if unit == "player" then
    local _, GCD_Timer = GetSpellCooldown(61304)
    GCD = true
	--local BR = CreateFrame("Frame")
	GCD_Update_Timer=myAceTimer:ScheduleTimer(AFTER_UNIT_SPELLCAST_SUCCEEDED, GCD_Timer)
    --GCD_Update_Timer = C_Timer.After(GCD_Timer, function () GCD = nil; GSE.PrintDebugMessage("GCD OFF") end)
    GSE.PrintDebugMessage("GCD Delay:" .. " " .. GCD_Timer)
    GSE.CurrentGCD = GCD_Timer

    if GSE.RecorderActive then
      GSE.GUIRecordFrame.RecordSequenceBox:SetText(GSE.GUIRecordFrame.RecordSequenceBox:GetText() .. "/cast " .. spell .. "\n")
    end
  end
end

function GSE:PLAYER_REGEN_ENABLED(unit,event,addon)
  GSE:UnregisterEvent('PLAYER_REGEN_ENABLED')
  if GSEOptions.resetOOC then
    GSE.ResetButtons()
  end
  GSE:RegisterEvent('PLAYER_REGEN_ENABLED')
end

local IgnoreMacroUpdates = false

function GSE:PLAYER_LOGOUT()
  GSE.PrepareLogout()
end

function GSE:PLAYER_SPECIALIZATION_CHANGED()
  GSE.ReloadSequences()
end

function GSE:GROUP_ROSTER_UPDATE(...)
  -- Serialisation stuff
  GSE.sendVersionCheck()
  for k,v in pairs(GSE.UnsavedOptions["PartyUsers"]) do
    if not (UnitInParty(k) or UnitInRaid(k)) then
      -- Take them out of the list
      GSE.UnsavedOptions["PartyUsers"][k] = nil
    end

  end
  -- Group Team stuff
  GSE:ZONE_CHANGED_NEW_AREA()
end


GSE:RegisterEvent("GROUP_ROSTER_UPDATE")
GSE:RegisterEvent('PLAYER_LOGOUT')
GSE:RegisterEvent('PLAYER_ENTERING_WORLD')
GSE:RegisterEvent('PLAYER_REGEN_ENABLED')
GSE:RegisterEvent('ADDON_LOADED')
GSE:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED')
GSE:RegisterEvent("ZONE_CHANGED_NEW_AREA")
GSE:RegisterEvent("UNIT_FACTION")
GSE:RegisterEvent("PARTY_MEMBERS_CHANGED")

local function PrintGnomeHelp()
  GSE.Print(L["GnomeSequencer was originally written by semlar of wowinterface.com."], GNOME)
  GSE.Print(L["GSE is a complete rewrite of that addon that allows you create a sequence of macros to be executed at the push of a button."], GNOME)
  GSE.Print(L["Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."], GNOME)
  GSE.Print(L["This version has been modified by TimothyLuke to make the power of GnomeSequencer avaialble to people who are not comfortable with lua programming."], GNOME)
  GSE.Print(L["To get started "] .. GSEOptions.CommandColour .. L["/gs|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."], GNOME)
  GSE.Print(L["The command "] .. GSEOptions.CommandColour .. L["/gs showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."], GNOME)
  GSE.Print(L["The command "] .. GSEOptions.CommandColour .. L["/gs cleanorphans|r will loop through your macros and delete any left over GS-E macros that no longer have a sequence to match them."], GNOME)
  GSE.Print(L["The command "] .. GSEOptions.CommandColour .. L["/gs checkmacrosforerrors|r will loop through your macros and check for corrupt macro versions.  This will then show how to correct these issues."], GNOME)
end

GSE:RegisterChatCommand("gsse", "GSSlash")
---GSE:RegisterChatCommand("gs", "GSSlash")
GSE:RegisterChatCommand("gse", "GSSlash")


-- Functions
--- Handle slash commands
function GSE:GSSlash(input)
  if string.lower(input) == "showspec" then
    local currentSpec = GSE.GetCurrentSpecID()
    local currentSpecID, specname, specicon = GSE.GetCurrentSpecID()
   -- local _, specname, specdescription, specicon, _, specrole, specclass = GetSpecializationInfoByID(currentSpecID)
    GSE.Print(L["Your current Specialisation is "] .. currentSpecID .. ':' .. specname .. L["  The Alternative ClassID is "] .. currentclassId, GNOME)
  elseif string.lower(input) == "help" then
    PrintGnomeHelp()
  elseif string.lower(input) == "cleanorphans" or string.lower(input) == "clean" then
    GSE.CleanOrphanSequences()
  elseif string.lower(input) == "forceclean" then
    GSE.CleanOrphanSequences()
    GSE.CleanMacroLibrary(true)
  elseif string.lower(string.sub(string.lower(input),1,6)) == "export" then
    GSE.Print(GSE.ExportSequence(string.sub(string.lower(input),8)))
  elseif string.lower(input) == "showdebugoutput" then
    StaticPopup_Show ("GS-DebugOutput")
  elseif string.lower(input) == "record" then
    GSE.GUIRecordFrame:Show()
  elseif string.lower(input) == "debug" then
    GSE.GUIShowDebugWindow()
  elseif string.lower(input) == "compilemissingspells" then
    GSE.Print("Compiling Language Table errors.  If the game hangs please be patient.")
    GSE.ReportUnfoundSpells()
    GSE.Print("Language Spells compiled.  Please exit the game and obtain the values from WTF/AccountName/SavedVariables/GSE.lua")
  elseif string.lower(input) == "resetoptions" then
    GSE.SetDefaultOptions()
    GSE.Print(L["Options have been reset to defaults."])
    StaticPopup_Show ("GSE_ConfirmReloadUIDialog")
  elseif string.lower(input) == "updatemacrostrings" then
    -- Convert macros to new format in a one off run.
    GSE.UpdateMacroString()
  elseif string.lower(input) == "movelostmacros" then
    GSE.MoveMacroToClassFromGlobal()
  elseif string.lower(input) == "checkmacrosforerrors" then
    GSE.ScanMacrosForErrors()
  elseif string.lower(input) == "compressstring" then
    GSE.GUICompressFrame:Show()
  else
    GSE.GUIShowViewer()
  end
end

function GSE:processReload(action, arg)
  if arg == "Samples" then
    GSE.LoadSampleMacros(GSE.GetCurrentClassID())
    GSE.Print(L["The Sample Macros have been reloaded."])
  end
end

function GSE:OnEnable()
  GSE.StartOOCTimer()
end

--- Start the OOC Queue Timer
function GSE.StartOOCTimer()
  GSE.OOCTimer = GSE:ScheduleRepeatingTimer("ProcessOOCQueue", 1)
end

--- Stop the OOC Queue Timer
function GSE.StopOOCTimer()
  GSE:CancelTimer(GSE.OOCTimer)
  GSE.OOCTimer = nil
end


function GSE:ProcessOOCQueue()
  for k,v in ipairs(GSE.OOCQueue) do
    if not InCombatLockdown() then
	
      if v.action == "UpdateSequence" then
        GSE.OOCUpdateSequence(v.name, v.macroversion)
      elseif v.action == "Save" then
        GSE.OOCAddSequenceToCollection(v.sequencename, v.sequence, v.classid)
      elseif v.action == "Replace" then
	 DEFAULT_CHAT_FRAME:AddMessage("classid"..v.classid)
	 DEFAULT_CHAT_FRAME:AddMessage("sequencename"..v.sequencename)
        if GSELibrary[v.classid][v.sequencename]==nil then
          GSELibrary[v.classid][v.sequencename]=''
        end
        if (GSE.isEmpty(GSELibrary[v.classid][v.sequencename])) then
          GSE.OOCAddSequenceToCollection(v.sequencename, v.sequence, v.classid)
        else
          GSELibrary[v.classid][v.sequencename] = v.sequence
        end
        GSE.OOCUpdateSequence(v.sequencename, v.sequence.MacroVersions[GSE.GetActiveSequenceVersion(v.sequencename)])
      elseif v.action == "openviewer" then
        GSE.GUIShowViewer()
      elseif v.action == "CheckMacroCreated" then
        GSE.OOCCheckMacroCreated(v.sequencename, v.create)
      end
      GSE.OOCQueue[k] = nil
    end
  end
end

function GSE.prepareTooltipOOCLine(tooltip, OOCEvent, row, oockey)
  tooltip:SetCell(row, 1, L[OOCEvent.action], "LEFT", 1)
  if OOCEvent.action == "UpdateSequence" then
    tooltip:SetCell(row, 3, OOCEvent.name, "RIGHT", 1)
  elseif OOCEvent.action == "Save" then
    tooltip:SetCell(row, 3, OOCEvent.sequencename, "RIGHT", 1)
  elseif OOCEvent.action == "Replace" then
    tooltip:SetCell(row, 3, OOCEvent.sequencename, "RIGHT", 1)
  elseif OOCEvent.action == "CheckMacroCreated" then
    tooltip:SetCell(row, 3, OOCEvent.sequencename, "RIGHT", 1)
  end
  tooltip:SetLineScript(row, "OnMouseUp", function ()
    GSE.OOCQueue[oockey] = nil
  end)
end

function GSE.CheckOOCQueueStatus()
  local output = ""
  if GSE.isEmpty(GSE.OOCTimer) then
    output = GSEOptions.UNKNOWN .. L["Paused"] .. Statics.StringReset
  else
    if InCombatLockdown() then
      output = GSEOptions.TitleColour .. L["Paused - In Combat"] .. Statics.StringReset
    else
      output = GSEOptions.CommandColour .. L["Running"] .. Statics.StringReset
    end
  end
  return output
end

function GSE.ToggleOOCQueue()
  if GSE.isEmpty(GSE.OOCTimer) then
    GSE.StartOOCTimer()
  else
    GSE.StopOOCTimer()
  end
end
