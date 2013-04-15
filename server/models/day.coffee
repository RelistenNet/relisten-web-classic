{ Schema } = mongoose = require 'mongoose'

daySchema = new Schema
  month: Number
  day: Number
  year: Number
  date: Date
  venue: String
  album: String
  show: Schema.Types.Mixed
  _shows: [ type: Schema.Types.ObjectId, ref: 'Show' ]

Day = mongoose.model 'Day', daySchema
