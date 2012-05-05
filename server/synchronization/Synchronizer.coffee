{Stores}       = require './systembolaget'
{EventEmitter} = require 'events'

# TODO: make this an EventEmitter
class Synchronizer extends EventEmitter
  # add persistence module reference here
  constructor: (urls) ->
    @urls = urls
    @stores = new Stores @urls.storeService
    @stores.on 'error', (err) ->
      console.error "Synchronizer: #{err}"

  syncStores: ->
    @stores.each (store) ->
      if store.name? && store.name.trim() != ''
        console.log store.name
      console.log store
      console.log ''
      store.save()

  sync: (callback) ->
    if callback?
      @stores.once 'done', -> callback()
    @syncStores()

module.exports = Synchronizer
