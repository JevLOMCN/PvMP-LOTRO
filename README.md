# PvMP+ Revisited

**PvMP+ Revisited** is a continuation and further development of the classic **PvMP+** LOTRO plugin originally created by **Glubby** and later extensively updated by **Urundus**.

The plugin provides a comprehensive collection of tools for **Player versus Monster Player (PvMP)** gameplay in *The Lord of the Rings Online*, including progress tracking, statistics, map information, killing blow tracking, commendation tracking, alerts, and various PvMP-related UI features.

This repository contains an independently maintained and updated version of PvMP+ Revisited, with the goal of keeping the plugin functional and up to date with modern LOTRO client and PvMP changes.

## Patch Notes

For the complete historical development history of PvMP+, including all releases from **v1.0 through v3.3** by Glubby and **v4.0 through v4.3** of PvMP+ Revisited by Urundus, see:

**[View Full Patch Notes](PATCH_NOTES.md)**

---

## Credits

This project is built upon the work of the following authors:

### Glubby

**Original author of PvMP+**

Glubby created the original PvMP+ plugin, which was first released in 2012 and developed through multiple versions up to version 3.3.

The original plugin introduced many of the core features that PvMP+ is known for, including:

* Infamy and Renown tracking
* Rank progression
* Progress bars
* Killing blow tracking
* Commendation tracking
* PvMP statistics
* Recent Hits window
* Ettenmoors map functionality
* Outpost and keep tracking
* PvMP alerts
* Chat integration
* Persistent player data
* Multiple language support

Original project:

https://www.lotrointerface.com/downloads/info728-PvMP.html

---

### Urundus

**Author of PvMP+ Revisited**

Urundus continued development of PvMP+ with **PvMP+ Revisited**, modernising the plugin and adding substantial new functionality.

PvMP+ Revisited introduced or updated features including:

* Expanded PvMP statistics
* Monthly, daily, hourly and 10-minute statistics
* Killing Blow statistics
* Death and Track statistics
* Commendation statistics
* Historical graphs and charts
* Maximum day/month tracking
* Relic tracking
* Outnumbered buff tracking
* Outpost and keep tracking
* Improved Ettenmoors map functionality
* Forward Camp support
* Map callouts
* Battle Task tracking
* Stealth detection alerts
* Recent Hits improvements
* Improved localisation
* German and French client support
* Russian localisation
* Improved player, NPC and pet filtering
* Improved UI and settings
* Persistent window positioning
* Numerous bug fixes and optimisations

Original Revisited project:

https://www.lotrointerface.com/downloads/info1199-PvMPRevisited.html

---

## About This Repository

This repository continues the development of **PvMP+ Revisited**.

The purpose of this project is to:

* Keep PvMP+ functional with current LOTRO client updates
* Fix compatibility issues introduced by game updates
* Correct outdated PvMP information
* Improve existing functionality
* Add new PvMP-related features
* Improve localisation and compatibility
* Fix bugs reported by the LOTRO PvMP community
* Preserve the work of the original authors while allowing continued development

This project would not exist without the work of **Glubby** and **Urundus**.

Their original code, ideas and development formed the foundation upon which this project is built.

---

## Features

### PvMP Progress Bar

The main PvMP display provides information about your current PvMP progression.

Depending on your side and configuration, the interface can display:

* Current Rank
* Rank progression
* Infamy / Renown
* Commendations
* Killing Blows
* PvMP bonuses
* Outposts
* Keeps
* Relics
* Outnumbered buffs
* Other PvMP-related information

The progress bar can be resized and configured to suit different UI layouts.

---

### PvMP Statistics

PvMP+ maintains extensive statistics for your character.

Statistics include:

* Killing Blows
* Deaths
* Tracks
* Infamy / Renown
* Commendations
* Daily statistics
* Hourly statistics
* 10-minute statistics
* Monthly statistics
* Historical statistics
* Maximum daily gains
* Maximum monthly gains
* Killing Blow / Death ratios

Statistics can also be displayed using graphs and charts.

---

### Killing Blow Log

PvMP+ includes a detailed Killing Blow log.

The log allows you to:

* Track recent Killing Blows
* Search recorded kills
* Sort entries
* Track player names
* Filter NPCs and pets
* Track Session Play kills separately
* View historical Killing Blow information

Session Play Killing Blows can be recorded in the log without incorrectly increasing the total Killing Blow count used for progression tracking.

---

### Recent Hits

The Recent Hits window provides information about recent combat activity.

It can be used to monitor:

* Recent attacks
* Killing Blows
* Nearby enemies
* Player names
* NPC filtering
* Pet filtering
* Stealth-related activity

The window can be enabled, disabled and positioned independently.

---

### Ettenmoors Map

PvMP+ includes an enhanced Ettenmoors map.

The map provides information about:

* Keeps
* Outposts
* Forward Camps
* Map-in locations
* Notable landmarks
* PvMP hotspots
* Player position callouts
* Map travel locations

The map can also be accessed using:

```text
/pvmp+ map
```

German:

```text
/pvmp+ karte
```

French:

```text
/pvmp+ carte
```

---

### PvMP Callouts

PvMP+ can provide location callouts based on known Ettenmoors locations.

This allows players to communicate enemy positions using familiar landmarks and locations.

The plugin also supports sharing PvMP-related information through supported chat channels.

---

### Alerts

PvMP+ provides a variety of configurable alerts.

Depending on the current configuration, these may include:

* Creature detection
* Stealth detection
* Being tracked
* Battle Tasks
* Lootboxes
* Commendation warnings
* Other PvMP events

Alerts can be enabled or disabled through the settings.

---

### PvMP Buff Tracking

The plugin can track various PvMP-related buffs, including:

* Keep control
* Outpost control
* Relics
* Outnumbered buffs
* Delving / DoF buffs
* Map control buffs
* PvMP bonus percentages

Some information is limited by what the LOTRO client exposes to plugins.

---

## Localisation

PvMP+ Revisited has support for multiple LOTRO client languages.

Currently supported or included:

* English
* German
* French
* Russian

Russian support may be limited depending on the current LOTRO client/API.

Translations are community-maintained and may occasionally require updating following LOTRO localisation changes.

If you find an incorrect or missing translation, please report it through the repository's issue tracker.

---

## Installation

1. Download the latest release from the **Releases** section of this repository.
2. Extract the plugin folder.
3. Place the plugin inside your LOTRO Plugins directory.

The resulting directory should look similar to:

```text
Documents
└── The Lord of the Rings Online
    └── PluginData
    └── Plugins
        └── PvMP_Plus
```

If you already have an older version installed, it is recommended to back up your existing plugin and PluginData before upgrading.

---

## Existing PvMP+ Data

PvMP+ stores player statistics and configuration data in the LOTRO PluginData directory.

When upgrading from an existing compatible version, your existing PvMP+ data should normally be retained.

If the plugin reports corrupted or unreadable data, make a backup of your PluginData before attempting to remove or restore the affected files.

---

## Known Issues

Some limitations are caused by the LOTRO client or the information exposed through the plugin API rather than the plugin itself.

For example:

* Certain PvMP buff timers cannot be determined until the relevant buff is observed by the client.
* Some information may only become accurate after entering the Ettenmoors or logging in again.
* Language support may require updates following LOTRO localisation changes.
* Client updates may change combat log formatting and require parser updates.

Known issues will be documented in the repository's **Issues** section.

---

## Development

PvMP+ is written using the LOTRO Lua Plugin API.

The repository is intended to make continued development easier by keeping the source code available for:

* Bug fixes
* LOTRO compatibility updates
* PvMP system changes
* Localisation updates
* UI improvements
* Community contributions

Pull requests and issue reports are welcome.

When submitting an issue, please include:

* LOTRO client language
* Character side (Freep/Creep)
* LOTRO server
* Plugin version
* Relevant error message
* Steps required to reproduce the problem
* Any relevant screenshots or logs

---

## Disclaimer

This is a **third-party LOTRO plugin**.

It is not affiliated with, endorsed by, or officially supported by Standing Stone Games or Warner Bros. Interactive Entertainment.

*The Lord of the Rings Online* and related trademarks are property of their respective owners.

---

## Original Projects

**PvMP+ by Glubby**

https://www.lotrointerface.com/downloads/info728-PvMP.html

**PvMP+ Revisited by Urundus**

https://www.lotrointerface.com/downloads/info1199-PvMPRevisited.html

This project acknowledges and preserves the work of both original authors.

---

## Contributing

Contributions are welcome.

If you have:

* Bug fixes
* Compatibility fixes
* Translation updates
* New PvMP features
* UI improvements
* Documentation improvements

feel free to open an issue or submit a pull request.

Please provide a clear description of the change and, where possible, test it in-game before submitting.

---

## Licence

Please refer to the repository's licence and the original plugin's distribution terms before redistributing modified versions of the code.

The original PvMP+ and PvMP+ Revisited projects remain the work of their respective authors.

**Credit should always be retained when modifying or redistributing this project.**
