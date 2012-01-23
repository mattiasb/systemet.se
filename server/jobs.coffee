schedule = require "node-schedule"
Sync     = (require "./sync").Sync

exports.setup = (sync, config) ->
  # DB-sync
  schedule.scheduleJob config.Sync.recurrence, () ->
    sync.run(config)