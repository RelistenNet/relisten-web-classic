{ Schema } = mongoose = require 'mongoose'

playlistSchema = new Schema
  title: String
  introduction: String
  body: [ String ]
  closing: String
  _songs: [ type: Schema.Types.ObjectId, ref: 'Song' ]
  _user: type: Schema.Types.ObjectId, ref: 'User'

Playlist = mongoose.model 'Playlist', playlistSchema
