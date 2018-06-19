require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db',
  :timeout  => 1000)

require_all 'lib'

require_all 'app'
