# MagiskHideDenyRestore

*Inspired by osm0sis from XDA*

A simple module to restore any apps you backed up, using the partner [MagiskHideDenyBackup module](https://github.com/adrianmmiller/MagiskHideDenyBackup), on new ROM flash

Restores items from /sdcard/MagiskList.txt to MagiskHide List or Deny List

**PLEASE NOTE:** 

- We (myself, Osm0sis, ipdev and pndwal) all tried to get this backup and restore functionality (along with backup/restore for the superuser list - i have modules for that too - see here: [Related Modules](#related-modules)) added natively to Magisk Manager via Magisk's Github, lets just say it was rejected, so here we are...
- These/There are **TWO** very discinct modules that work together, one backs up ([MagiskHideDenyBackup](https://github.com/adrianmmiller/MagiskHideDenyBackup)),
and one restores ([MagiskHideDenyRestore](https://github.com/adrianmmiller/MagiskHideDenyRestore)). 
You need **BOTH** modules. 

For the terminally lazy (like me), ive created a couple of simple magisk modules to backup and restore the 
packages and process you may have hidden via Magisk's MagiskHide (old magisk/custom) or Deny List (canary/alpha). 
In the old days, a trick (to essentially not have to retick all packages and process to hide - especially handy 
if you wanted to have the packages hidden before restoring your apps via something like Migrate, to make sure 
apps never had a chance to see root) was to simply backup /data/adb/magisk.db and restore it on ROM flashes. 
but with magisk.db schema changes this has now ceased to be a safe easy trick. 

So the way now (inspired by osm0sis from XDA) is to dump the list of packages and processes via the 

```magiskhide ls (or magisk --deny ls) ```

command to a text file and reimport it after a new ROM flash (assuming you have kept a copy off device if you do 
have to format data).

---
#### **If you havent yet created your backup, please see the [MagiskHideDenyBackup Module Repo](https://github.com/adrianmmiller/MagiskHideDenyBackup) for the partner module to create your backup**
---

---
## **MagiskHideDenyRestore Usage:**
---

1) Make sure /sdcard/MagiskList.txt exists and contains the packages and processes you want to hide/deny
2) If youre using a Magisk version with MagiskHide, please make sure to enable it before continuing. 
   Magisk with Deny List does not need to be enabled for restore to work
3) Install MagiskHideDenyRestore module from [Releases section](https://github.com/adrianmmiller/MagiskHideDenyRestore/releases/latest) via Magisk Manager or Fox Module Manager

	This:
	- Restores your magiskhide (or magisk deny) list from /sdcard/MagiskList.txt
	- Writes a log file to /sdcard/MagiskHideImportExport.log
5) Reboot

The module will remain installed, unless removed, after the process completes.

The only active file in the entire module is /common/install.sh, and it is commented.

It is safe to leave installed and ignored if you like.

Both modules should detect which magisk variety youre using by listing the magisk applets and finding either magiskhide, or not...

**Please note:** the included LICENSE **only** covers the module components provided by the excellent work of Zack5tpg's 
Magisk Module Extended, which is available for here for module creators

https://github.com/Zackptg5/MMT-Extended/


All other work is credited above and **no one may fork or re-present this module as their own for the purposes of trying to 
monetize this module or its content without all parties permission. The module comes specifically without an overall license 
for this intent.**


### Changelog ###

Please see: https://github.com/adrianmmiller/MagiskHideDenyRestore/blob/main/changelog.md

---

### **Related modules:**

SuperuserListBackup: https://github.com/adrianmmiller/SuperuserListBackup

SuperuserListRestore: https://github.com/adrianmmiller/SuperuserListRestore

---

### Project Stats ###

![GitHub release (latest by date)](https://img.shields.io/github/v/release/adrianmmiller/MagiskHideDenyRestore?label=Release&style=plastic)
![GitHub Release Date](https://img.shields.io/github/release-date/adrianmmiller/MagiskHideDenyRestore?label=Release%20Date&style=plastic)
![GitHub Releases](https://img.shields.io/github/downloads/adrianmmiller/MagiskHideDenyRestore/latest/total?label=Downloads%20%28Latest%20Release%29&style=plastic)
![GitHub All Releases](https://img.shields.io/github/downloads/adrianmmiller/MagiskHideDenyRestore/total?label=Total%20Downloads%20%28All%20Releases%29&style=plastic)
