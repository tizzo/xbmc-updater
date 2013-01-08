# XBMC File Watcher and Scan Triggerer

While running XBMC on the [Raspberry Pi](http://www.raspberrypi.org) (using the excellent [RaspBMC](http://www.raspbmc.com) distribution) I had some issues using the [plugins](http://wiki.xbmc.org/index.php?title=Add-on:Library_watchdog) [available](http://wiki.xbmc.org/index.php?title=Add-on:XBMC_Library_Auto_Update) to scan network shares for new content due to resource constraints and instability.

I decided the simplest thing for my setup was to have a separate process watch the directory on the system that shares the files and to have that system trigger XBMC to re-scan for new videos via the [JSON API](http://wiki.xbmc.org/index.php?title=JSON-RPC_API).

## Installation

  1. Download and install [node.js](http://nodejs.org).
  2. Install coffee-script (`npm install -g coffee-script`).
  3. cd into the project directory and install the dependencies (`npm install`)
  4. Copy `example.config.json` to `config.json` and edit to taste
  5. Run using `coffee index.coffee`

## Deploy

I recommend deploying this node.js app [using upstart](http://howtonode.org/deploying-node-upstart-monit).
