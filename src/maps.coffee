# Description:
#   Ingress IntelMAP search location commands for Hubot
#
# Configuration:
#   HUBOT_YAHOO_API_KEY (required)
#   http://developer.yahoo.co.jp/webapi/map/openlocalplatform/v1/localsearch.html
#
# Commands:
#   hubot intelmap (for|me) <location> - get intelmap url, #ingress

module.exports = (robot) ->

  robot.respond /(intelmap|intel)(?: (for|me))?\s(.*)/i, (msg) ->
    params =
      appid: process.env.HUBOT_YAHOO_API_KEY
      query: msg.match[3]
      output: 'json'

    msg.http('http://search.olp.yahooapis.jp/OpenLocalPlatform/V1/localSearch').query(params)
      .get() (err, res, body) ->
        body = JSON.parse body
        try
          result =
            address: body.Feature[0].Property.Address
            coords: {
              lat: body.Feature[0].Geometry.Coordinates.split(',')[1]
              lng: body.Feature[0].Geometry.Coordinates.split(',')[0]
            }
        catch err
          console.error body.Error.Message if body.Error?
          return msg.send "Could not find #{params.location}"
        msg.send result.address + "\nhttps://www.ingress.com/intel?ll=" + encodeURIComponent(result.coords.lat) + "," + encodeURIComponent(result.coords.lng) + "&z=17"
