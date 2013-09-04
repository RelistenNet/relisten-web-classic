fs = require 'fs'
dive = require 'dive'


dir = '/Volumes/Spreadsheet/Spreadsheet Archive/Live Shows'
phish = "#{dir}/Phish"
mp3 = "#{dir}/mp3"

dive phish, (err, file) ->
	throw err if err
	return unless /\.txt$/.test file

	# temp
	return console.log file

	copyFile "#{phish}/file", "#{mp3}/file", (err) ->
		console.log "COPY ERR: " + err if err

copyFile = (source, target, cb) ->
  done = (err) ->
    unless cbCalled
      cb err
      cbCalled = true
  cbCalled = false
  rd = fs.createReadStream(source)
  rd.on "error", (err) ->
    done err

  wr = fs.createWriteStream(target)
  wr.on "error", (err) ->
    done err

  wr.on "close", (ex) ->
    done()

  rd.pipe wr