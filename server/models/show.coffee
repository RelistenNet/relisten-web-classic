{ Schema } = mongoose = require 'mongoose'

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

Show = mongoose.model 'Show', showSchema
