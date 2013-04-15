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
  date: Date
  creator: [String]
  mediatype: [String]
  col: [String]
  description: [String]
  subject: [String]
  pick: [String]
  publicdate: [String]
  addeddate: [String]
  updater: [String]
  updatedate: [String]
  venue: [String]
  coverage: [String]
  source: [String]
  lineage: [String]
  taper: [String]
  transferer: [String]
  runtime: [String]
  md5s: [String]
  notes: [String]
  reviews:
    reviews: [
      reviewbody: String
      reviewtitle: String
      reviewer: String
      reviewdate: String
    ]
  avg: type: Number, default: 0
  total_reviews: type: Number, default: 0
  _songs: [ type: Schema.Types.ObjectId, ref: 'Song' ]
  _year: type: Schema.Types.ObjectId, ref: 'Year'
  _day: type: Schema.Types.ObjectId, ref: 'Day'

Show = mongoose.model 'Show', showSchema
