#!/usr/bin/env coffee
program = require 'commander'
async = require 'async'
extractDate = require './extract_date'

mongoose = require 'mongoose'
Schema = mongoose.Schema

nconf = require 'nconf'
Subsonic = require 'subsonic'

nconf.argv()
  .env()
  .file(__dirname + '/../../config.json')
  .defaults
    GHOST_URI: 'mongodb://localhost/ghost'

mongoose.connect nconf.get('GHOST_URI')

subsonic = new Subsonic
  username: nconf.get('USERNAME')
  password: nconf.get('PASSWORD')
  application: 'spreadsheet'
  server: nconf.get('SERVER')

## Schemas
songSchema = new Schema
  genre: String
  albumId: Number
  album: String
  track: Number
  parent: Number
  contentType: String
  isDir: Boolean
  type: String
  suffix: String
  isVideo: Boolean
  size: Number
  transcodedSuffix: String
  id: Number
  transcodedContentType: String
  title: String
  duration: Number
  artistId: Number
  created: String
  path: String
  year: Number
  artist: String
  bitRate: Number

setSchema = new Schema
  number: String
  songs: [songSchema]

setlistSchema = new Schema
  year: Number
  month: Number
  day: Number
  venue: String
  showid: Number
  notes: String
  footnotes: String
  city: String
  state: String
  country: String
  setlist: [setSchema]

showSchema = new Schema
  month: Number
  day: Number
  year: Number
  id: Number
  title: String
  album: String
  parent: Number
  artist: String
  coverArt: Number

yearSchema = new Schema
  title: String
  id: Number
  parent: Number
  shows: [showSchema]

Year = mongoose.model 'Year', yearSchema
Show = mongoose.model 'Show', showSchema
Song = mongoose.model 'Song', songSchema
Setlist = mongoose.model 'Setlist', setlistSchema

getYears = (id = 32) ->
  subsonic.folder id, (err, folder) ->
    for f in folder.children
      year = new Year f
      console.log f.title
      year.save()
      subsonic.folder f.id, (err, folder) ->
        for j in folder.children
          date = extractDate j.title
          j.month = date.month if date
          j.day = date.day if date
          j.year = date.year if date
          #console.log j.month, j.day, j.year
          console.log 'fail', j.title unless j.month > 0 || j.day > 0

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
