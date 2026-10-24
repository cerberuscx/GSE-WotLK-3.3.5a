# GSE2: Gnome Sequencer Enhanced

## 2.2.06-wotlk

- Isolated GSE's bundled AceGUI as `GSE-AceGUI-3.0` so ElvUI and other addons can no longer override GSE's editor widgets.
- Moved the out-of-combat save queue onto a private OnUpdate ticker instead of the shared AceTimer library.
- Added missing enUS localization strings, including the `New: Type ` message.
- Added an in-addon sanitizer that removes invalid sequence entries on login and via `/gse repair`.
- Normalized sequence names so generated names no longer create empty placeholder entries.
- Fixed manual saves being ignored after the first save.
- Hardened sequence loops against invalid saved entries.
- Vendored a complete, consistent AceGUI 3.0 set (core + all standard widgets) into the private `GSE-AceGUI-3.0` namespace, replacing the mixed old-core/new-widget setup. All private frame names are `GSE`-prefixed so they cannot collide with the real AceGUI instance's frames. Fixes the editor's tab strip and the dropdowns that rendered only their left edge or had a dead arrow.
- Raised all GSE static popups above the editor/viewer so confirmation dialogs (e.g. delete macro) are never hidden behind an AceGUI window.
- Reworked the editor/viewer layout to use AceGUI-native sizing (full/relative widths, a single `RelayoutEditor`/`RelayoutViewer` driven by AceGUI's own size callbacks) and removed fixed pixel math plus resize-triggered tab rebuilds. The editor and viewer now stay correctly laid out while being resized.
- Added a GSE minimap button (LibDBIcon) using the addon icon (converted to TGA for 3.3.5a), with a `Show Minimap Button` option; position/hide persist in `GSEOptions.minimap`.
- Minimap button: left-click opens `/gse`, right-click opens a menu covering the `/gse` maintenance/tools commands, sequence export, samples, options, help and hide. Removed the hover tooltip.
- Fixed `/gse showspec` referencing an undefined class ID.
- Redesigned the Sequence Viewer: compact auto-sized cards with class-coloured names and accents, grouped class headings, a live search filter, a cleaner auto-width toolbar and a subtle selection highlight.
- Renaming a sequence in the editor now renames the existing sequence and its macro stub instead of creating a duplicate.
- The editor now blocks saving/renaming to a name that already exists as a sequence or macro, shows the reason in the status bar, and disables Save.
- The Viewer action previously labelled `Create Icon` / `Delete Icon` is now `Create Macro` / `Delete Macro`, and it no longer errors when no sequence is selected.
- Duplicate-name validation now checks every class (case-insensitive) and also guards the editor's New-tab auto-save, so a new sequence can no longer be created over an existing name.
- Selected Sequence Viewer cards now use a full class-coloured border, a class-tinted background and a thicker left accent bar.
- Sequence Viewer cards now use uniform 10 px padding, a fixed icon column and aligned text/help with a consistent header gap.
- All GSE windows now open centered on the screen every time they are shown.
- Requires in-game verification with ElvUI enabled and disabled.

## [2.6.55](https://github.com/TimothyLuke/GnomeSequencer-Enhanced/tree/2.6.55) (2021-06-09)
[Full Changelog](https://github.com/TimothyLuke/GnomeSequencer-Enhanced/compare/2.6.54...2.6.55) [Previous Releases](https://github.com/TimothyLuke/GnomeSequencer-Enhanced/releases)

- #846 Update ranks to internal API  
- #846 Dont print pcall passed  
- #846 Use GetSpellSubtext to obtain rank information.  
- #841  
    Build on Tag  
- #841 Update CI.yml  
- Migrate from Travis to Google Actions  