##

config   = require("./config").Config
connect  = require "connect"
services = require "./services"
routes   = require("./routes").get services
jobs     = require "./jobs"
Synchronizer     = require "./Synchronizer"

##

# Sync on startup
# TODO: iff the db is older than 24 hours
#
synchronizer = new Synchronizer config.Sync.urls
synchronizer.sync () ->
  jobs.setup synchronizer, config
  connect(
      connect.logger()
      connect.router routes
  ).listen config.servicePort