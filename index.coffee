request = require 'request'
watchr = require 'watchr'
options =
  'method': 'POST'
  'json':
    "jsonrpc":"2.0"
    "method":"VideoLibrary.Scan"
    "id":1

config = require './config'

rescanVideos = ->
  request.get "#{config.xbmcHostname}/jsonrpc", options, (error, response, body)->
    if response.statusCode is 200
      console.log 'Indexing XBMC content started.'
    else
      console.log 'Request to index XBMC content failed.', error

watchr.watch
  paths: [ '.' ]
  listeners:
    change: (changeType, filePath, fileCurrentStat, filePreviousStat)->
      console.log "An #{changeType} occured on #{filePath}."
      rescanVideos()
  next: (err,watchers)->
    console.log 'Watching for all our paths has completed.'
