# TODO

## Infrastructure
 - Set up hosting
 - Move to GitHub?

## Backend
 - Database backend
     - <del>[MongoDB][5] + [Mongoose][6]</del>
     - <del>Setup spatial support in MongoDB</del> ([An example][13])
     - Setup a complete model for Stores
     - Add some "last modified"-field
 - Services
     - XML and [MessagePack][2] serialization in addition to JSON.
     - Let clients choose from the above by the accept-header via [Leisure][3]
     - Use the database in the services
 - Sync database with [the supplied API][1]
     - <del>Set up [node-schedule][4] for configurable scheduled sync.</del>
     - <del>Use [Request][9]?</del>
     - <del>Make a class (StoreStream) that emits json objects of the stores</del>
     - <del>Make a real sync class that emits 'synced' 
       so that we can listen to that on startup</del>
     - Pass the objects from the systembolaget module classes to the Database in the synchronizer
         - Consider moving toModel() to Synchronization instead (SoC)
     - Only sync on startup if last sync is older than 24h
     - Sync to temp table and when done (with no failures) swap 
 - Cleanup
     - Think about using some functional lib
     - Think about how to use require (for example for the config data)
 - Admin Command Interface
     - Use dnode?
     - Manual DB sync. 
     - ...?
 - Logging and Error-reporting
 - Command line interface
     - --just-sync

## Frontend

### Web client
 - Set up a build environment
     - Needs support for easy development in debug mode. No recompiles etc.
     - Should be able to compile to a totally static site
         - Minification and combination with [Uglify-js][8]?
     - Use [Jen][10] or [Static][11] or hen/hem? 
     - Maybe I need something like [wr][12] too?
 - Show a map
     - <del>Get the map from Kartena working</del>
     - Get an OpenStreetmap map running
     - Think about alternatives
 - Find my position with [W3C Geolocation][7] in some magic way.
 - Fetch data from services
 - Print features on map (with info)

### Android client
 - Learn Android development :)

### Mobile web client
 - Do this even?

[1]:  http://www.systembolaget.se/Assortment.aspx?butikerombud=1
[2]:  https://github.com/pgriess/node-msgpack
[3]:  https://github.com/kevinswiber/leisure
[4]:  https://github.com/mattpat/node-schedule
[5]:  http://www.mongodb.org
[6]:  https://github.com/LearnBoost/mongoose
[7]:  http://www.w3.org/TR/geolocation-API/
[8]:  http://search.npmjs.org/#/uglify-js
[9]:  https://github.com/mikeal/request
[10]: https://github.com/rfunduk/jen
[11]: http://walmartlabs.github.com/static/
[12]: https://github.com/pmuellr/wr
[13]: https://github.com/fredrikmollerstrand/nodejs-mongodb-spatial-search
