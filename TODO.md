# TODO

## Infrastructure
 - Set up hosting
 - Move to GitHub?

## Backend
 - Database backend
     - <del>[MongoDB][5] + [Mongoose][6]</del>
     - <del>Setup spatial support in MongoDB</del> ([An example][13])
     - <del>Setup a complete model for Stores</del>
         - <del>Store lon before lat ([Stackoverflow question][16])</del>
     - Store GeoJSON
 - Services
     - <del>Decide on a framework (restify)</del>
     - XML and [MessagePack][2] serialization in addition to JSON.
     - <del>Use the database in the services</del>
 - Sync database with [the supplied API][1]
     - <del>Set up [node-schedule][4] for configurable scheduled sync.</del>
     - <del>Use [Request][9]?</del>
     - <del>Make a class (StoreStream) that emits json objects of the stores</del>
         - <del>Parse open hours</del>
	 - <del>Transform coordinates to WGS84</del>
     - <del>Make a real sync class that emits 'synced' 
       so that we can listen to that on startup</del>
     - <del>Pass the objects from the systembolaget module classes to the Database in the synchronizer</del>
         - Consider moving toModel() to Synchronization instead (SoC)
     - <del>Sync on start</del>
         - Only sync on startup if last sync is older than 24h
     - Don't duplicate on sync. 
       	 - Sync to temp table and when done (with no failures) swap 
 - Cleanup
     - <del>Think about using some functional lib (underscore.js for now)</del>
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
     - Use [Jen][10] or [Static][11] or [hem][14]?
     - Maybe I need something like [wr][12] too?
 - Set up an MVC-framework
     - Use [SpineJS][15] or [Backbone.js][18]?
 - Use [Twitter Bootstrap][19]?
 - Show a map
     - <del>Get the map from Kartena working</del>
     - Get an OpenStreetmap map running
     - Think about alternatives
 - Find my position with [W3C Geolocation][7] in some magic way.
 - Fetch data from services
     - $.getJSON(function(){ $(document).ready(...)})
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
[14]: http://spinejs.com/docs/hem
[15]: http://spinejs.com/
[16]: http://stackoverflow.com/questions/7347686/geo-spatial-index-in-mongodb-with-node-js
[17]: http://mcavage.github.com/node-restify/
[18]: http://documentcloud.github.com/backbone/
[19]: http://twitter.github.com/bootstrap/
