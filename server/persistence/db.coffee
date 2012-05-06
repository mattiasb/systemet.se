mongoose = require 'mongoose'
models = require './models'


exports.connect = (config, cb) ->
  mongoose.connection.on 'open', ->
    # TODO: loop over all models
    models.Store.collection.remove ->
      cb()
  mongoose.connection.on 'error', (err) ->
    console.error "[Mongoose]: #{err}"
  mongoose.connect config.Persistence.mongodb.url