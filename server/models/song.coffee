{ Schema } = mongoose = require 'mongoose'

songSchema = new Schema
  month: Number
  day: Number
  year: Number
  slug: String
  version: Number, default: 0
  showVersion: Number, default: 0
  url: String
  oggUrl: String
  id: String
  longSlug: String
  longDay: String
  source: String
  creator: String
  title: String
  album: String
  track: String
  bitrate: String
  duration: String
  format: String
  original: String
  md5: String
  mtime: String
  size: String
  crc32: String
  sha1: String
  file: String
  _show: type: Schema.Types.ObjectId, ref: 'Show'

Song = mongoose.model 'Song', songSchema
