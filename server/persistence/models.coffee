mongoose = require 'mongoose'
Schema   = mongoose.Schema

### Schemas ###
StoreSchema = new Schema
  id:      String
  name:    String
  type:
    type:  String
    enum:  ['SELF_SERVICE'
            'OVER_COUNTER'
            'AGENT']
  address: [String]
  phone:   String
  testing: Boolean
  open:    undefined # parse this later
  coordinate:        # Project to WGS84
    lon:   Number
    lat:   Number


### Person ###

exports.Store = mongoose.model 'Store', StoreSchema