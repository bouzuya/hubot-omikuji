# Description
#   omikuji
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_OMIKUJI_INITIAL_DATA
#
# Commands:
#   hubot omikuji [<type>] - display omikuji
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  robot.respond /omikuji(\s+(\S+))?\s*$/i, (res) ->
    data = JSON.parse(process.env.HUBOT_OMIKUJI_INITIAL_DATA ? '{}')
    data.default = data.default ? ["凶", "吉", "大吉"]
    type = res.match[2] ? 'default'
    res.send res.random(data[type])
