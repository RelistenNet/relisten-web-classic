#!/usr/bin/env coffee
program = require 'commander'
async = require 'async'
fs = require 'fs'
_ = require 'underscore'
slugs = require 'slugs'
extractDate = require './extract_date'

mongoose = require 'mongoose'

nconf = require 'nconf'
archive = require 'archive.org'

nconf.argv()
  .env()
  .file(__dirname + '/../../config.json')
  .defaults
    GD_URI: 'mongodb://localhost/gdspreadsheet'

mongoose.connect nconf.get('GD_URI')

# Bootstrap models
modelsPath = __dirname + '/../../server/models'
fs.readdirSync(modelsPath).forEach (file) ->
  require "#{modelsPath}/#{file}"

Year = mongoose.model 'Year'
Show = mongoose.model 'Show'
Song = mongoose.model 'Song'

years = [1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995]

getYears = ->
  for f in years
    console.log f
    year = new Year year: f
    year.save()

getShows = ->
  Year.find (err, years) ->
    output = {}
    years.map (y) ->
      Year.findById y._id, (err, year) ->
        setTimeout ->
          archive.search
            q: "collection:GratefulDead date:[#{year.year} TO #{year.year+1}]"
            rows: 1000
          , (err, folder) ->
            return null unless folder.response.docs.length
            dates = [0]
            folder.response.docs.map (j) ->
              return unless j.format
              if j.format.indexOf('VBR MP3') is -1
                return console.log j.format
              #console.log j.title
              date = extractDate j.title
              j.month = date.month if date
              j.day = date.day if date
              j.year = date.year if date
              dateStr = "#{j.year}-#{j.month}-#{j.day}"
              i = _.reduce dates, (memo, val) ->
                return ++memo if val is dateStr
                memo
              dates.push dateStr
              #console.log j.month, j.day, j.year
              console.log 'fail', j.title unless j.month > 0 || j.day > 0
              j.version = i
              j._year = year._id
              show = new Show j
              year._shows.push show._id
              year.save()
              show.save()
              console.log year.year unless output[year.year]
              console.log 'done' if _.size(output) is years.length - 1 and !output[show.year]
              output[year.year] = true


        , Math.random() * 20000

getSongs = ->
  output = []
  Show.find (err, shows) ->
    shows.map (s) ->
      Show.findById s._id, (err, show) ->
        setTimeout ->
          archive.item show.identifier, (err, folder) ->
            return console.log 'null' unless _.size folder.files
            songs = [0]
            _.each _.pairs(folder.files), (arr) -> arr[1].file = arr[0]
            files = _.where folder.files, format: 'VBR MP3'
            unless files.length
              show.remove()
              return console.log _.pluck folder.files, 'format'
            files.map (k) ->
              return true unless k.title
              k.month = show.month
              k.day = show.day
              k.year = show.year
              slug = slugs("#{k.title}").replace /\-$/, ''
              i = _.reduce songs, (memo, val) ->
                return ++memo if val is slug
                memo
              k.version = i
              k.showVersion = show.version
              k.slug = slug
              k.duration = k.length
              k.longSlug = slug + if k.version then '/' + k.version else ''
              k.longDay = k.day + if k.showVersion then '-' + k.showVersion else ''
              songs.push slug
              #console.log 'song saved', k.title
              console.log 'fail', k.title unless k.month > 0 || k.day > 0
              k._show = show._id
              k.url = 'http://' + folder.server + folder.dir + k.file
              song = new Song k
              show._songs.push song._id
              show.server = folder.server
              show.album = k.album
              show.dir = folder.dir
              show.save()
              song.save()
              console.log show.year unless output[show.year]
              console.log 'done' if _.size(output) is years.length - 1 and !output[show.year]
              output[show.year] = true
        , Math.random * 1000000


cleanSongs = ->
  i = 0
  Song.find (err, songs) ->
    for song in songs
      Song.findById song._id, (err, song) ->
        song.longSlug = song.slug + if song.version then '/' + song.version else ''
        song.longDay = song.day + if song.showVersion then '-' + song.showVersion else ''
        song.save (err) ->
          console.log err if err
          console.log ++i

cleanShows = ->
  i = 0
  Show.find (err, shows) ->
    for show in shows
      Show.findById show._id, (err, show) ->
        console.log show
        show.date = new Date "#{show.month}/#{show.day}/#{show.year}"
        show.save (err) ->
          console.log err if err
          console.log ++i

gd = ->
  archive.search { q: 'collection:GratefulDead', rows: 15 }, (err, dead) ->
    console.log dead.response.docs[0]


## CLI ##

program
  .version('0.1')

program
  .command('years [id]')
  .description('\nUpdate the year list. If no folder id is provided, 32 will be default.')
  .action(getYears)

program
  .command('shows [id]')
  .description('\nUpdate the year list. If no folder id is provided, 32 will be default.')
  .action(getShows)

program
  .command('songs [id]')
  .description('\nUpdate the year list. If no folder id is provided, 32 will be default.')
  .action(getSongs)

program
  .command('clean')
  .description('\nUpdate the year list. If no folder id is provided, 32 will be default.')
  .action(cleanSongs)

program
  .command('cleanShows')
  .description('\nUpdate the year list. If no folder id is provided, 32 will be default.')
  .action(cleanShows)

program
  .command('gd')
  .description('\nUpdate the year list. If no folder id is provided, 32 will be default.')
  .action(gd)

# Infinite stack trace
Error.stackTraceLimit = Infinity

program.parse process.argv

