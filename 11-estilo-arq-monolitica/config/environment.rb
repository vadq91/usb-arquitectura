require 'bundler/setup'
Bundler.require

set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }

require_relative '../models/user'
require_relative '../models/task'
