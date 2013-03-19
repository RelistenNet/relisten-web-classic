{ Schema } = mongoose = require 'mongoose'

yearSchema = new Schema
  title: String
  id: Number
  parent: Number
  year: Number
  _shows: [ type: Schema.Types.ObjectId, ref: 'Show' ]

Year = mongoose.model 'Year', yearSchema
