mongoose = require 'mongoose'

exports.connect = (config, cb) ->
  mongoose.connection.on 'open', ->
    cb()
  mongoose.connection.on 'error', (err) ->
    console.error "[Mongoose]: #{err}"
  mongoose.connect config.Persistence.mongodb.url