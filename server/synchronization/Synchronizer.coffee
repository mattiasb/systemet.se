Systembolaget = require './systembolaget'
EventEmitter  = (require 'events').EventEmitter

# TODO: make this an EventEmitter
class Synchronizer extends EventEmitter
  # add persistence module reference here
  constructor: (urls) ->
    @urls = urls
    @stores = new Systembolaget.Stores @urls.storeService
    @stores.on 'error', (err) ->
      console.error "Synchronizer: #{err}"
    @stores.on 'done', => @emit 'done'

  syncStores: ->
    @stores.each (store) ->
      console.log store.name

  sync: (callback) ->
    if callback?
      @stores.once 'done', -> callback()
    @syncStores()

module.exports = Synchronizer
