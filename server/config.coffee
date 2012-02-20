module.exports =
  Services:
    port:    1337
    enabled: false
  Jobs:
    enabled: false
  Sync:
    recurrence:
      second: [0,30]
#      hour: 4
#      minute: 5
      #hour: 4
      # minute: 30
    urls:
      storeService: 'http://www.systembolaget.se/Assortment.aspx?butikerombud=1'
