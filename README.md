# XBMC Content Watcher and Updater

While running XBMC on the [Raspberry Pi](http://www.raspberrypi.org) (using the excellent [RaspBMC](http://www.raspbmc.com) distribution) I had some issues using the [plugins](http://wiki.xbmc.org/index.php?title=Add-on:Library_watchdog) [available](http://wiki.xbmc.org/index.php?title=Add-on:XBMC_Library_Auto_Update) to scan network shares for new content due to resource constraints and instability.

I decided the simplest thing for my setup was to have a separate process watch the directory on the system that shares the files and to have that system notify XBMC of new available files.

## Installation

  1. Download and install [node.js](http://nodejs.org).
  2. Install coffee-script (`npm install -g coffee-script`).
  3. Copy `example.config.json` to `config.json` and edit to taste
  4. Run using `coffee index.coffee`

## Deploy

I recommend deploying this node.js app [using upstart](http://howtonode.org/deploying-node-upstart-monit).
