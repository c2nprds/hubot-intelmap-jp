Hubot IntelMap.JP
==========
A Hubot script for searching Ingress,IntelMap url via Yahoo.JP

Installing
----------
```
npm install hubot-intelmap-jp --save
```
Then add **hubot-intelmap-jp** to your external-scripts.json:
```
[
  "hubot-intelmap-jp"
]
```

Environment Variables
---------------------
Follow the instructions for obtaining an API key here:
http://developer.yahoo.co.jp/webapi/map/openlocalplatform/v1/localsearch.html

Once you have an API key, set it as the value for the `HUBOT_YAHOO_API_KEY` environment variable.

Usage
-----
```
hubot intelmap me <query> - Returns a intelmap view of the area returned by `query`.
```
