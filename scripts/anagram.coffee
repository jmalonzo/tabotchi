fs = require "fs"

module.exports = (robot) ->
  robot.respond /anagram (.+)/i, (msg) ->
    input = msg.match[1].toLowerCase()
    for word in fs.readFileSync("./data/words", "ascii").split("\n")
      if word.length == input.length and word.split('').sort().toString() == input.split('').sort().toString()
        return msg.send word
    msg.send msg.match[1]
