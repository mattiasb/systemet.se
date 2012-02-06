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
    xmlStream.on "updateElement: #{@elementName}",
      (element) => callback (@toModel element)
    xmlStream.on 'error', (error) =>
      @emit 'error', error
    xmlStream.on 'end', =>
      @emit 'done'

class Stores extends XmlToJsonModel
  constructor: (url) ->
    super url, 'ButikOmbud', (element) ->
      number:  element.Nr
      name:    element.Namn
      type:
        if element.Typ == 'Ombud'
          'AGENT'
        else if element.ButiksTyp == 'Försäljning över disk'
          'OVER_COUNTER'
        else
          'SELF_SERVICE'
      address: _.chain(
        [ element.Address1
          element.Address2
          element.Address3
          element.Address4
          element.Address5
        ]).map((a) -> a.trim())
          .filter((a) -> a? && a != "")
          .value()
      phone:   element.Telefon  # Filter out non numerals
      testing: element.Tjanster == 'Dryckesprovning'
      open:    []               # parse this later
      coordinate:   # project to WGS84
        lon:     12 # element.RT90x
        lat:     57 # element.RT90y

exports.Stores = Stores