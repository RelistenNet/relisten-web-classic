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
  version: type: Number, default: 0
  _songs: [ type: Schema.Types.ObjectId, ref: 'Song' ]
  _year: type: Schema.Types.ObjectId, ref: 'Year'

Show = mongoose.model 'Show', showSchema
