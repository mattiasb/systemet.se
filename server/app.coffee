##

config   = require("./config")
connect  = require "connect"
services = require "./persistence/services"
routes   = require("./routes").get services
jobs     = require "./jobs"
Synchronizer = require "./synchronization/Synchronizer"
db       = require "./persistence/db"

##

# Sync on startup
# TODO:
#  - iff the db is older than 24 hours
#

db.connect config, ->
  synchronizer = new Synchronizer config.Sync.urls
  debugger
  if config.Sync.onStartup
    synchronizer.sync -> startApp()
  else
    startApp()

startApp = ->
  if config.Jobs.enabled
    jobs.setup synchronizer, config
  if config.Services.enabled
    connect(
      connect.logger()
      connect.router routes
    ).listen config.Services.port
