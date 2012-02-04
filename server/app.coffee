##

config   = require("./config")
connect  = require "connect"
services = require "./persistence/services"
routes   = require("./routes").get services
jobs     = require "./jobs"
Synchronizer = require "./synchronization/Synchronizer"

##

# Sync on startup
# TODO: iff the db is older than 24 hours
#
synchronizer = new Synchronizer config.Sync.urls
synchronizer.sync ->
  jobs.setup synchronizer, config
  connect(
      connect.logger()
      connect.router routes
  ).listen config.servicePort