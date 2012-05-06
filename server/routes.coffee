response =

exports.get = (services) ->
  stores = new services.Stores
  (app) ->

    app.get '/store/:id', (req, res, next) ->
      stores.get req.params.id,
        (result) -> res.end(JSON.stringify result),
        (err) ->
          console.log("error")
          res.end("error")

    app.get '/stores/:latlng', (req, res, next) ->
      [lat, lng] = req.params.latlng.split ','
      stores.getNear { lon: parseFloat(lng), lat: parseFloat(lat) },
        (result) -> res.end(JSON.stringify result),
        (err) ->
          console.log("error")
          res.end("error")