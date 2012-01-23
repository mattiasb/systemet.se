Systembolaget = require './systembolaget'

# TODO: make this an EventEmitter
class Sync
  # add persistence module reference here
  constructor: (urls) ->
    @urls = urls

  syncStores: ->
    storeStream = new Systembolaget.StoreStream @urls.storeService
    storeStream.on 'store', (store) ->
      console.log store.name

  run: ->
    @syncStores()


exports.Sync = Sync
exports.sync = (config) ->
  sync = new Sync config.Sync.urls
  sync.run()
