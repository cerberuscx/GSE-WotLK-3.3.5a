# GSE Editor Resize Fix Test

## Test Procedure

1. Start WoW 3.3.5a with GSE addon enabled
2. Type `/gse` to open the main interface
3. Create or edit an existing macro sequence
4. In the Sequence Editor:
   - Click on the "Configuration" tab
   - Resize the window by dragging the bottom-right corner
   - Verify the content stays within window bounds
   
5. Click on a numbered tab (1, 2, 3, etc.)
   - Resize the window by dragging the bottom-right corner
   - Verify the content now stays within window bounds (previously would extend beyond)
   
6. Test edge cases:
   - Make window very small (should hit minimum size limit)
   - Make window very large (should hit maximum size based on screen)
   - Move window to screen edges and resize

## Expected Results

- Both Configuration and numbered tabs should behave the same during resize
- Content should never extend beyond the window frame
- Scroll bars should appear when content exceeds available space
- The side toolbar (with trinket/ring checkboxes) should stay aligned

## What Was Fixed

The numbered tabs had an extra layout container with a fixed height calculation that didn't properly update during resize. The fix ensures all containers use the same dynamic height calculation that respects window bounds.

### Code Changes:
1. Made `layoutcontainer` use the same `availableHeight` calculation as the Configuration tab
2. Removed duplicate height calculation in `scrollcontainer`
3. Added height constraint to `toolbarcontainer` to match other containers