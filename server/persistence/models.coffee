mongoose = require 'mongoose'
Schema   = mongoose.Schema

### PersonSchema ###
StoreSchema = new Schema
  number:  Number
  name:    String
  type:    String
    type:  [String]
    enum:  ['SELF_SERVICE'
            'OVER_COUNTER'
            'AGENT']
  address: [String]
  phone:   String
  testing: Boolean
  open:    undefined # parse this later
  coordinate:        # WGS 84
    lon:   Number
    lat:   Number


### Person ###

exports.Store = mongoose.model 'Store', StoreSchema