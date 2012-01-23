# Node.js interface to systembolaget.se's webservices
Request      = require 'request'
XmlStream    = require 'xml-stream'
EventEmitter = (require 'events').EventEmitter

# This should be one of the mongoose models
makeJson = (element) ->
  type:      element.Typ
  storeType: element.ButiksTyp
  number:    element.Nr
  name:      element.Namn
  address:   element.Address1 # concat all addresses later
  phone:     element.Telefon
  services:  element.Tjanster
  open:      undefined        # parse this later
  coordinate:                 # maybe transform to WGS84?
    x:       element.RT90x
    y:       element.RT90y

class StoreStream extends EventEmitter
  constructor: (url) ->
    @xmlStream = new XmlStream (new Request {uri:url})
    @xmlStream.on 'updateElement: ButikOmbud', (element) =>
      store = makeJson element
      @emit 'store', store
    @xmlStream.on 'error', (error) ->
      @emit 'error', error

exports.StoreStream = StoreStream