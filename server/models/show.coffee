{ Schema } = mongoose = require 'mongoose'

showSchema = new Schema
  id: String
  month: Number
  day: Number
  year: Number
  version: Number
  title: String
  album: String
  server: String
  dir: String
  creator: Array
  mediatype: Array
  col: Array
  description: Array
  date: Array
  subject: Array
  pick: Array
  publicdate: Array
  addeddate: Array
  updater: Array
  updatedate: Array
  venue: Array
  coverage: Array
  source: Array
  lineage: Array
  taper: Array
  transferer: Array
  runtime: Array
  md5s: Array
  notes: Array
  reviews:
    info:
      num_reviews: Number
      avg_rating: String
    reviews: Array
  _songs: [ type: Schema.Types.ObjectId, ref: 'Song' ]
  _year: type: Schema.Types.ObjectId, ref: 'Year'

Show = mongoose.model 'Show', showSchema
