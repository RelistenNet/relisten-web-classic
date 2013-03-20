#!/usr/bin/env coffee
program = require 'commander'
async = require 'async'
fs = require 'fs'
_ = require 'underscore'
slugs = require 'slugs'
extractDate = require './extract_date'

mongoose = require 'mongoose'

nconf = require 'nconf'
Subsonic = require 'subsonic'

nconf.argv()
  .env()
  .file(__dirname + '/../../config.json')
  .defaults
    GHOST_URI: 'mongodb://localhost/ghost'

mongoose.connect nconf.get('GHOST_URI')

# Bootstrap models
modelsPath = __dirname + '/../../server/models'
fs.readdirSync(modelsPath).forEach (file) ->
  require "#{modelsPath}/#{file}"

subsonic = new Subsonic
  username: nconf.get('USERNAME')
  password: nconf.get('PASSWORD')
  application: 'spreadsheet'
  server: nconf.get('SERVER')

Year = mongoose.model 'Year'
Show = mongoose.model 'Show'
Song = mongoose.model 'Song'

getYears = (id = 32) ->
  subsonic.folder id, (err, folder) ->
    for f in folder.children
      f.year = parseInt f.title if parseInt f.title
      year = new Year f
      console.log f.title
      year.save()

getShows = ->
  Year.find (err, years) ->
    years.map (y) ->
      Year.findById y._id, (err, year) ->
        subsonic.folder y.id, (err, folder) ->
          dates = [0]
          return null unless folder.children.length
          folder.children.map (j) ->
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

getSongs = ->
  Show.find (err, shows) ->
    shows.map (s) ->
      Show.findById s._id, (err, show) ->
        subsonic.folder s.id, (err, folder) ->
          return null unless folder.children?.length
          songs = [0]
          folder.children.map (k) ->
            return true unless k.album
            date = extractDate k.album
            k.month = show.month
            k.day = show.day
            k.year = show.year
            slug = slugs "#{k.title}"
            i = _.reduce songs, (memo, val) ->
              return ++memo if val is slug
              memo
            k.version = i
            k.slug = slug
            songs.push slug
            #console.log 'song saved', k.title
            console.log 'fail', k.title unless k.month > 0 || k.day > 0
            k._show = show._id
            song = new Song k
            show._songs.push song._id
            show.save()
            song.save()

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

program.parse process.argv
