request = require 'request'
watchr = require 'watchr'
options =
  'method': 'POST'
  'json':
    "jsonrpc":"2.0"
    "method":"VideoLibrary.Scan"
    "id":1
watchr.watch
  paths: [ '.' ]
  listeners:
    change: (changeType, filePath, fileCurrentStat, filePreviousStat)->
      console.log "An #{changeType} occured on #{filePath}."
  next: (err,watchers)->
    console.log 'Watching for all our paths has completed.'
###
request.get 'http://192.168.1.4/jsonrpc', options, (error, response, body)->
  console.log body
  console.log 'status code: ' + response.statusCode
###
