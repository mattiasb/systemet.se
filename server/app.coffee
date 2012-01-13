##

config   = require("./config").Config
connect  = require "connect"
services = require "./services"
routes   = require("./routes").get services
jobs     = require("./jobs")

##

jobs.setup(config)

connect(
    connect.logger()
    connect.router routes
).listen config.servicePort

