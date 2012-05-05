# Node.js interface to systembolaget.se's webservices
Request      = require 'request'
XmlStream    = require 'xml-stream'
{EventEmitter} = require 'events'
_            = require 'underscore'
project      = require './projections'
{Store}      = require '../persistence/models'

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
      new Store
        id:
          element.Nr
        name:
          element.Namn
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
          ]).filter((a) -> not empty a)
        phone:
          element.Telefon  # Filter out non numerals?
        testing:
          element.Tjanster == 'Dryckesprovning'
        open:
          openingHours element.Oppettider
        coordinate:
          if (empty element.RT90x) || (empty element.RT90y)
            null
          else
            project.RT90toWGS84 element.RT90x, element.RT90y

openingHours = (str) ->
  _
  .chain(str.split '_*')
  .map((dayStr) -> dayStr.split ';')
  .map((df) ->
    date = df[0]
    closed = df[5] == '1'
    if closed || empty date
      undefined
    else
      d = {}
      d.date = date
      if not empty df[1]
        d.opens = df[1]
      if not empty df[2]
        d.closes = df[2]
      if not empty df[3]
        d.lunchFrom = df[3]
      if not empty df[4]
        d.lunchTo = df[4]
      return d)
  .filter((d) -> d?)
  .value()

empty = (str) -> !str? || str.trim() == ''


exports.Stores = Stores