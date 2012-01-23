exports.Config =
  Services:
    port: 1337
  Sync:
    recurrence:
      second: [0,30]
#      hour: 4
#      minute: 5
    urls:
      storeService: 'http://www.systembolaget.se/Assortment.aspx?butikerombud=1'
