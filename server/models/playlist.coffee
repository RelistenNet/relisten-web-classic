{ Schema } = mongoose = require 'mongoose'

playlistSchema = new Schema
  name: String
  introduction: String
  closing: String
  _blurbs: [ type: Schema.Types.ObjectId, ref: 'Blurb' ]
  _songs: [ type: Schema.Types.ObjectId, ref: 'Song' ]
  _user: type: Schema.Types.ObjectId, ref: 'User'

Playlist = mongoose.model 'Playlist', playlistSchema
