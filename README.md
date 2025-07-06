# GSE (Gnome Sequencer Enhanced) for WoW 3.3.5a

A revival and restoration of Gnome Sequencer Enhanced for World of Warcraft 3.3.5a (Wrath of the Lich King).

## About

GSE (Gnome Sequencer Enhanced) is an advanced macro sequencer for World of Warcraft that allows players to create and execute complex macro sequences, bypassing normal macro limitations. This version has been specifically restored and fixed for WoW 3.3.5a compatibility.

**Original Author**: TimothyLuke  
**WotLK Backport**: Gummed (Warmane) - abandoned  
**Revival & Fixes**: cerberus (January 2025)

## Features

- Create complex macro sequences that execute with a single button press
- Bypass the 255 character macro limit
- Support for conditional execution (PvP, Raid, Dungeon, Heroic, Party)
- Import/Export sequences for sharing
- Multi-language support
- Sample macros included for all classes
- Full GUI for easy sequence management

## Installation

1. Download the latest release
2. Extract the folder to your `World of Warcraft/Interface/AddOns/` directory
3. Ensure the folder structure looks like:
   ```
   Interface/
   └── AddOns/
       └── GSE-WotLK-3.3.5a/
           ├── GSE/
           ├── GSE_GUI/
           └── GSE_LDB/
   ```
4. Enable all three GSE modules in your addon selection screen

## Usage

### Basic Commands
- `/gse` - Open the main interface
- `/gse help` - Show help information
- `/gse showspec` - Show your current specialization
- `/gse loadsamples` - Load sample macros for your class
- `/gse debug` - Toggle debug mode

### Creating Your First Macro
1. Type `/gse` to open the interface
2. Click "Create New Sequence"
3. Give your sequence a name
4. Add your macro commands (one per line)
5. Save and create the macro icon
6. Drag the icon to your action bar

### Sample Macros
The addon includes documented sample macros for all classes. Load them with `/gse loadsamples`. Examples include:
- Warrior: Arms DPS, Protection Tank
- Paladin: Retribution DPS, Holy Healing
- Hunter: Beast Mastery, Marksmanship
- And more for all classes!

## What's Been Fixed

This revival addresses numerous issues from the abandoned original:

### Critical Fixes
- ✅ Fixed 20+ typos and naming errors that caused crashes
- ✅ Added comprehensive nil checking to prevent errors
- ✅ Full WoW 3.3.5a API compatibility (removed modern API calls)
- ✅ Fixed global variable pollution
- ✅ Removed 17,548 lines of duplicate code (5MB+ reduction)
- ✅ Fixed performance issues with caching and string operations

### Compatibility Updates
- Removed unsupported events (GROUP_ROSTER_UPDATE, PLAYER_SPECIALIZATION_CHANGED)
- Fixed difficulty checks for 3.3.5a
- Updated talent system detection for pre-MoP design
- Removed BackdropTemplateMixin usage

### New Features
- Added comprehensive sample macros for all classes
- Improved error handling and user messages
- Better defensive programming throughout

## Technical Details

Built using:
- Ace3 Framework
- LibStub for library management
- LibDataBroker for minimap integration
- Lua 5.1 (WoW 3.3.5a embedded)

## Known Limitations

- Some operations fail during combat due to Blizzard's combat lockdown
- Spec detection uses talent tree analysis (pre-specialization era)
- Maximum of 120 character macros + 18 account macros

## Contributing

This revival was done by cerberus after Gummed's WotLK backport was abandoned. TimothyLuke continues to maintain GSE for retail WoW. Contributions welcome!

### Development Guidelines
1. Maintain WoW 3.3.5a compatibility
2. Always use local variables (avoid globals)
3. Add nil checks for all WoW API calls
4. Test thoroughly before submitting

## Version History

- **2.2.04-wotlk** (January 2025) - Complete revival for 3.3.5a by cerberus
  - Fixed all critical bugs and crashes
  - Added sample macros for all classes
  - Full compatibility restoration
  - Based on Gummed's backport of GSE 2.x
  
- **2.2.03** - Last known version backported to 3.3.5a by Gummed (abandoned)

Note: Current retail GSE is version 3.2.x and is a complete rewrite by TimothyLuke

## License

Original GSE by TimothyLuke is released under the MIT License.  
This WotLK backport and revival maintains the same open-source spirit.  
See https://github.com/TimothyLuke/GSE-Advanced-Macro-Compiler for the original project.

## Support

This revival is maintained by cerberus. For issues:
1. Check the Issues tab on GitHub
2. Provide clear reproduction steps
3. Include any error messages
4. Note your class/spec when reporting

## Acknowledgments

- **TimothyLuke** - Original author of GSE (still maintains retail version)
- **Gummed** - Created the WotLK 3.3.5a backport
- **semlar** - Original GnomeSequencer creator
- WoW addon community for keeping classic alive

---

*This addon is not affiliated with or endorsed by Blizzard Entertainment.*