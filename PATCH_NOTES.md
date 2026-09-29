# PvMP+ Patch Notes

This document preserves the historical patch notes for **PvMP+** and **PvMP+ Revisited**, from the original release by **Glubby** through **PvMP+ Revisited v4.3 by Urundus**.

The notes below are transcribed and formatted from the version histories published on LoTROInterface.

- Original PvMP+: https://www.lotrointerface.com/downloads/info728-PvMP.html
- PvMP+ Revisited: https://www.lotrointerface.com/downloads/info1199-PvMPRevisited.html

---

# PvMP+ — Glubby

## v3.3 — 2016/03/28

- Updated French translations. Thank you Adra and Whaz!

## v3.2 — 2015/12/11

- Missed a file in the ZIP archive, which should fix the background image issue.

## v3.1 — 2015/12/11

- Updated the map to display the actual skill icons for the creep map in locations.
  - If your character does not have the associated map skill, it will appear grayed out.
- Updated the map to automatically close when you click a map skill.
- Updated the X on the map to flash when another user sends the chat message identifying enemy locations.
- Updated the plugin icon to be a hybrid of the Freep/Creep keep icons instead of the wolf.
- Special thanks to Tangaar for the suggestions.

## v3.0 — 2015/10/21

- Corrected the Commendation cap to reflect the change to 15,000.
- Added the ability to display enemy positions relative to known points, such as keeps and Outposts.
  - Instead of simply clicking **Send** in the Recent Kill window, click **Pos**, then **Send**.
  - The resulting message is displayed in the form of `Creeps 103m NW GV`.
  - These positions do not appear on the displayable map.
- Bug fixes.

## v2.9 — 2014/05/01

- Corrected the Delving of Frór buff displays when resizing the top bar.
- Fixed a minor typo in kill messages.

## v2.8 — 2014/04/18

- Corrected the keep display for Tirith Rhaw following the U13 spelling fix.
- Creep map locations are now visible to Freeps using the built-in map.
  - The locations appear, but the skill shortcuts do not work for obvious reasons.
- Kill messages now end with a randomly selected word instead of `Bazinga!`.
  - There is a small selection of words which appear randomly after kills.
  - The words were initially English-only.
  - The author requested French, Russian and German word submissions from the community.
  - No swear words.
- Added Delving buff timers.
  - The plugin displays how long your side has controlled the Delving of Frór buffs.
  - Buff information is retrieved from the player's buff bar rather than directly from the server.
  - Timers are therefore only accurate from the time you log in.
  - When first entering the Moors after logging in, the timers begin at `0:00`.
  - When your side does not control a buff, the plugin cannot determine whether the opposing side controls it or whether it has simply expired.
  - Such buffs remain displayed on the opposing side to indicate that your side does not control them.

## v2.7 — 2014/03/03

- Corrected the keep display for Creeps.
- The keep display should now work properly for Creep players.

## v2.6 — 2014/02/22

- Corrected the 3% and 5% Renown/Infamy buffs for controlling both relics and all five keeps.
  - These should now work correctly at all times.
- Updated the Lootbox alert trigger to activate for any type of Lootbox.
  - This should prevent future breaks caused by Lootbox name changes.
- Added icons to the top of the progress bar showing which keeps your side controls.
  - Blue fire icons on the left show Free People-controlled keeps.
  - Red fire icons on the right show Monster-controlled keeps.
  - Each icon includes a two-letter abbreviation for the keep.
- Added more alert messages for:
  - Detecting nearby creatures.
  - Detecting hidden creatures.
  - Delivering a Killing Blow.
- Thanks to PulseDiver for the contributions.

## v2.5 — 2013/12/20

- Added the 100% Renown/Infamy buff from store-bought buffs or Bounder's Bounty.
- Added the 5% Renown/Infamy buff for controlling both relics and all five keeps.
- Updated the plugin so Eorlingas Lootboxes trigger the alert message.
- Updated the Outpost display to provide more information at a glance.
  - The blue/red lines at the top of the display now show a letter identifying controlled Outposts:
    - `A` = Arador's
    - `I` = Isendeep
    - `R` = River
    - `H` = Hithlad
  - This removes the need to open the map just to determine which Outposts are controlled.

## v2.4 — 2013/03/18

- Added the ability to customize the daily statistics reset time.
- Commendations and Lootboxes/keys are tracked again following the U10 chat channel changes.

## v2.3 — 2013/02/20

- Updated Russian translation.
- Added detection of user-chat names.
- Added Lootbox/key alerts.
- Added totals for victims and kills in the statistics window.
- Multiple bug fixes.
- Performance improvements.

## v2.2 — 2013/01/13

- Added a new map window.
  - Shows the current situation in the Ettenmoors.
  - Players can post their position so other PvMP+ users can see it on their map.
  - Added the ability to port via the map.
- Added a new helper window.
  - Displays the last five Killing Blows.
- Added the ability to post to UserChats.
- Several other improvements.
- The author noted that substantial changes were made to both new and old code and warned that bugs were likely. Users were asked to report issues.

## v2.1.1 — 2013/01/13

- Bug fixes.

## v2.1 — 2013/01/11

- Added a new display showing how many Outposts your side controls.
- Added a filter function to the kills list.
- Added Commendation tracking.
  - Commendation information can be displayed by hovering over the Commendations icon.

## v2.0.1 — 2012/12/29

- Updated the bottom diagram so that it matches the top diagram.
- Added the `+3%` buff name on the Free People side.

## v2.0 — 2012/12/26

- Added a new diagram panel to the statistics window.
- Killing Blows list now jumps to the beginning after opening the panel or resorting the list.
- Various other improvements.

## v1.9 — 2012/12/16

- Added a new Statistics Window.
- Added a list of Killing Blows.
  - Kills made by pets, traps and similar sources cannot be tracked.
- Added Russian translation. Thanks to PulseDiver!
- Several minor improvements.

## v1.8 — 2012/12/08

- Commendation warning now flashes faster when Commendations exceed 9,500.
- Added a warning when you are being tracked.
  - English, German and Russian clients only.
- Added a notice about percentage reputation increases.
  - English and German clients only.
- Small fixes and improvements.

## v1.7 — 2012/08/09

- Added the ability to choose which statistics are posted to chat.
- Added an option to disable the warning when having more than 9,000 Commendations.
- Small bug fix.

## v1.6 — 2012/08/06

- Added the ability to post statistics to chat by clicking the new button at the top right.
- Right-clicking the button opens a menu for selecting the chat channel.
- French client support for the chat channel shortcuts was not yet fully tested.

## v1.5 — 2012/06/05

- PvMP+ now works with French clients.
- Added the ability to switch to **points to rank up** by clicking the `total points` text.
- Points earned in the last hour / 10 minutes no longer reset when the plugin is unloaded.
- Improved crash handling.
  - Data is now saved permanently.
- Minor fixes and improvements.

## v1.4 — 2012/05/22

- Added buttons for faster access to options and minimizing the window.
- Window is now resizable.
- Minor improvements.

## v1.3 — 2012/05/19

- Several visual and functional improvements.
- Added statistics.
- Added Settings Window.
- Added the `/pvmp+ settings` command.
  - German clients use `/pvmp+ einstellungen`.
- Added a warning when Commendations exceed 9,000.
- Fixed several bugs.
- Added crash detection.
  - Displays information if data becomes out of sync and requires the player to re-enter their current points.

## v1.2 — 2012/05/17

- Fixed a saving/loading bug affecting the German client.
- Added Rank and Commendation icons.

## v1.1 — 2012/05/15

- PvMP+ now saves data so points do not need to be entered every time you log in.
- Added an options menu in the Plugin Manager allowing users to:
  - Manually set, reset or correct their points.
  - Reset settings, such as the window position.

## v1.0 — 2012/05/15

- Initial release.
- Tracks the total amount of Infamy/Renown.
- Added a progress bar showing progress to the next rank.
- Displays the percentage completed towards the next rank.
- Supports English and German clients.
- Supports both Free People and Monster Player sides.
- Window can be positioned freely.

---

# PvMP+ Revisited — Urundus

## v4.3 — 2026/09/28

- Added a Reloader plugin to PvMP+.
- Added the new Forward Camps to the Map Window and as callout locations.
- Fixed Killing Blow Log sorting for entries with counts above 1,000 kills.
- Landing a Killing Blow on a Session Play character no longer increases the total number of Killing Blows, preventing divergence from the Wartab.
  - Killing Blows against Session Players are still tracked in the Killing Blow Log.
- Improved granularity when rendering bar charts.
- Improved NPC and pet name filtering during player-name tracking.
- Updated Infamy and Renown gain percentages for Outnumbered buffs.
- Updated the spelling of:
  - Tírith Rhaw
  - Gwaelug
  - Fragment of Mordirith's Crown
- Updated the default display settings so Delving of Frór buffs are shown after resetting Settings.
  - This can still be disabled manually through Settings.
- Fixed the stealth detection trigger for the German client.
- Updated several translations.

## v4.2 — 2023/03/26

- Fixed resizing of Statistics below the main Progress Bar.
  - Statistics automatically hide when using a small Progress Bar to prevent clutter.
  - The cutoff is approximately a bar size of 10%.
- Fixed tabs in the Statistics window.
  - Headers no longer use abbreviations.
  - Headers should no longer overlap.
  - Headers should fit correctly for all localizations.
- Fixed a visual issue where the Commendations bar chart duplicated itself.
- Map Window port skills are now available to Freepside and Ranger/Troll Session Play.
- Fixed the `Show Statistics` setting not being saved between sessions.
- Updated several Display Settings to be more responsive.
- Added Russian localization.
  - The plugin should automatically use Russian when a Russian client is detected.
  - Thanks to Thurallor for assistance.
- Fixed Russian translations for:
  - Fragment of Mordírith's Crown (Relic buff)
  - The Gift of Carrock (Relic buff)
  - Thanks to Mod on Discord.
- Updated several incorrect French and German translations.
- Added translations for each window's DragBar.

## v4.1 — 2023/01/29

- Fixed the red Commendation warning remaining visible after spending Commendations and dropping below the 19,000 warning threshold.
- Lowered the Commendation warning flashing speed.
- Optimized Commendation tracking.
- Fixed the Bonus percentage when losing the `Peace and Quiet` map-control buff.
  - The Bonus percentage from the `A Quiet Calm` relic-control buff is not applied when the former is lost.
  - It is regained after relogging.
  - The author noted this is likely a game bug.
- Fixed the Battle Task alert remaining visible when toggling the HUD with F12 or minimizing the plugin.
- Updated the Recent Hits window so it can send messages to the `/say` channel.
- Fixed issues with formatting large numbers and rounding.
- Fixed incorrect bar-chart Y-axis height calculations.
- Fixed statistics for December not being displayed.
- Added a button to clear the search field in the Killing Blow Log.
- Updated the Settings window UI.
  - Uses the game's UI elements.
  - Changes according to faction and UI skin.
- Changed `Show DoF Buffs` to be disabled by default on first installation because the Delving is closed.
  - Existing installations are not affected.
  - The setting can still be enabled manually.
- Fixed some settings not being reset when using `Reset Settings to Default`.
- Cleaned up localization files by removing many recurring strings.
- Updated missing French translations.
  - The author noted that a translation program was used for much of this work and requested reports for incorrect translations.
- Fixed the French translation for `Peace and Quiet` (map-control buff).

## v4.0.1.1 — 2022/11/18

- Fixed a missing import file.

## v4.0.1 — 2022/11/18

- Fixed an issue preventing the plugin from loading because of an incorrect loading order.
- Accommodated the removal of Russian language support from the API.

## v4.0 — 2022/11/14

- Updated the locations of Elf Camp and Orc Camp for the BtS expansion.
- Updated Infamy and Renown gain percentages:
  - Isendeep and Lumbercamp: 35%
  - Tirith Rhaw and Lugz: 10%
- Fixed the calculation used to determine the player's current location relative to nearby hotspots used for `/loc` callouts.
- Added additional notable hotspots.
- Fixed the Map Window not properly displaying Creep map-in locations while on Freepside.
- Added an alert for spotting creatures in stealth.
  - Uses the existing Stealth alert setting for detecting nearby creatures.
- Added a chat command for toggling the Map Window.
  - English: `/pvmp+ map`
  - German: `/pvmp+ karte`
  - French: `/pvmp+ carte`
  - This allows the Map Window to be bound to an alias keybind.
- Fixed Freep map-control buffs being counted twice toward the Bonus percentage because two buffs with the same name are always present:
  - One for Bonus.
  - One for Experience.
- Updated the Renown/Infamy parser to support gained amounts above 1,000.
  - This became theoretically possible because of the increased Bonus percentages.
- Changed Lootbox and Battle Task warnings to be disabled by default on first installation.
  - Existing installations are not affected.
  - The alerts can be enabled again through Settings.
  - These alerts can be moved around the screen using `CTRL + \`.
- Updated the list of named Ettenmoors NPCs filtered from the Recent Hits tracker.
- Improved filtering of player pets in the Recent Hits tracker.
- Fixed statistics not displaying correctly or being cut off with a small Progress Bar.
- Fixed the Recent Hits tracker for the German client.
- Fixed French and German chat-channel shortcuts where some were incorrect.
- Fixed `/loc` parsing for French and German clients.
- Fixed joining and leaving UserChats for French and German clients.
- Increased supported UserChats from 4 to 8.
- Fixed French localization for Relics.
- Fixed the German translation for `Peace and Quiet` (map-control buff).
  - Thanks again to RenthoMar.
- Performed significant code cleanup and optimization.

---

# PvMP+ Revisited — v4.0 Development Releases

The following Alpha and Beta releases are included for historical completeness because they document the development of the v4.0 feature set.

## v4.0 Beta — 2022/10/02

- Updated the Progress Bar slider.
  - The Progress Bar can now be made approximately half the previous minimum size.
- Added Display Settings.
  - Outposts can be hidden.
  - Keeps can be hidden.
  - Delving of Frór buffs can be hidden.
  - Relics can be hidden.
  - Outnumbered buffs can be hidden.
- Fixed the Recent Hits window appearing again after relogging when disabled in Settings.
- Fixed the Recent Hits window appearing when toggling the HUD with F12 while disabled in Settings.
- Added hover functionality to the Commendation and Rank icons.
  - Commendation icon shows Commendation statistics.
  - Rank icon shows Killing Blow statistics.
- Fixed several German and French localization issues.
  - Buffs and statistics should now be tracked correctly.
- Updated missing and incorrect German translations.
  - Thanks to RenthoMar on Discord.

## v4.0 Alpha — 2022/09/23

- Added a red Progress Bar for the Creep-side theme.
- Freepside continues to use the blue Progress Bar.
- Added Relic buffs and timers to the overview.
- Added Outnumbered buffs and timers to the overview.
  - Only the player's own side's buff is displayed.
- Outpost tracker now shows opposing-side Outposts and their abbreviated letters.
- Added a monthly points tracker to the overview.
  - Monthly points can also be linked to chat.
- Rank icon can be clicked to switch between:
  - Monthly statistics
  - Daily statistics
  - Hourly statistics
  - 10-minute statistics
  - Fight Killing Blow statistics
- Clicking the Rank icon again returns to the points overview.
- Expanded the Statistics window with substantially more statistics.
- Added Killing Blow deed tier tracking as though Killing Blows only count toward this deed, matching historical behaviour.
- Expanded Points, Killing Blow and Track statistics.
- Added Commendation and Death statistics.
- Killing Blow statistics now show the number of Killing Blows required for the next deed tier.
- Added bar graphs for:
  - Commendations
  - Killing Blows
  - Deaths
  - Tracks
- Added yearly monthly bar graphs for all statistics.
- Charts display average gains per day for the selected month when hovering over them.
  - The highlighted chart uses red or blue depending on faction.
- Some charts display additional statistics on hover, such as Killing Blows per Death.
- Added maximum-day and maximum-month trackers for all statistics.
- Added a Battle Task tracker and reminder.
  - Can be disabled through Settings.
- Expanded the Settings window with additional options for showing and hiding UI elements.
- Added a confirmation pop-up when resetting Settings.
- Updated the Map Window and added notable landmarks.
- Window positions for all PvMP+ windows are now saved between sessions.

### Known Issues

- Russian translations were still incomplete and some translations could be incorrect.
- Spending exactly all available Commendations, leaving the wallet at zero, could prevent PvMP+ from updating the current Commendation total.
  - This was caused by how the game handles wallet currencies reaching zero.
  - Reloading the plugin resolved the issue.

---

# Historical Development Summary

| Version | Date | Author | Release |
|---|---|---|---|
| v1.0 | 2012/05/15 | Glubby | Initial release |
| v1.1 | 2012/05/15 | Glubby | Data persistence and options |
| v1.2 | 2012/05/17 | Glubby | German save/load fix |
| v1.3 | 2012/05/19 | Glubby | Statistics, settings and crash detection |
| v1.4 | 2012/05/22 | Glubby | Resizable window and UI improvements |
| v1.5 | 2012/06/05 | Glubby | French support and persistent statistics |
| v1.6 | 2012/08/06 | Glubby | Chat statistics |
| v1.7 | 2012/08/09 | Glubby | Configurable chat statistics |
| v1.8 | 2012/12/08 | Glubby | Tracking and Commendation alerts |
| v1.9 | 2012/12/16 | Glubby | Statistics Window and Killing Blow list |
| v2.0 | 2012/12/26 | Glubby | Statistics diagrams |
| v2.0.1 | 2012/12/29 | Glubby | Diagram and buff display changes |
| v2.1 | 2013/01/11 | Glubby | Outpost, kill filtering and Commendation tracking |
| v2.1.1 | 2013/01/13 | Glubby | Bug fixes |
| v2.2 | 2013/01/13 | Glubby | Map, helper window and UserChat support |
| v2.3 | 2013/02/20 | Glubby | Russian updates, alerts and performance |
| v2.4 | 2013/03/18 | Glubby | Daily reset and tracking fixes |
| v2.5 | 2013/12/20 | Glubby | Buffs and improved Outpost display |
| v2.6 | 2014/02/22 | Glubby | Keep icons and improved alerts |
| v2.7 | 2014/03/03 | Glubby | Creep keep display fix |
| v2.8 | 2014/04/18 | Glubby | Creep map, Delving timers and kill messages |
| v2.9 | 2014/05/01 | Glubby | Delving display and kill message fixes |
| v3.0 | 2015/10/21 | Glubby | Commendation cap and position callouts |
| v3.1 | 2015/12/11 | Glubby | Map skill icons and map improvements |
| v3.2 | 2015/12/11 | Glubby | Background image archive fix |
| v3.3 | 2016/03/28 | Glubby | French translation update |
| v4.0 Alpha | 2022/09/23 | Urundus | Major PvMP+ Revisited feature expansion |
| v4.0 Beta | 2022/10/02 | Urundus | UI, localization and display improvements |
| v4.0 | 2022/11/14 | Urundus | BtS compatibility and extensive fixes |
| v4.0.1 | 2022/11/18 | Urundus | Loading and Russian API fixes |
| v4.0.1.1 | 2022/11/18 | Urundus | Missing import fix |
| v4.1 | 2023/01/29 | Urundus | Statistics, UI, localization and tracking fixes |
| v4.2 | 2023/03/26 | Urundus | Statistics, map, localization and UI fixes |
| v4.3 | 2026/09/28 | Urundus | Forward Camps, Session Play, parser, filtering and localization updates |

---

## Attribution

The historical PvMP+ patch notes above originate from the release histories maintained on **LoTROInterface**.

- **PvMP+** — originally developed by **Glubby**
- **PvMP+ Revisited** — developed by **Urundus**

This document is intended to preserve the development history of the project while continued development and maintenance takes place.

---

*Source: LoTROInterface PvMP+ and PvMP+ Revisited version histories.*
