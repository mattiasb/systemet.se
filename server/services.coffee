models = require './persistence/models'
restify = require 'restify'
config = require './config'

class MongoService
  constructor: (@model) ->

  respond: (query, res, next) ->
    @model.find query, (err, response) ->
      if err?
        next(new restify.ResourceNotFoundError(""))
      else
        res.send response
        next()

class StoreService extends MongoService
  constructor: -> super models.Store

  getNear: (req, res, next) ->
    lon = parseFloat req.query.lon
    lat = parseFloat req.query.lat
    radius = parseFloat req.query.radius
    maxDistance =
      if isNaN maxDistance
        config.Services.maxDistance
      else
        maxDistance
    if isNaN lon or isNaN lat
      next(new restify.MissingParameterError("Need lat- and lon-parameters"))
    else
      query = coordinate: { $near: [lon, lat], $maxDistance: maxDistance }
      @respond query, res, next

  getAll: (req, res, next) =>
    if req.query.lon? or req.query.lat?
      @getNear req, res, next
    else
      @respond {}, res, next

  get: (req, res, next) =>
    if req.params.id?
      next(new ResourceNotFoundError(""))
    else
      @respond { id: req.params.id }, res, next

class Services
  constructor: ->
    @stores = new StoreService
    @server = restify.createServer
      name: config.Services.name
      version: config.Services.version
    @server.use(restify.acceptParser @server.acceptable)
    @server.use(restify.queryParser {mapParams: false})

  setupRoutes: ->
    @server.get '/store/:id', @stores.get
    @server.get '/stores/'  , @stores.getAll

  start: ->
    @server.listen config.Services.port

  # TODO: Test these!
  # restart: (cb) ->
  #   @stop => cb => @start()
  # stop: (cb) ->
  #   @server.close ->
  #     cb
exports.Services = Services