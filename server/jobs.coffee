schedule = require "node-schedule"

exports.setup = (synchronizer, config) ->
  # DB-sync
  schedule.scheduleJob config.Sync.recurrence, () ->
    synchronizer.sync()