{ Schema } = mongoose = require 'mongoose'
random = require 'mongoose-random'

daySchema = new Schema
  month: Number
  day: Number
  year: Number
  date: Date
  venue: String
  album: String
  show: Schema.Types.Mixed
  _shows: [ type: Schema.Types.ObjectId, ref: 'Show' ]

daySchema.plugin random()

Day = mongoose.model 'Day', daySchema
