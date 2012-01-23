##

config   = require("./config").Config
connect  = require "connect"
services = require "./services"
routes   = require("./routes").get services
jobs     = require "./jobs"
sync     = require "./sync"

##

# Sync on startup
sync = new sync.Sync config.Sync.urls
sync.run()

# then setup jobs and routes. Should be done first
# when first sync goes through

jobs.setup sync, config

connect(
    connect.logger()
    connect.router routes
).listen config.servicePort

