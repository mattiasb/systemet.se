# Node.js interface to systembolaget.se's webservices
Request      = require 'request'
XmlStream    = require 'xml-stream'
{EventEmitter} = require 'events'
_            = require 'underscore'
#_.mixin require('underscore.string').exports()

# Come up with a better name
class XmlToJsonModel extends EventEmitter
  constructor: (@url, @elementName, @toModel) ->
  each: (callback) ->
    xmlStream = new XmlStream (new Request @url)
    xmlStream.on "updateElement: #{@elementName}", (element) =>
      callback (@toModel element)
    xmlStream.on 'error', (error) =>
      @emit 'error', error
    xmlStream.on 'end', =>
      @emit 'done'

class Stores extends XmlToJsonModel
  constructor: (url) ->
    super url, 'ButikOmbud', (element) ->
      address = _.chain([
        element.Address1
        element.Address2
        element.Address3
        element.Address4
        element.Address5])
        .map((a) -> a.trim())
        .filter((a) -> a? && a != "")
        .foldl((s, a) -> [s, a].join '\n')
        .value()
      return {
        type:      element.Typ
        storeType: element.ButiksTyp
        number:    element.Nr
        name:      element.Namn
        address:   address
        phone:     element.Telefon
        services:  element.Tjanster
        open:      undefined        # parse this later
        coordinate:                 # maybe transform to WGS84?
          x:       element.RT90x
          y:       element.RT90y
      }

# class Products extends XmlToJsonModel
#   constructor: (url) ->
#     super url, 'ButikOmbud', (element) ->
#       type:      element.Typ
#       storeType: element.ButiksTyp
#       number:    element.Nr
#       name:      element.Namn
#       address:   element.Address1 # concat all addresses later
#       phone:     element.Telefon
#       services:  element.Tjanster
#       open:      undefined        # parse this later
#       coordinate:                 # maybe transform to WGS84?
#         x:       element.RT90x
#         y:       element.RT90y


exports.Stores = Stores