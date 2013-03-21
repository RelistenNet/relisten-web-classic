{ Schema } = mongoose = require 'mongoose'

blurbSchema = new Schema
  body: String
  _song: type: Schema.Types.ObjectId, ref: 'Song'
  _playlist: type: Schema.Types.ObjectId, ref: 'Playlist'
  _user: type: Schema.Types.ObjectId, ref: 'User'

Blurb = mongoose.model 'Blurb', blurbSchema
