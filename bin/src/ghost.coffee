program = require 'derby/node_modules/commander'
async = require 'async'
jsdom = require 'jsdom'
PhishAPI = require '../../src/api/external_apis/phish_net'

mongoose = require 'mongoose'
Schema = mongoose.Schema

## CLI ##

program
  .version('0.1')

program
  .command('year [year]')
  .description('\nUpdate the year list for a particular year. If no year is provided, 2012 will be default.')
  .action(getShows)

program.parse process.argv
