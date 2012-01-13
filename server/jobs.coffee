schedule = require "node-schedule"
sync     = require "./sync"

exports.setup = (config) ->
  # DB-sync
  schedule.scheduleJob config.Sync.recurrence, () ->
    sync.execute()