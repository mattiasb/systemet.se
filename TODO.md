# TODO

## Backend
 - Database backend
     - [MongoDB][5] + [Mongoose][6]
     - Setup spatial support in MongoDB
 - Services
     - XML and [MessagePack][2] serialization in addition to JSON.
     - Let clients choose from the above by the accept-header via [Leisure][3]
 - Use this database in services
 - Sync database with [the supplied API][1]
     - <del>Set up [node-schedule][4] for configurable scheduled sync.</del>
     - Use [Request][9]?

## Frontend
 - Set up a build environment
     - Needs support for easy development in debug mode. No recompiles etc.
     - Should be able to compile to a totally static site
         - Minification and combination with [Uglify-js][8]?
     - Use [Jen][10] or [Static][11]? 
     - Maybe I need something like [wr][12] too?
 - Show a map
     - <del>Get the map from Kartena working</del>
     - Get an OpenStreetmap map running
     - Think about alternatives
 - Find my position with [W3C Geolocation][7] in some magic way.
 - Fetch data from services
 - Print features on map (with info)
 

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