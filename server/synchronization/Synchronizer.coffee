{Stores}       = require './systembolaget'
{EventEmitter} = require 'events'

# TODO: make this an EventEmitter
class Synchronizer extends EventEmitter
  constructor: (urls) ->
    @urls = urls
    @stores = new Stores @urls.storeService
    @stores.on 'error', (err) ->
      console.error "Synchronizer: #{err}"

  syncStores: ->
    console.log "[sync started]"
    synced = 0
    @stores.each (store) ->
      store.save()
      synced++

    @stores.once 'done', -> console.log "[sync finished (#{synced})]"

  sync: (callback) ->
    if callback?
      @stores.once 'done', -> callback()
    @syncStores()

module.exports = Synchronizer
