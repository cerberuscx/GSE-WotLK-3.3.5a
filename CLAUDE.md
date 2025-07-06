# Gnome Sequencer Enhanced (GSE) 3.3.5a - Project Documentation

## Project Overview

GSE (Gnome Sequencer Enhanced) is a World of Warcraft addon that allows players to create and execute complex macro sequences that bypass normal macro limitations. This is a revival project for WoW 3.3.5a (WotLK) based on an abandoned codebase that was originally ported from a newer WoW version.

## Current State Assessment

The addon is partially functional but has numerous issues stemming from:
1. Incomplete port from modern WoW versions
2. Multiple code quality issues (typos, logic errors, missing error handling)
3. API compatibility problems with WoW 3.3.5a
4. UI/UX bugs and memory management issues

## Architecture Overview

### Core Modules
1. **GSE (Core)** - Main addon functionality
   - API/ - Core functionality (Init, Storage, Events, Translator, etc.)
   - Lib/ - External library dependencies (Ace3, LibStub, etc.)
   - Localization/ - Multi-language support files
   
2. **GSE_GUI** - User interface components
   - Editor, Viewer, Import/Export functionality
   - Assets/ - UI graphics in BLP format
   
3. **GSE_LDB** - LibDataBroker integration for minimap button

### Key Libraries Used
- Ace3 Framework (UI and addon framework)
- LibStub (library versioning)
- LibDataBroker (minimap integration)
- LibCompress (data compression)
- LibSharedMedia (shared resources)

## Critical Issues Summary

### 1. Code Quality Issues (Priority: HIGH)
- **Global variable pollution** throughout the codebase
- **Typos in function/variable names** causing runtime errors:
  - `determinationOutputDestination` → `determineOutputDestination`
  - `StepFunciton` → `StepFunction`
  - `RighttButton` → `RightButton`
  - `difficult` → `difficulty`
  - `getInstacneInfoLocal` → `getInstanceInfoLocal`
- **Logic errors** in conditional statements
- **Missing nil checks** causing potential crashes
- **Unused/dead code** creating maintenance burden

### 2. WoW 3.3.5a API Compatibility (Priority: HIGH)
- **Modern APIs used that don't exist**:
  - `GetSpecialization`/`GetSpecializationInfo` (MoP additions)
  - `GROUP_ROSTER_UPDATE` event (should use `PARTY_MEMBERS_CHANGED`)
  - `PLAYER_SPECIALIZATION_CHANGED` event (doesn't exist)
  - Mythic difficulty IDs (23/24) don't exist
- **Talent system differences** - using spec IDs vs talent trees
- **UI template issues** - `BackdropTemplateMixin` doesn't exist

### 3. UI/UX Problems (Priority: MEDIUM)
- **Frame naming conflicts** - multiple frames named "GSE3"
- **Memory leaks** from uncleaned UI widgets
- **Event handler issues** - incorrect widget references
- **Missing localization** for hardcoded strings
- **No frame position/size restoration**
- **Input validation missing** for user data

### 4. Error Handling (Priority: HIGH)
- **Missing pcall wrapping** for critical operations
- **No input validation** in most functions
- **Limited error recovery** mechanisms
- **Poor error reporting** to users
- **Potential infinite loops** without safeguards

## Development Guidelines

### Code Standards
1. **Always use local variables** - avoid global pollution
2. **Validate all inputs** - check for nil/empty before use
3. **Wrap WoW API calls** in pcall for safety
4. **Use consistent naming** - fix all typos immediately
5. **Comment complex logic** - but avoid obvious comments
6. **Cache API results** when used in loops

### Testing Approach
1. Test all macro execution paths
2. Verify UI interactions in and out of combat
3. Test with different class/spec combinations
4. Validate import/export functionality
5. Check memory usage over extended sessions

### Debugging
- Use `/gse debug` to enable debug output
- Check saved variables for corruption
- Monitor memory usage with addon profiling tools
- Test edge cases (empty sequences, invalid data)

## Priority Fix List

### Phase 1: Critical Fixes (Must Do First)
1. Fix all typos and naming errors
2. Add nil checks to prevent crashes
3. Remove/update incompatible WoW APIs
4. Fix global variable pollution
5. Resolve frame naming conflicts

### Phase 2: Stability Improvements
1. Add comprehensive error handling
2. Implement input validation
3. Fix memory leaks in UI
4. Add proper event cleanup
5. Implement recursion limits

### Phase 3: Feature Polish
1. Improve error messages for users
2. Add frame position persistence
3. Complete localization
4. Optimize performance hotspots
5. Enhance debugging capabilities

## API Compatibility Reference

### Use These APIs (3.3.5a Compatible):
- `GetActiveTalentGroup()` - for dual spec
- `GetNumTalentTabs()` - returns 3
- `GetTalentTabInfo()` - for talent tree info
- `GetNumPartyMembers()` - for party size
- `PARTY_MEMBERS_CHANGED` event
- `InCombatLockdown()` - for combat checks

### Don't Use These APIs (Post-3.3.5a):
- `GetSpecialization()` family
- `C_Timer` functions (use AceTimer)
- `GROUP_ROSTER_UPDATE` event
- `GetNumGroupMembers()`
- Mythic difficulty checks
- Any `C_` prefixed APIs

## Building and Testing

### Required WoW Version
- World of Warcraft 3.3.5a (Build 12340)
- Other versions may have different API availability

### Installation
1. Copy entire GSE-3.3.5a folder to Interface/AddOns/
2. Ensure all three modules are present (GSE, GSE_GUI, GSE_LDB)
3. Enable all three in the addon selection screen

### Debug Commands
- `/gse` - Open main interface
- `/gse debug` - Toggle debug mode
- `/gse help` - Show help information

## Known Issues

1. **Combat Lockdown** - Some operations fail in combat
2. **Spec Detection** - Uses workaround for talent tree detection
3. **Icon Updates** - May not update correctly in all cases
4. **Import/Export** - Compression may fail with very large sequences
5. **Localization** - Incomplete for some languages

## Future Enhancements

1. Implement proper 3.3.5a spec detection
2. Add sequence sharing via addon channels
3. Create sequence templates for each class
4. Add macro syntax validation
5. Implement sequence version control
6. Add performance profiling tools

## Contact and Support

This is a community revival project. The original author (TimothyLuke) abandoned the project. 

For bug reports and contributions:
- Document issues with clear reproduction steps
- Include error messages from BugSack/Swatter
- Note your class/spec when reporting issues
- Test fixes thoroughly before submitting

## License

Original addon by TimothyLuke. Revival efforts are community-driven. Check original license terms before distribution.