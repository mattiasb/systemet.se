exports.get = (services) ->
  (app) ->
    app.get '/store/:id', (req, res, next) ->
      store = services.Store.get req.params.id
      res.end(JSON.stringify(store))
    # app.get '/stores/:lat/:lng', (req, res, next) ->
    #   store = services.Store.getByCoord req.params.coord
    #   res.end(JSON.stringify(store))
