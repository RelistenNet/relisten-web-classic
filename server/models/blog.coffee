{ Schema } = mongoose = require 'mongoose'

blogSchema = new Schema
  title: String
  body: String
  comments: [ type: Schema.Types.ObjectId, ref: 'Comment' ]
  _songs: type: Schema.Types.ObjectId, ref: 'Song'
  _playlist: type: Schema.Types.ObjectId, ref: 'Playlist'
  _user: type: Schema.Types.ObjectId, ref: 'User'

Blog = mongoose.model 'Blog', blogSchema
