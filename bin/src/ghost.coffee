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
Day = mongoose.model 'Day'

years = [1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995]

getZips = ->
  total = 8643
  Day.find().populate('_shows').stream().on 'data', (day) ->
    shows = estimate day._shows

    for show in shows

      Show.findOneAndUpdate
        _id: show._id
      , weighted_avg: show.weighted || 0
      , (err, new_show) ->
        console.log if err then err else --total

sum = (arr) ->
  _.reduce(arr, (memo, num) ->
    memo + num
  , 0)

average = (arr) ->
  sum(arr) / arr.length

estimate = (shows) ->
  averages = _.pluck shows, 'avg'
  ratings = _.pluck shows, 'total_reviews'

  avgAll = average averages
  ratingAll = average ratings

  output = []

  for show in shows
    if show.total_reviews == 0
      output.push 0
    else
      output.push _id: show._id, weighted: (ratingAll * avgAll) + (show.total_reviews * show.avg) / (ratingAll + show.total_reviews), avg: show.avg, total: show.total_reviews

  output


getYears = ->
  for f in years
    console.log f
    year = new Year year: f
    year.save()

getShows = ->
  Year.find (err, years) ->
    async.each years, (y, cb) ->
      Year.findById y._id, (err, year) ->
        archive.search
          q: "collection:GratefulDead date:[#{year.year}-01-01 TO #{year.year}-12-31]"
          rows: 1000
        , (err, folder) ->
          return cb() if err
          return cb() unless folder.response.docs.length
          dates = [0]
          async.each folder.response.docs, (j, callback) ->
            return callback() if j.format?.indexOf('VBR MP3') is -1 && j.format?.indexOf('Ogg Vorbis') is -1
            date = extractDate j.title
            return callback() unless date.month and date.day
            j.month = date.month if date.month
            j.day = date.day if date.day
            j.year = year.year
            return callback() unless j.year is year.year
            dateStr = "#{j.year}-#{j.month}-#{j.day}"
            j.date = new Date "#{j.month}/#{j.day}/#{j.year}"
            j.id = j.identifier
            j.col = j.collection
            i = _.reduce dates, (memo, val) ->
              return ++memo if val is dateStr
              memo
            dates.push dateStr
            #console.log j.month, j.day, j.year
            return callback() unless j.month > 0 || j.day > 0
            j.version = i
            j._year = year._id
            Song.findOneAndUpdate { id: j.id }, j, { }, (err, show) ->
              console.log err if err
              return callback() if err || !show
              year._shows.push show._id if year._shows.indexOf(show._id) is -1
              year.save()
              callback()
          , (err) ->
            console.log err if err
            console.log 'year', year.year
            cb()

    , (err) ->
      console.log err if err
      console.log 'DONE!!'

getDays = ->
  counter = 0
  Show.find (err, shows) ->
    return console.log err if err

    async.each shows, (s, cb) ->
      date =
        year: s.year
        month: s.month
        day: s.day
        date: s.date
        album: s.album
        venue: s.venue

      Day.findOneAndUpdate
        year: date.year
        month: date.month
        day: date.day
      , date
      , upsert: true
      , (err, day) ->
        return cb() if err
        day._shows.push s._id if day._shows.indexOf(s._id) is -1
        day.save()
        Show.findById s._id, (err, show) ->
          return cb() if err
          show._day = day._id
          show.save()
          Year.findOne year: show.year, (err, year) ->
            return cb() if err
            year._days.push day._id if year._days.indexOf(day._id) is -1
            year.save()
            console.log ++counter
            cb()
    , (err) ->
      console.log err if err
      console.log 'DONE!!!'

getSongs = ->
  counter = 0
  Show.find (err, shows) ->
    return console.log err if err

    async.each shows, (s, cb) ->
      Show.findById s._id, (err, show) ->
        return cb() if err
        archive.item show.id, (err, folder) ->
          return cb() if err
          return cb() unless _.size folder.files
          songs = [0]
          _.each _.pairs(folder.files), (arr) -> arr[1].file = arr[0]
          files = _.where folder.files, format: 'VBR MP3'
          oggFiles = _.where folder.files, format: 'Ogg Vorbis'
          unless files.length
            show.remove()
            return cb()
          show.server = folder.server
          show.dir = folder.dir
          show.reviews = folder.reviews
          show.avg = if folder.reviews and folder.reviews.info then folder.reviews.info.avg_rating else 0
          show.total_reviews = if folder.reviews and folder.reviews.info then folder.reviews.info.num_reviews else 0
          show.venue = folder.metadata.venue
          show.coverage = folder.metadata.coverage
          show.source = folder.metadata.source
          show.lineage = folder.metadata.lineage
          show.taper = folder.metadata.taper
          show.transferer = folder.metadata.transferer
          show.runtime = folder.metadata.runtime
          show.md5s = folder.metadata.md5s
          show.notes = folder.metadata.notes
          async.each files, (k, callback) ->
            return callback() unless k.title
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
            k.duration = timeStrToSec k.length
            return callback() unless k.duration > 0
            k.longSlug = slug + if k.version then '/' + k.version else ''
            k.longDay = k.day + if k.showVersion then '-' + k.showVersion else ''
            songs.push slug
            #console.log 'song saved', k.title
            console.log 'fail', k.title unless k.month > 0 || k.day > 0
            k._show = show._id
            k.url = '//archive.org/download/' + show.id + k.file
            if oggFiles.length
              k.oggUrl = '//archive.org/download/' + show.id + oggFiles.shift().file
            k.id = show.id + '::' + k.longSlug

            Song.findOneAndUpdate { year: k.year, month: k.month, longDay: k.longDay, showVersion: k.showVersion, longSlug: k.longSlug }, k, { }, (err, song) ->
              return callback() if err || !song
              console.log show._songs.indexOf(song._id), song if show._songs.indexOf(song._id) is -1
              show._songs.push song._id if show._songs.indexOf(song._id) is -1
              show.album = k.album
              show.save()
              callback()
          , (err) ->
            console.log 'done show', show.year, show.month, show.day, show.version, 'count:', ++counter
            cb err
    , (err) ->
      console.log err if err
      console.log 'DONE!!'


cleanSongs = ->
  i = 0
  console.log 'hi'
  Song.find (err, songs) ->
    for song in songs
      Song.findById(song._id)
        .populate('_show')
        .exec (err, song) ->
          song.id = song._show.id + song.longSlug
          return console.log song.id, 'test'
          song.save (err) ->
            console.log err if err
            console.log ++i

cleanShows = ->
  i = 0
  Show.find (err, shows) ->
    for show in shows
      Show.findById show._id, (err, show) ->
        return console.log show
        show.date = new Date "#{show.month}/#{show.day}/#{show.year}"
        show.save (err) ->
          console.log err if err
          console.log ++i

gd = ->
  archive.search { q: 'collection:GratefulDead', rows: 15 }, (err, dead) ->
    console.log dead.response.docs[0]


timeStrToSec = (str) ->
  duration = 0
  return duration unless str
  # Convert 3:45 to seconds
  for i, num of str.split(":").reverse()
    duration += num * Math.pow 60, i
  duration

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
  .command('days [id]')
  .description('\nUpdate the year list. If no folder id is provided, 32 will be default.')
  .action(getDays)

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

program
  .command('zips')
  .description('\nUpdate the year list. If no folder id is provided, 32 will be default.')
  .action(getZips)

# Infinite stack trace
Error.stackTraceLimit = Infinity

program.parse process.argv


## Mongo scripts
# Update song id from show.id + '##' + song.longSlug
# db.shows.find().forEach(function(show) {   db.shows.update({_id: show._id},{$set:{'avg': +(show.reviews.info.avg_rating),'reviews': +(show.reviews.info.num_reviews)} });
#
#
# db.songs.find().forEach(function (song) {
#     show = db.shows.findOne({_id:song._show});
#     db.songs.update({
#         _id: song._id
#     }, {
#         $set: {
#             url: 'https://www.archive.org/download/' + show.id + '/' + song.file
#         }
#     });
# });
##

