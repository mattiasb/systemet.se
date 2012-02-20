proj4js = require 'proj4js'

proj4js.defs['EPSG:2400'] =
  '+lon_0=15.808277777799999 +lat_0=0.0 +k=1.0 +x_0=1500000.0 ' +
  '+y_0=0.0 +proj=tmerc +ellps=bessel +units=m ' +
  '+towgs84=414.1,41.3,603.1,-0.855,2.141,-7.023,0 +no_defs';

RT90  = new proj4js.Proj('EPSG:2400');
WGS84 = proj4js.WGS84

exports.RT90toWGS84 = (x, y) ->
  point = proj4js.transform RT90, WGS84, (new proj4js.Point y, x)
  return {
    lon: point.x
    lat: point.y
#    alt: point.z
  }