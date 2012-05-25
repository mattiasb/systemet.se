module.exports =
  Services:
    name:    'systemet-rest'
    version: '0.0.1'
    port:    1337
    enabled: true
    maxDistance: 0.07
  Jobs:
    enabled: false
  Sync:
    recurrence:
      second: [0,30]
      # hour: 4
      # minute: 30
    urls:
      storeService:
        'http://www.systembolaget.se/Assortment.aspx?butikerombud=1'
    onStartup: true
  Persistence:
    mongodb:
      url: 'mongodb://localhost:1338/systemet'