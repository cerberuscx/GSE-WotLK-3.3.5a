# GSE Editor Resize Fix Summary

## Problem
When resizing the Sequence Editor window on numbered macro tabs (1, 2, 3, etc.), the content would extend beyond the bottom of the window frame. The Configuration tab worked correctly.

## Root Cause
The numbered tabs used a different container structure than the Configuration tab:

1. **Configuration Tab**: 
   - Direct structure: `container` → `scrollcontainer` → `contentcontainer`
   - Dynamic height calculation

2. **Numbered Tabs**:
   - Extra wrapper: `container` → `layoutcontainer` → `scrollcontainer` + `toolbarcontainer`
   - Fixed height on layoutcontainer that didn't update properly during resize
   - Flow layout causing side-by-side arrangement

## Solution
Modified `GSE_GUI/Editor.lua` in the `GUIDrawMacroEditor` function:

1. **Line 513-514**: Made `layoutcontainer` use dynamic height calculation:
   ```lua
   local availableHeight = math.max(100, editframe.Height - 280)
   layoutcontainer:SetHeight(availableHeight)
   ```

2. **Line 522**: Removed duplicate height calculation in `scrollcontainer`, reusing the same `availableHeight`

3. **Line 680**: Added height constraint to `toolbarcontainer`:
   ```lua
   toolbarcontainer:SetHeight(availableHeight)
   ```

## Result
All containers now use the same height calculation and properly constrain their content during window resize. Both Configuration and numbered tabs behave consistently.

## Testing
Test by:
1. Opening the Sequence Editor (`/gse`)
2. Switching between Configuration and numbered tabs
3. Resizing the window in various ways
4. Verifying content stays within window bounds for all tabs