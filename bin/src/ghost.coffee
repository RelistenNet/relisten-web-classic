#!/usr/bin/env coffee
program = require 'commander'
async = require 'async'
fs = require 'fs'
_ = require 'underscore'
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
      subsonic.folder f.id, (err, folder) ->
        dates = [0]
        for j in folder.children
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
          show = new Show j
          show.save()
          subsonic.folder j.id, (err, folder) ->
            for k in folder.children
              date = extractDate k.album
              k.month = date.month if date
              k.day = date.day if date
              k.year = date.year if date
              #console.log 'song saved', k.title
              console.log 'fail', k.title unless k.month > 0 || k.day > 0

              song = new Song k
              song.save()

## CLI ##

program
  .version('0.1')

program
  .command('years [id]')
  .description('\nUpdate the year list. If no folder id is provided, 32 will be default.')
  .action(getYears)

program.parse process.argv
