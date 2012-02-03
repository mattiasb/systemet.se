data = require "./data"

# exports.Store = {
#   getByCoord : (coord) -> data.Stores
#   get        : (id)    -> data.Stores[0]
# }

class StoresMock
  getNear: (coord) -> data.Stores
  get    : (id)    -> data.Stores[0]

exports.Store = StoresMock
