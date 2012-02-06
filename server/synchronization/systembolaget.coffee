# Node.js interface to systembolaget.se's webservices
Request      = require 'request'
XmlStream    = require 'xml-stream'
{EventEmitter} = require 'events'
_            = require 'underscore'

class XmlToJson extends EventEmitter
  constructor: (@url, @elementName, @toModel) ->
  each: (callback) ->
    xmlStream = new XmlStream (new Request @url)
    xmlStream.on "updateElement: #{@elementName}",
      (element) => callback (@toModel element)
    xmlStream.on 'error', (error) =>
      @emit 'error', error
    xmlStream.on 'end', =>
      @emit 'done'

class Stores extends XmlToJson
  constructor: (url) ->
    super url, 'ButikOmbud', (element) ->
      id:   element.Nr
      name: element.Namn
      type:
        if element.Typ == 'Ombud'
          'AGENT'
        else if element.ButiksTyp == 'Försäljning över disk'
          'OVER_COUNTER'
        else
          'SELF_SERVICE'
      address:
        _([ element.Address1
            element.Address2
            element.Address3
            element.Address4
            element.Address5
        ]).filter((a) -> a? && a.trim() != "")
      phone:   element.Telefon  # Filter out non numerals
      testing: element.Tjanster == 'Dryckesprovning'
      open:    openingHours element.Oppettider
      coordinate:               # project to WGS84
        lon:   12               # element.RT90x
        lat:   57               # element.RT90y

openingHours = (str) ->
  _
  .chain(str.split '_*')
  .map((dayStr) -> dayStr.split ';')
  .map((df) ->
    date:   df[0]
    opens:  df[1]
    closes: df[2]
    lunchFrom: df[3]
    lunchTo:   df[4]
    closed: df[5] == '1')
  .value()

exports.Stores = Stores