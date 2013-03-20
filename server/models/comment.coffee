{ Schema } = mongoose = require 'mongoose'

commentSchema = new Schema
  body: String
  _blog: type: Schema.Types.ObjectId, ref: 'Blog'
  _playlist: type: Schema.Types.ObjectId, ref: 'Playlist'
  _user: type: Schema.Types.ObjectId, ref: 'User'

Comment = mongoose.model 'Comment', commentSchema
