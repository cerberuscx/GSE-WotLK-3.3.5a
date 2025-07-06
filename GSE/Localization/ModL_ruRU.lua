
if not(GetLocale() == "ruRU") then
    return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("GSE", "ruRU")

-- Options translation
L["  The Alternative ClassID is "] = "Альтернативный ClassID "
L[" Deleted Orphaned Macro "] = "Удаленный Осиротевший Макрос"
--Translation missing 
-- L[" from "] = ""
L[" has been added as a new version and set to active.  Please review if this is as expected."] = "Была добавлена ​​как новая версия и активирована.  Проверьте, соответствует ли это требованиям."
L[" is not available.  Unable to translate sequence "] = "недоступно. Невозможно перевести последовательность"
L[" macros per Account.  You currently have "] = "макросов на Учетной записи.  В настоящее время у вас есть"
L[" macros per character.  You currently have "] = "макросов на персонаже.  В настоящее время у вас есть"
L[" saved as version "] = "сохранено как версия"
L[" sent"] = "послать"
L[" tried to overwrite the version already loaded from "] = "попытался перезаписать версию, уже загруженную из"
L[" was imported with the following errors."] = "был импортирован со следующими ошибками."
L[". This version was not loaded."] = ". Эта версия не была загружена."
L["/gs |r to get started."] = "/gs |r для запуска."
L["/gs checkmacrosforerrors|r will loop through your macros and check for corrupt macro versions.  This will then show how to correct these issues."] = "/gs checkmacrosforerrors | r перебирает ваши макросы и проверяет наличие поврежденные версий макросов. Эта команда покажет, как исправить проблемы."
--Translation missing 
-- L["/gs cleanorphans|r will loop through your macros and delete any left over GS-E macros that no longer have a sequence to match them."] = ""
--Translation missing 
-- L["/gs help|r to get started."] = ""
--Translation missing 
-- L["/gs listall|r will produce a list of all available macros with some help information."] = ""
--Translation missing 
-- L["/gs showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."] = ""
L["/gs|r again."] = "/gs|r снова."
--Translation missing 
-- L["/gs|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."] = ""
L[":|r The Sequence Translator allows you to use GS-E on other languages than enUS.  It will translate sequences to match your language.  If you also have the Sequence Editor you can translate sequences between languages.  The GS-E Sequence Translator is available on curse.com"] = ":|r Sequence Translator позволяет вам использовать GS-E на других языках, кроме enUS.  Он будет переводить последовательности, соответствующие вашему языку.  Если у вас также есть редактор последовательностей, вы можете переводить последовательности между языками.  Переводчик последовательностей GS-E доступен на curse.com"
--Translation missing 
-- L[":|r To get started "] = ""
--Translation missing 
-- L[":|r You cannot delete the only copy of a sequence."] = ""
--Translation missing 
-- L[":|r Your current Specialisation is "] = ""
L["|cffff0000GS-E:|r Gnome Sequencer - Enhanced Options"] = "|cffff0000GS-E:|r Gnome Sequencer - Расширенные Возможности."
--Translation missing 
-- L["|r Incomplete Sequence Definition - This sequence has no further information "] = ""
--Translation missing 
-- L["|r.  As a result this macro was not created.  Please delete some macros and reenter "] = ""
--Translation missing 
-- L["|r.  You can also have a  maximum of "] = ""
L["<DEBUG> |r "] = "<DEBUG> |r "
L["<SEQUENCEDEBUG> |r "] = "<SEQUENCEDEBUG> |r"
L["A new version of %s has been added."] = "Добавлена ​​новая версия %s."
--Translation missing 
-- L["A sequence collision has occured. "] = ""
--Translation missing 
-- L["A sequence collision has occured.  Extra versions of this macro have been loaded.  Manage the sequence to determine how to use them "] = ""
--Translation missing 
-- L["A sequence collision has occured.  Your local version of "] = ""
L["Actions"] = "Действия"
--Translation missing 
-- L["Active Version: "] = ""
--Translation missing 
-- L["Addin Version %s contained versions for the following macros:"] = ""
L["Alt Keys."] = "Клавиши Alt."
L["Any Alt Key"] = "Любая Клавиша Alt"
L["Any Control Key"] = "Любая Клавиша Ctrl "
L["Any Shift Key"] = "Любая Клавиша Shift"
L["Are you sure you want to delete %s?  This will delete the macro and all versions.  This action cannot be undone."] = "Вы действительно хотите удалить %s? Это приведет к удалению макроса и всех его версий. Это действие нельзя отменить."
L["As GS-E is updated, there may be left over macros that no longer relate to sequences.  This will check for these automatically on logout.  Alternatively this check can be run via /gs cleanorphans"] = "После обновления GS-E, могут остаться макросы, которые больше не относятся к последовательностям. Проверка будет происходить автоматически при выходе. Также такая проверка может быть проведена через /gs cleanorphans "
L["Author"] = "Автор"
L["Author Colour"] = "Цвет Автора"
--Translation missing 
-- L["Auto Create Class Macro Stubs"] = ""
--Translation missing 
-- L["Auto Create Global Macro Stubs"] = ""
L["Automatically Create Macro Icon"] = "Автоматически создавать иконку макроса"
L["Available Addons"] = "Доступные Модификации"
L["Belt"] = "Пояс"
--Translation missing 
-- L["Blizzard Functions Colour"] = ""
L["By setting the default Icon for all macros to be the QuestionMark, the macro button on your toolbar will change every key hit."] = "Иконка макроса на панели действий будет изменяться после каждого нажатия клавиши, по умолчанию для всех макросов установлен значок QuestionMark."
L["By setting this value the Sequence Editor will show every macro for every class."] = "Установив это значение, Sequence Editor покажет каждый макрос для каждого класса."
L["By setting this value the Sequence Editor will show every macro for your class.  Turning this off will only show the class macros for your current specialisation."] = "Установив это значение, Sequence Editor отобразит каждый макрос для вашего класса. Если вы отключите это, будут отображаться только макросы класса для вашей текущей специализации."
L["Cancel"] = "Отменить"
--Translation missing 
-- L["CheckMacroCreated"] = ""
L["Choose Language"] = "Выберите Язык"
--Translation missing 
-- L["Classwide Macro"] = ""
L["Clear"] = "Очистить"
L["Clear Errors"] = "Очистить Ошибки"
L["Close"] = "Закрыть"
--Translation missing 
-- L["Close to Maximum Macros.|r  You can have a maximum of "] = ""
--Translation missing 
-- L["Close to Maximum Personal Macros.|r  You can have a maximum of "] = ""
L["Colour"] = "Цвет"
L["Colour and Accessibility Options"] = "Параметры цвета и специальных возможностей"
L["Combat"] = "Бой"
--Translation missing 
-- L["Command Colour"] = ""
--Translation missing 
-- L["Completely New GS Macro."] = ""
--Translation missing 
-- L["Conditionals Colour"] = ""
L["Configuration"] = "Конфигурации"
--Translation missing 
-- L["Contributed by: "] = ""
L["Control Keys."] = "Клавиши Control."
--Translation missing 
-- L["Copy this link and open it in a Browser."] = ""
--Translation missing 
-- L["Create buttons for Global Macros"] = ""
L["Create Icon"] = "Создать иконку"
L["Create Macro"] = "Создать Макрос"
--Translation missing 
-- L["Creating New Sequence."] = ""
L["Debug"] = "Отладка"
L["Debug Mode Options"] = "Параметры Режима Отладки"
--Translation missing 
-- L["Debug Output Options"] = ""
--Translation missing 
-- L["Debug Sequence Execution"] = ""
L["Default Version"] = "По Умолчанию"
L["Delete"] = "Удалить"
L["Delete Icon"] = "Удалить иконку"
--Translation missing 
-- L["Delete Orphaned Macros on Logout"] = ""
L["Delete Version"] = "Удалить версию"
--Translation missing 
-- L["Different helpTxt"] = ""
L["Disable"] = "Отключить"
--Translation missing 
-- L["Disable Sequence"] = ""
L["Display debug messages in Chat Window"] = "Отображение отладочных сообщений в окне чата"
L["Dungeon"] = "Обычный режим"
L["Edit"] = "Редактировать"
L["Editor Colours"] = "Цвета Редактора"
--Translation missing 
-- L["Emphasis Colour"] = ""
L["Enable"] = "Включить"
L["Enable Debug for the following Modules"] = "Включить отладку по следующим модулям"
L["Enable Mod Debug Mode"] = "Включите Режим Отладки"
--Translation missing 
-- L["Enable Sequence"] = ""
--Translation missing 
-- L["Error found in version %i of %s."] = ""
L["Export"] = "Экспорт"
L["Export a Sequence"] = "Экспорт последовательности"
--Translation missing 
-- L["Filter Macro Selection"] = ""
--Translation missing 
-- L["Finished scanning for errors.  If no other messages then no errors were found."] = ""
--Translation missing 
-- L["FYou cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = ""
L["Gameplay Options"] = "Игровые Параметры"
L["General"] = "Общие"
L["General Options"] = "Общие Параметры"
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
L["Gnome Sequencer: Sequence Viewer"] = "Gnome Sequencer: просмотр Последовательности"
--Translation missing 
-- L["GnomeSequencer was originally written by semlar of wowinterface.com."] = ""
--Translation missing 
-- L["GnomeSequencer-Enhanced"] = ""
--Translation missing 
-- L["GnomeSequencer-Enhanced loaded.|r  Type "] = ""
L["GSE"] = "GSE"
L["GSE allows plugins to load Macro Collections as plugins.  You can reload a collection by pressing the button below."] = "GSE allows plugins to load Macro Collections as plugins.  Вы можете перезагрузить коллекцию, нажав на кнопку ниже."
L["GS-E can save all macros or only those versions that you have created locally.  Turning this off will cache all macros in your WTF\\GS-Core.lua variables file but will increase load times and potentially cause colissions."] = "GS-E может сохранить все макросы или только те версии, которые были созданы локально. При отключении будут записываться все макросы в WTF\\GS-Core.lua, но увеличит время загрузки и потенциально вызывать противоречия."
--Translation missing 
-- L["GSE has a LibDataBroker (LDB) data feed.  List Other GSE Users and their version when in a group on the tooltip to this feed."] = ""
--Translation missing 
-- L["GSE has a LibDataBroker (LDB) data feed.  Set this option to show queued Out of Combat events in the tooltip."] = ""
L["GSE is a complete rewrite of that addon that allows you create a sequence of macros to be executed at the push of a button."] = "GSE - это полная перезапись этой модификации, которая позволяет вам создать последовательность макросов выполняющаяся одним нажатием кнопки."
--Translation missing 
-- L["GSE is out of date. You can download the newest version from https://mods.curse.com/addons/wow/gnomesequencer-enhanced."] = ""
--Translation missing 
-- L["GSE Macro"] = ""
L["GS-E Plugins"] = "GS-E Плагины"
--Translation missing 
-- L["GSE Users"] = ""
--Translation missing 
-- L["GSE Version: %s"] = ""
L["GSE: Left Click to open the Sequence Editor"] = "GSE: ЛКМ для открытия Редактора Последовательности"
L["GS-E: Left Click to open the Sequence Editor"] = "GS-E: ЛКМ для открытия Редактора Последовательности"
L["GSE: Middle Click to open the Transmission Interface"] = "GSE: СКМ для открытия интерфейса передачи"
L["GS-E: Middle Click to open the Transmission Interface"] = "GS-E: СКМ для открытия интерфейса передачи"
L["GSE: Right Click to open the Sequence Debugger"] = "GSE: ПКМ для открытия окна отладки"
L["GS-E: Right Click to open the Sequence Debugger"] = "GS-E: ПКМ для открытия окна отладки"
L["Head"] = "Голова"
--Translation missing 
-- L["Help Colour"] = ""
L["Help Information"] = "Справочная информация"
L["Help Link"] = "Ссылка для справки"
L["Help URL"] = "URL справка"
L["Heroic"] = "Героический режим"
L["Hide Login Message"] = "Скрыть Сообщение Входа"
L["Hides the message that GSE is loaded."] = "Скрывает сообщение, что GSE загрузился."
--Translation missing 
-- L["Icon Colour"] = ""
--Translation missing 
-- L["If you load Gnome Sequencer - Enhanced and the Sequence Editor and want to create new macros from scratch, this will enable a first cut sequenced template that you can load into the editor as a starting point.  This enables a Hello World macro called Draik01.  You will need to do a /console reloadui after this for this to take effect."] = ""
L["Import"] = "Импорт"
L["Import Macro from Forums"] = "Импорт макроса с форумов"
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
L["KeyPress"] = "Нажатие клавиши"
--Translation missing 
-- L["KeyRelease"] = ""
L["Language"] = "Язык"
--Translation missing 
-- L["Language Colour"] = ""
L["Left Alt Key"] = "Левая клавиша Alt "
L["Left Control Key"] = "Левая клавиша Control"
L["Left Mouse Button"] = "Левая кнопка мыши"
L["Left Shift Key"] = "Левая клавиша Shift "
--Translation missing 
-- L["Legacy GS/GSE1 Macro"] = ""
--Translation missing 
-- L["Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."] = ""
--Translation missing 
-- L["Load"] = ""
--Translation missing 
-- L["Load Sequence"] = ""
--Translation missing 
-- L["Macro Collection to Import."] = ""
--Translation missing 
-- L["Macro found by the name %sWW%s. Rename this macro to a different name to be able to use it.  WOW has a hidden button called WW that is executed instead of this macro."] = ""
--Translation missing 
-- L["Macro Icon"] = ""
L["Macro Import Successful."] = "Успешное импортирование макроса."
L["Macro Reset"] = "Сброс Макро"
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
L["Middle Mouse Button"] = "Средняя кнопка мыши"
L["Mouse Button 4"] = "Кнопка мыши 4"
L["Mouse Button 5"] = "Кнопка мыши 5"
L["Mouse Buttons."] = "Кнопки мыши."
--Translation missing 
-- L["Moved %s to class %s."] = ""
L["Mythic"] = "Эпохальный режим"
L["Neck"] = "Шея"
L["New"] = "Новый"
L["No"] = "Нет"
--Translation missing 
-- L["No Active Version"] = ""
--Translation missing 
-- L["No Help Information "] = ""
--Translation missing 
-- L["No Help Information Available"] = ""
--Translation missing 
-- L["No Sequences present so none displayed in the list."] = ""
--Translation missing 
-- L["Normal Colour"] = ""
--Translation missing 
-- L["Only Save Local Macros"] = ""
--Translation missing 
-- L["openviewer"] = ""
L["Options"] = "Параметры"
--Translation missing 
-- L["Options have been reset to defaults."] = ""
--Translation missing 
-- L["Output"] = ""
--Translation missing 
-- L["Output the action for each button press to verify StepFunction and spell availability."] = ""
L["Pause"] = "Пауза"
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
L["Plugins"] = "Плагины"
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
L["Priority List (1 12 123 1234)"] = "Приоритетный Список (1 12 123 1234)"
--Translation missing 
-- L["PVP"] = ""
--Translation missing 
-- L["PVP setting changed to Default."] = ""
L["Raid"] = "Рейд"
--Translation missing 
-- L["Ready to Send"] = ""
--Translation missing 
-- L["Received Sequence "] = ""
L["Record"] = "Запись"
L["Record Macro"] = "Запись Макроса"
--Translation missing 
-- L["Registered Addons"] = ""
--Translation missing 
-- L["Replace"] = ""
--Translation missing 
-- L["Require Target to use"] = ""
L["Reset Macro when out of combat"] = "Сбросить Макрос при выходе из боя"
L["Resets"] = "Сбросы"
L["Resets macros back to the initial state when out of combat."] = "Сбрасывает макросы обратно в исходное состояние, когда они находятся вне боя."
L["Resume"] = "Продолжить"
L["Right Alt Key"] = "Правая клавиша Alt"
L["Right Control Key"] = "Правая клавиша Control"
L["Right Mouse Button"] = "Правая кнопка мыши"
L["Right Shift Key"] = "Правая клавиша Shift"
L["Ring 1"] = "Кольцо1"
L["Ring 2"] = "Кольцо2"
--Translation missing 
-- L["Running"] = ""
L["Save"] = "Сохранить"
--Translation missing 
-- L["Seed Initial Macro"] = ""
--Translation missing 
-- L["Select Other Version"] = ""
L["Send"] = "Отправить"
--Translation missing 
-- L["Send To"] = ""
L["Sequence"] = "Последовательность"
L["Sequence %s saved."] = "Последовательность %s сохранена."
--Translation missing 
-- L["Sequence Author set to Unknown"] = ""
--Translation missing 
-- L["Sequence Debugger"] = ""
--Translation missing 
-- L["Sequence Editor"] = ""
L["Sequence Name"] = "Имя Последовательности"
--Translation missing 
-- L["Sequence Saved as version "] = ""
--Translation missing 
-- L["Sequence specID set to current spec of "] = ""
--Translation missing 
-- L["Sequence Viewer"] = ""
L["Sequential (1 2 3 4)"] = "Последовательно (1 2 3 4)"
--Translation missing 
-- L["Set Default Icon QuestionMark"] = ""
L["Shift Keys."] = "Клавиши Shift."
L["Show All Macros in Editor"] = "Показать Все макросы в редакторе"
L["Show Class Macros in Editor"] = "Показать макросы класса в редакторе"
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
L["Stop"] = "Стоп"
--Translation missing 
-- L["Store Debug Messages"] = ""
--Translation missing 
-- L["Store output of debug messages in a Global Variable that can be referrenced by other mods."] = ""
--Translation missing 
-- L["String Colour"] = ""
L["Talents"] = "Таланты"
L["Target"] = "Цель"
--Translation missing 
-- L["Target language "] = ""
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
L["These options combine to allow you to reset a macro while it is running.  These options are Cumulative ie they add to each other.  Options Like LeftClick and RightClick won't work together very well."] = "Эти параметры в совокупности позволяют сбросить макроса во время его выполнения. Эти параметры являются накопительными, т. е. они дополняют друг друга. Такие варианты, как \"правый клик\" и \"левый клик\" вместе успешно работать не будут."
--Translation missing 
-- L["This change will not come into effect until you save this macro."] = ""
--Translation missing 
-- L["This function will update macro stubs to support listening to the options below.  This is required to be completed 1 time per character."] = ""
--Translation missing 
-- L["This is a small addon that allows you create a sequence of macros to be executed at the push of a button."] = ""
L["This is the only version of this macro.  Delete the entire macro to delete this version."] = "Это единственная версия этого макроса. Удалите весь макрос, чтобы удалить эту версию."
--Translation missing 
-- L["This option clears errors and stack traces ingame.  This is the equivalent of /run UIErrorsFrame:Clear() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = ""
L["This option dumps extra trace information to your chat window to help troubleshoot problems with the mod"] = "Этот параметр выводит дополнительную информацию трассировки в окне чата, чтобы помочь устранить проблемы"
--Translation missing 
-- L["This option hide error sounds like \"That is out of range\" from being played while you are hitting a GS Macro.  This is the equivalent of /console Sound_EnableErrorSpeech lines within a Sequence.  Turning this on will trigger a Scam warning about running custom scripts."] = ""
--Translation missing 
-- L["This option hides text error popups and dialogs and stack traces ingame.  This is the equivalent of /script UIErrorsFrame:Hide() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = ""
L["This option prevents macros firing unless you have a target. Helps reduce mistaken targeting of other mobs/groups when your target dies."] = "Этот параметр предотвращает запуск макросов, если у вас нет цели. Помогает уменьшить ошибочное нацеливание на других мобов/групп, когда ваша цель умирает."
L["This Sequence was exported from GSE %s."] = "Эта последовательность была экспортирована из GSE %s."
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
L["Trinket 1"] = "Аксессуар 1"
L["Trinket 2"] = "Аксессуар 2"
--Translation missing 
-- L["Two sequences with unknown sources found."] = ""
--Translation missing 
-- L["Unknown Author|r "] = ""
--Translation missing 
-- L["Unknown Colour"] = ""
L["Update"] = "Обновить"
--Translation missing 
-- L["Update Macro Stubs"] = ""
--Translation missing 
-- L["Update Macro Stubs."] = ""
--Translation missing 
-- L["UpdateSequence"] = ""
L["Updating due to new version."] = "Обновление в связи с новой версией."
L["Use"] = "Использовать"
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
--Translation missing 
-- L["Version="] = ""
--Translation missing 
-- L["When creating a macro, if there is not a personal character macro space, create an account wide macro."] = ""
--Translation missing 
-- L["When loading or creating a sequence, if it is a global or the macro has an unknown specID automatically create the Macro Stub in Account Macros"] = ""
--Translation missing 
-- L["When loading or creating a sequence, if it is a macro of the same class automatically create the Macro Stub"] = ""
L["Yes"] = "Да"
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



