request = require 'request'
watchr = require 'watchr'
winston = require 'winston'

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
      winston.info 'Indexing XBMC content started.'
    else
      winston.error 'Request to index XBMC content failed.', error

watchr.watch
  paths: config.pathsToWatch
  listeners:
    change: (changeType, filePath, fileCurrentStat, filePreviousStat)->
      winston.info "An #{changeType} occured on #{filePath}."
      rescanVideos()
  next: (err,watchers)->
    winston.info 'Watching for all our paths has completed.'
