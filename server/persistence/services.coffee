models = require "./models"

# exports.Store = {
#   getByCoord : (coord) -> data.Stores
#   get        : (id)    -> data.Stores[0]
# }

class StoresMock
  getNear: (coord) -> data.Stores
  get    : (id)    -> data.Stores[0]

class Stores

  getNear: (coord, cb, cberr) -> models.Store.find {
    coordinate: {
      $near: coord,
      $maxDistance: 0.07
    }
  }, (err, response) ->
    if err?
      cberr err
    else
      cb response

  get: (id, cb) -> models.Store.find { id: id }, (err, response) ->
    if err?
      cberr err
    else
      cb response


exports.Stores = Stores
