{ Schema } = mongoose = require 'mongoose'

showSchema = new Schema
  month: Number
  day: Number
  year: Number
  version: Number
  title: String
  server: String
  dir: String
  identifier: String
  reviews:
    info:
      num_reviews: Number
      avg_rating: String
    reviews: []
  _songs: [ type: Schema.Types.ObjectId, ref: 'Song' ]
  _year: type: Schema.Types.ObjectId, ref: 'Year'

Show = mongoose.model 'Show', showSchema
