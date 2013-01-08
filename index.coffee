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
      skip = false
      for type in config.fileTypesToExclude
        if filePath.search(".#{type}") != -1
          skip = true
      if not skip
        winston.info "An #{changeType} occured on #{filePath}."
        rescanVideos()
  next: (err,watchers)->
    winston.info "#{config.pathsToWatch.join(', ')} now watched for changes."
