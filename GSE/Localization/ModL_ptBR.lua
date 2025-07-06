
if not(GetLocale() == "ptBR") then
    return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("GSE", "ptBR")

-- Options translation
L["  The Alternative ClassID is "] = "  O ClassID alternativa é "
--Translation missing 
-- L[" Deleted Orphaned Macro "] = ""
L[" from "] = "de"
L[" has been added as a new version and set to active.  Please review if this is as expected."] = "foi adicionado como uma nova versão e definido como ativo. Por favor, verifique se isso é como esperado."
L[" is not available.  Unable to translate sequence "] = "não está disponível. Incapaz de traduzir sequência"
L[" macros per Account.  You currently have "] = "Macros por conta. Você já as tem atualmente"
L[" macros per character.  You currently have "] = "macros por personagem. Você já as tem atualmente"
L[" saved as version "] = "salva como versão"
L[" sent"] = "enviado"
L[" tried to overwrite the version already loaded from "] = "você tentou substituir uma versão que já foi carregada."
L[" was imported with the following errors."] = "foi importado com os seguintes erros"
L[". This version was not loaded."] = "Esta versão não pode ser carregada."
L["/gs |r to get started."] = "/gs |r está iniciando."
--Translation missing 
-- L["/gs checkmacrosforerrors|r will loop through your macros and check for corrupt macro versions.  This will then show how to correct these issues."] = ""
L["/gs cleanorphans|r will loop through your macros and delete any left over GS-E macros that no longer have a sequence to match them."] = [=[
/ Gs cleanorphans | r fará um loop em suas macros e excluirá qualquer macros do GS-E que não têm uma sequência para combiná-los.]=]
L["/gs help|r to get started."] = "/gs help|r para iniciar."
L["/gs listall|r will produce a list of all available macros with some help information."] = "/gs listall|r irá produzir uma lista com todas as macros disponíveis com algumas informações de ajuda."
L["/gs showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."] = "/ Gs showspec | r irá mostrar a sua especialização atual eo SPECID necessário para marcar quaisquer macros existentes"
L["/gs|r again."] = "/gs|r novamente"
L["/gs|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."] = "/ Gs | r irá listar todos os macros disponíveis para a sua especialização. Isso também irá adicionar quaisquer macros disponíveis para sua especificação atual para a interface macro."
L[":|r The Sequence Translator allows you to use GS-E on other languages than enUS.  It will translate sequences to match your language.  If you also have the Sequence Editor you can translate sequences between languages.  The GS-E Sequence Translator is available on curse.com"] = ": | R The Translator Sequence permite que você use GS-E em outros idiomas além do enUS. Ele irá traduzir sequências para combinar seu idioma. Se você também tem a Sequence Editor você pode traduzir sequências entre as línguas. O GS-E Sequence Translator é acessível em curse.com"
L[":|r To get started "] = ":|r para iniciar"
L[":|r You cannot delete the only copy of a sequence."] = "Você não pode excluir a única cópia de uma sequência."
L[":|r Your current Specialisation is "] = ":|r Sua especialização atual é "
--Translation missing 
-- L["|cffff0000GS-E:|r Gnome Sequencer - Enhanced Options"] = ""
--Translation missing 
-- L["|r Incomplete Sequence Definition - This sequence has no further information "] = ""
--Translation missing 
-- L["|r.  As a result this macro was not created.  Please delete some macros and reenter "] = ""
--Translation missing 
-- L["|r.  You can also have a  maximum of "] = ""
--Translation missing 
-- L["<DEBUG> |r "] = ""
--Translation missing 
-- L["<SEQUENCEDEBUG> |r "] = ""
--Translation missing 
-- L["A new version of %s has been added."] = ""
L["A sequence collision has occured. "] = "Ocorreu um erro de colisão na sequência."
L["A sequence collision has occured.  Extra versions of this macro have been loaded.  Manage the sequence to determine how to use them "] = "Ocorreu uma colisão de sequência. Versões extras desta macro foram carregadas. Gerencie a seqüência para determinar como usá-las."
L["A sequence collision has occured.  Your local version of "] = "Ocorreu uma colisão na sequência. Sua versão local é"
L["Actions"] = "Ações"
L["Active Version: "] = "Versão Ativa:"
--Translation missing 
-- L["Addin Version %s contained versions for the following macros:"] = ""
--Translation missing 
-- L["Alt Keys."] = ""
--Translation missing 
-- L["Any Alt Key"] = ""
--Translation missing 
-- L["Any Control Key"] = ""
--Translation missing 
-- L["Any Shift Key"] = ""
L["Are you sure you want to delete %s?  This will delete the macro and all versions.  This action cannot be undone."] = "Tem certeza de que deseja excluir % s? Isso excluirá a macro e todas as versões. Essa ação não poderá ser desfeita."
--Translation missing 
-- L["As GS-E is updated, there may be left over macros that no longer relate to sequences.  This will check for these automatically on logout.  Alternatively this check can be run via /gs cleanorphans"] = ""
L["Author"] = "Autor"
L["Author Colour"] = "Cor do Autor"
--Translation missing 
-- L["Auto Create Class Macro Stubs"] = ""
--Translation missing 
-- L["Auto Create Global Macro Stubs"] = ""
--Translation missing 
-- L["Automatically Create Macro Icon"] = ""
L["Available Addons"] = "Addons Disponíveis"
L["Belt"] = "Cinto"
L["Blizzard Functions Colour"] = "Funções de Cores da Blizzard"
--Translation missing 
-- L["By setting the default Icon for all macros to be the QuestionMark, the macro button on your toolbar will change every key hit."] = ""
--Translation missing 
-- L["By setting this value the Sequence Editor will show every macro for every class."] = ""
--Translation missing 
-- L["By setting this value the Sequence Editor will show every macro for your class.  Turning this off will only show the class macros for your current specialisation."] = ""
L["Cancel"] = "Cancelar"
--Translation missing 
-- L["CheckMacroCreated"] = ""
--Translation missing 
-- L["Choose Language"] = ""
--Translation missing 
-- L["Classwide Macro"] = ""
L["Clear"] = "Limpar"
L["Clear Errors"] = "Limpar Erros"
L["Close"] = "Fechar"
--Translation missing 
-- L["Close to Maximum Macros.|r  You can have a maximum of "] = ""
--Translation missing 
-- L["Close to Maximum Personal Macros.|r  You can have a maximum of "] = ""
--Translation missing 
-- L["Colour"] = ""
--Translation missing 
-- L["Colour and Accessibility Options"] = ""
L["Combat"] = "Combate"
L["Command Colour"] = "Cor do Comando"
L["Completely New GS Macro."] = "Nova GS Macro Finalizada."
L["Conditionals Colour"] = "Cor Condicional"
L["Configuration"] = "Configuração"
L["Contributed by: "] = "Contribuição de:"
--Translation missing 
-- L["Control Keys."] = ""
--Translation missing 
-- L["Copy this link and open it in a Browser."] = ""
--Translation missing 
-- L["Create buttons for Global Macros"] = ""
L["Create Icon"] = "Criar Ícone"
L["Create Macro"] = "Criar Macro"
--Translation missing 
-- L["Creating New Sequence."] = ""
L["Debug"] = "Depurar"
--Translation missing 
-- L["Debug Mode Options"] = ""
--Translation missing 
-- L["Debug Output Options"] = ""
--Translation missing 
-- L["Debug Sequence Execution"] = ""
--Translation missing 
-- L["Default Version"] = ""
L["Delete"] = "Deletar"
L["Delete Icon"] = "Deletar  Ícone"
--Translation missing 
-- L["Delete Orphaned Macros on Logout"] = ""
--Translation missing 
-- L["Delete Version"] = ""
--Translation missing 
-- L["Different helpTxt"] = ""
L["Disable"] = "Desabilitar"
L["Disable Sequence"] = "Desabilitar seqüência"
--Translation missing 
-- L["Display debug messages in Chat Window"] = ""
--Translation missing 
-- L["Dungeon"] = ""
L["Edit"] = "Editar"
L["Editor Colours"] = "Editor de Cores"
--Translation missing 
-- L["Emphasis Colour"] = ""
L["Enable"] = "Habilitar"
--Translation missing 
-- L["Enable Debug for the following Modules"] = ""
--Translation missing 
-- L["Enable Mod Debug Mode"] = ""
--Translation missing 
-- L["Enable Sequence"] = ""
--Translation missing 
-- L["Error found in version %i of %s."] = ""
L["Export"] = "Exportar"
--Translation missing 
-- L["Export a Sequence"] = ""
--Translation missing 
-- L["Filter Macro Selection"] = ""
--Translation missing 
-- L["Finished scanning for errors.  If no other messages then no errors were found."] = ""
--Translation missing 
-- L["FYou cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = ""
--Translation missing 
-- L["Gameplay Options"] = ""
L["General"] = "Geral"
L["General Options"] = "Opções Gerais"
--Translation missing 
-- L["Global Macros are those that are valid for all classes.  GSE2 also imports unknown macros as Global.  This option will create a button for these macros so they can be called for any class.  Having all macros in this space is a performance loss hence having them saved with a the right specialisation is important."] = ""
--Translation missing 
-- L["Gnome Sequencer: Export a Sequence String."] = ""
--Translation missing 
-- L["Gnome Sequencer: Import a Macro String."] = ""
--Translation missing 
-- L["Gnome Sequencer: Record your rotation to a macro."] = ""
--Translation missing 
-- L["Gnome Sequencer: Sequence Debugger. Monitor the Execution of your Macro"] = ""
--Translation missing 
-- L["Gnome Sequencer: Sequence Editor."] = ""
--Translation missing 
-- L["Gnome Sequencer: Sequence Version Manager"] = ""
--Translation missing 
-- L["Gnome Sequencer: Sequence Viewer"] = ""
--Translation missing 
-- L["GnomeSequencer was originally written by semlar of wowinterface.com."] = ""
--Translation missing 
-- L["GnomeSequencer-Enhanced"] = ""
L["GnomeSequencer-Enhanced loaded.|r  Type "] = "GnomeSequencer-Enhanced carregado.|r  Digitar "
--Translation missing 
-- L["GSE"] = ""
--Translation missing 
-- L["GSE allows plugins to load Macro Collections as plugins.  You can reload a collection by pressing the button below."] = ""
--Translation missing 
-- L["GS-E can save all macros or only those versions that you have created locally.  Turning this off will cache all macros in your WTF\\GS-Core.lua variables file but will increase load times and potentially cause colissions."] = ""
--Translation missing 
-- L["GSE has a LibDataBroker (LDB) data feed.  List Other GSE Users and their version when in a group on the tooltip to this feed."] = ""
--Translation missing 
-- L["GSE has a LibDataBroker (LDB) data feed.  Set this option to show queued Out of Combat events in the tooltip."] = ""
--Translation missing 
-- L["GSE is a complete rewrite of that addon that allows you create a sequence of macros to be executed at the push of a button."] = ""
--Translation missing 
-- L["GSE is out of date. You can download the newest version from https://mods.curse.com/addons/wow/gnomesequencer-enhanced."] = ""
--Translation missing 
-- L["GSE Macro"] = ""
--Translation missing 
-- L["GS-E Plugins"] = ""
--Translation missing 
-- L["GSE Users"] = ""
--Translation missing 
-- L["GSE Version: %s"] = ""
--Translation missing 
-- L["GSE: Left Click to open the Sequence Editor"] = ""
--Translation missing 
-- L["GS-E: Left Click to open the Sequence Editor"] = ""
--Translation missing 
-- L["GSE: Middle Click to open the Transmission Interface"] = ""
--Translation missing 
-- L["GS-E: Middle Click to open the Transmission Interface"] = ""
--Translation missing 
-- L["GSE: Right Click to open the Sequence Debugger"] = ""
--Translation missing 
-- L["GS-E: Right Click to open the Sequence Debugger"] = ""
L["Head"] = "Cabeça"
L["Help Colour"] = "Ajuda de Cores"
L["Help Information"] = "Informações de Ajuda"
L["Help Link"] = "Link de Ajuda"
L["Help URL"] = "Ajuda URL"
--Translation missing 
-- L["Heroic"] = ""
--Translation missing 
-- L["Hide Login Message"] = ""
--Translation missing 
-- L["Hides the message that GSE is loaded."] = ""
L["Icon Colour"] = "Cor do Ícone"
--Translation missing 
-- L["If you load Gnome Sequencer - Enhanced and the Sequence Editor and want to create new macros from scratch, this will enable a first cut sequenced template that you can load into the editor as a starting point.  This enables a Hello World macro called Draik01.  You will need to do a /console reloadui after this for this to take effect."] = ""
L["Import"] = "Importar"
--Translation missing 
-- L["Import Macro from Forums"] = ""
--Translation missing 
-- L["Imported new sequence "] = ""
--Translation missing 
-- L["Incorporate the belt slot into the KeyRelease. This is the equivalent of /use [combat] 5 in a KeyRelease."] = ""
--Translation missing 
-- L["Incorporate the first ring slot into the KeyRelease. This is the equivalent of /use [combat] 11 in a KeyRelease."] = ""
--Translation missing 
-- L["Incorporate the first trinket slot into the KeyRelease. This is the equivalent of /use [combat] 13 in a KeyRelease."] = ""
--Translation missing 
-- L["Incorporate the Head slot into the KeyRelease. This is the equivalent of /use [combat] 1 in a KeyRelease."] = ""
--Translation missing 
-- L["Incorporate the neck slot into the KeyRelease. This is the equivalent of /use [combat] 2 in a KeyRelease."] = ""
--Translation missing 
-- L["Incorporate the second ring slot into the KeyRelease. This is the equivalent of /use [combat] 12 in a KeyRelease."] = ""
--Translation missing 
-- L["Incorporate the second trinket slot into the KeyRelease. This is the equivalent of /use [combat] 14 in a KeyRelease."] = ""
--Translation missing 
-- L["Inner Loop End"] = ""
--Translation missing 
-- L["Inner Loop Limit"] = ""
--Translation missing 
-- L["Inner Loop Start"] = ""
--Translation missing 
-- L["KeyPress"] = ""
--Translation missing 
-- L["KeyRelease"] = ""
--Translation missing 
-- L["Language"] = ""
--Translation missing 
-- L["Language Colour"] = ""
--Translation missing 
-- L["Left Alt Key"] = ""
--Translation missing 
-- L["Left Control Key"] = ""
--Translation missing 
-- L["Left Mouse Button"] = ""
--Translation missing 
-- L["Left Shift Key"] = ""
--Translation missing 
-- L["Legacy GS/GSE1 Macro"] = ""
--Translation missing 
-- L["Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."] = ""
L["Load"] = "Carregar"
L["Load Sequence"] = "Carregar Seqüência"
--Translation missing 
-- L["Macro Collection to Import."] = ""
--Translation missing 
-- L["Macro found by the name %sWW%s. Rename this macro to a different name to be able to use it.  WOW has a hidden button called WW that is executed instead of this macro."] = ""
--Translation missing 
-- L["Macro Icon"] = ""
--Translation missing 
-- L["Macro Import Successful."] = ""
--Translation missing 
-- L["Macro Reset"] = ""
--Translation missing 
-- L["Macro unable to be imported."] = ""
--Translation missing 
-- L["Macro Version %d deleted."] = ""
--Translation missing 
-- L["Make Active"] = ""
--Translation missing 
-- L["Manage Versions"] = ""
--Translation missing 
-- L["Matching helpTxt"] = ""
--Translation missing 
-- L["Middle Mouse Button"] = ""
--Translation missing 
-- L["Mouse Button 4"] = ""
--Translation missing 
-- L["Mouse Button 5"] = ""
--Translation missing 
-- L["Mouse Buttons."] = ""
--Translation missing 
-- L["Moved %s to class %s."] = ""
L["Mythic"] = "Mítico"
L["Neck"] = "Colar"
L["New"] = "Novo"
L["No"] = "Não"
L["No Active Version"] = "Versão não ativada."
L["No Help Information "] = "Sem Informações de Ajuda"
L["No Help Information Available"] = "Sem Informações de Ajuda Disponíveis"
--Translation missing 
-- L["No Sequences present so none displayed in the list."] = ""
--Translation missing 
-- L["Normal Colour"] = ""
--Translation missing 
-- L["Only Save Local Macros"] = ""
--Translation missing 
-- L["openviewer"] = ""
L["Options"] = "Opções"
--Translation missing 
-- L["Options have been reset to defaults."] = ""
L["Output"] = "Saída"
--Translation missing 
-- L["Output the action for each button press to verify StepFunction and spell availability."] = ""
L["Pause"] = "Pausa"
--Translation missing 
-- L["Paused"] = ""
--Translation missing 
-- L["Paused - In Combat"] = ""
--Translation missing 
-- L["Picks a Custom Colour for emphasis."] = ""
--Translation missing 
-- L["Picks a Custom Colour for the Author."] = ""
--Translation missing 
-- L["Picks a Custom Colour for the Commands."] = ""
--Translation missing 
-- L["Picks a Custom Colour for the Mod Names."] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for braces and indents."] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for Icons."] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for language descriptors"] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for macro conditionals eg [mod:shift]"] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for Macro Keywords like /cast and /target"] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for numbers."] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for Spells and Abilities."] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for StepFunctions."] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for strings."] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used for unknown terms."] = ""
--Translation missing 
-- L["Picks a Custom Colour to be used normally."] = ""
--Translation missing 
-- L["Please wait till you have left combat before using the Sequence Editor."] = ""
--Translation missing 
-- L["Plugins"] = ""
--Translation missing 
-- L["PostMacro"] = ""
--Translation missing 
-- L["PreMacro"] = ""
--Translation missing 
-- L["Prevent Sound Errors"] = ""
--Translation missing 
-- L["Prevent UI Errors"] = ""
--Translation missing 
-- L["Print KeyPress Modifiers on Click"] = ""
--Translation missing 
-- L["Print to the chat window if the alt, shift, control modifiers as well as the button pressed on each macro keypress."] = ""
--Translation missing 
-- L["Priority List (1 12 123 1234)"] = ""
--Translation missing 
-- L["PVP"] = ""
--Translation missing 
-- L["PVP setting changed to Default."] = ""
L["Raid"] = "Raide"
--Translation missing 
-- L["Ready to Send"] = ""
L["Received Sequence "] = "Seqüência Recebida"
L["Record"] = "Gravada"
L["Record Macro"] = "Macro Gravada"
L["Registered Addons"] = "Addons Registrados"
--Translation missing 
-- L["Replace"] = ""
--Translation missing 
-- L["Require Target to use"] = ""
--Translation missing 
-- L["Reset Macro when out of combat"] = ""
L["Resets"] = "Reiniciar"
--Translation missing 
-- L["Resets macros back to the initial state when out of combat."] = ""
L["Resume"] = "Resumo"
--Translation missing 
-- L["Right Alt Key"] = ""
--Translation missing 
-- L["Right Control Key"] = ""
--Translation missing 
-- L["Right Mouse Button"] = ""
--Translation missing 
-- L["Right Shift Key"] = ""
L["Ring 1"] = "Anel 1"
L["Ring 2"] = "Anel 2"
--Translation missing 
-- L["Running"] = ""
L["Save"] = "Salvar"
--Translation missing 
-- L["Seed Initial Macro"] = ""
--Translation missing 
-- L["Select Other Version"] = ""
L["Send"] = "Enviar"
L["Send To"] = "Enviar Para"
L["Sequence"] = "Seqüência"
--Translation missing 
-- L["Sequence %s saved."] = ""
--Translation missing 
-- L["Sequence Author set to Unknown"] = ""
--Translation missing 
-- L["Sequence Debugger"] = ""
--Translation missing 
-- L["Sequence Editor"] = ""
--Translation missing 
-- L["Sequence Name"] = ""
--Translation missing 
-- L["Sequence Saved as version "] = ""
--Translation missing 
-- L["Sequence specID set to current spec of "] = ""
--Translation missing 
-- L["Sequence Viewer"] = ""
--Translation missing 
-- L["Sequential (1 2 3 4)"] = ""
--Translation missing 
-- L["Set Default Icon QuestionMark"] = ""
--Translation missing 
-- L["Shift Keys."] = ""
--Translation missing 
-- L["Show All Macros in Editor"] = ""
--Translation missing 
-- L["Show Class Macros in Editor"] = ""
--Translation missing 
-- L["Show Global Macros in Editor"] = ""
--Translation missing 
-- L["Show GSE Users in LDB"] = ""
--Translation missing 
-- L["Show OOC Queue in LDB"] = ""
--Translation missing 
-- L["Source Language "] = ""
--Translation missing 
-- L["Specialisation / Class ID"] = ""
--Translation missing 
-- L["Specialization Specific Macro"] = ""
--Translation missing 
-- L["SpecID/ClassID Colour"] = ""
--Translation missing 
-- L["Spell Colour"] = ""
--Translation missing 
-- L["Step Function"] = ""
--Translation missing 
-- L["Step Functions"] = ""
L["Stop"] = "Parar"
--Translation missing 
-- L["Store Debug Messages"] = ""
--Translation missing 
-- L["Store output of debug messages in a Global Variable that can be referrenced by other mods."] = ""
--Translation missing 
-- L["String Colour"] = ""
L["Talents"] = "Talentos"
L["Target"] = "Alvo"
L["Target language "] = "Linguagem do Alvo"
--Translation missing 
-- L["The command "] = ""
--Translation missing 
-- L["The Custom StepFunction Specified is not recognised and has been ignored."] = ""
--Translation missing 
-- L["The GSE Out of Combat queue is %s"] = ""
--Translation missing 
-- L["The Macro Translator will translate an English sequence to your local language for execution.  It can also be used to translate a sequence into a different language.  It is also used for syntax based colour markup of Sequences in the editor."] = ""
--Translation missing 
-- L["The Sample Macros have been reloaded."] = ""
--Translation missing 
-- L["The Sequence Editor can attempt to parse the Sequences, KeyPress and KeyRelease in realtime.  This is still experimental so can be turned off."] = ""
--Translation missing 
-- L["The Sequence Editor is an addon for GnomeSequencer-Enhanced that allows you to view and edit Sequences in game.  Type "] = ""
--Translation missing 
-- L["There are %i events in out of combat queue"] = ""
--Translation missing 
-- L["There are no events in out of combat queue"] = ""
--Translation missing 
-- L["There are No Macros Loaded for this class.  Would you like to load the Sample Macro?"] = ""
--Translation missing 
-- L["There is an issue with sequence %s.  It has not been loaded to prevent the mod from failing."] = ""
--Translation missing 
-- L["These options combine to allow you to reset a macro while it is running.  These options are Cumulative ie they add to each other.  Options Like LeftClick and RightClick won't work together very well."] = ""
--Translation missing 
-- L["This change will not come into effect until you save this macro."] = ""
--Translation missing 
-- L["This function will update macro stubs to support listening to the options below.  This is required to be completed 1 time per character."] = ""
--Translation missing 
-- L["This is a small addon that allows you create a sequence of macros to be executed at the push of a button."] = ""
--Translation missing 
-- L["This is the only version of this macro.  Delete the entire macro to delete this version."] = ""
--Translation missing 
-- L["This option clears errors and stack traces ingame.  This is the equivalent of /run UIErrorsFrame:Clear() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = ""
--Translation missing 
-- L["This option dumps extra trace information to your chat window to help troubleshoot problems with the mod"] = ""
--Translation missing 
-- L["This option hide error sounds like \"That is out of range\" from being played while you are hitting a GS Macro.  This is the equivalent of /console Sound_EnableErrorSpeech lines within a Sequence.  Turning this on will trigger a Scam warning about running custom scripts."] = ""
--Translation missing 
-- L["This option hides text error popups and dialogs and stack traces ingame.  This is the equivalent of /script UIErrorsFrame:Hide() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = ""
--Translation missing 
-- L["This option prevents macros firing unless you have a target. Helps reduce mistaken targeting of other mobs/groups when your target dies."] = ""
--Translation missing 
-- L["This Sequence was exported from GSE %s."] = ""
--Translation missing 
-- L["This shows the Global Macros available as well as those for your class."] = ""
--Translation missing 
-- L["This version has been modified by TimothyLuke to make the power of GnomeSequencer avaialble to people who are not comfortable with lua programming."] = ""
--Translation missing 
-- L["This will display debug messages for the "] = ""
--Translation missing 
-- L["This will display debug messages for the GS-E Ingame Transmission and transfer"] = ""
--Translation missing 
-- L["This will display debug messages in the Chat window."] = ""
--Translation missing 
-- L["Title Colour"] = ""
--Translation missing 
-- L["To correct this either delete the version via the GSE Editor or enter the following command to delete this macro totally.  %s/run GSE.DeleteSequence (%i, %s)%s"] = ""
--Translation missing 
-- L["To get started "] = ""
--Translation missing 
-- L["To use a macro, open the macros interface and create a macro with the exact same name as one from the list.  A new macro with two lines will be created and place this on your action bar."] = ""
--Translation missing 
-- L["Translate to"] = ""
--Translation missing 
-- L["Translated Sequence"] = ""
L["Trinket 1"] = "Berloque 1"
L["Trinket 2"] = "Berloque 2"
--Translation missing 
-- L["Two sequences with unknown sources found."] = ""
--Translation missing 
-- L["Unknown Author|r "] = ""
--Translation missing 
-- L["Unknown Colour"] = ""
--Translation missing 
-- L["Update"] = ""
--Translation missing 
-- L["Update Macro Stubs"] = ""
--Translation missing 
-- L["Update Macro Stubs."] = ""
--Translation missing 
-- L["UpdateSequence"] = ""
--Translation missing 
-- L["Updating due to new version."] = ""
L["Use"] = "Usar"
--Translation missing 
-- L["Use Belt Item in KeyRelease"] = ""
--Translation missing 
-- L["Use First Ring in KeyRelease"] = ""
--Translation missing 
-- L["Use First Trinket in KeyRelease"] = ""
--Translation missing 
-- L["Use Global Account Macros"] = ""
--Translation missing 
-- L["Use Head Item in KeyRelease"] = ""
--Translation missing 
-- L["Use Macro Translator"] = ""
--Translation missing 
-- L["Use Neck Item in KeyRelease"] = ""
--Translation missing 
-- L["Use Realtime Parsing"] = ""
--Translation missing 
-- L["Use Second Ring in KeyRelease"] = ""
--Translation missing 
-- L["Use Second Trinket in KeyRelease"] = ""
L["Version="] = "Versão="
--Translation missing 
-- L["When creating a macro, if there is not a personal character macro space, create an account wide macro."] = ""
--Translation missing 
-- L["When loading or creating a sequence, if it is a global or the macro has an unknown specID automatically create the Macro Stub in Account Macros"] = ""
--Translation missing 
-- L["When loading or creating a sequence, if it is a macro of the same class automatically create the Macro Stub"] = ""
L["Yes"] = "Sim"
--Translation missing 
-- L["You cannot delete the Default version of this macro.  Please choose another version to be the Default on the Configuration tab."] = ""
--Translation missing 
-- L["You cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = ""
--Translation missing 
-- L["You need to reload the User Interface for the change in StepFunction to take effect.  Would you like to do this now?"] = ""
--Translation missing 
-- L["You need to reload the User Interface to complete this task.  Would you like to do this now?"] = ""
--Translation missing 
-- L["Your current Specialisation is "] = ""



