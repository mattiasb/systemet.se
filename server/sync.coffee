exports.execute = () ->
  console.log("[#{timeString()}]: Implement sync!")

timeString = () ->
  d = new Date
  pad(d.getHours()) \
    + ":" \
    + pad(d.getMinutes()) \
    + ":" \
    + pad(d.getSeconds())


pad = (n) ->
  if n < 10
    "0#{n}"
  else
    "#{n}"