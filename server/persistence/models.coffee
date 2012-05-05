mongoose = require 'mongoose'
Schema   = mongoose.Schema

### Schemas ###
StoreSchema = new Schema
  id:          String
  name:        String
  type:
    type:      String
    enum:      ['SELF_SERVICE'
                'OVER_COUNTER'
                'AGENT']
  address:     [String]
  phone:       String
  testing:     Boolean
  open:
    date:      Date
    opens:     String
    closes:    String
    lunchFrom: String
    lunchTo:   String
  coordinate:
    lon:       Number
    lat:       Number


exports.Store = mongoose.model 'Store', StoreSchema