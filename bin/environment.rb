require 'bundler/setup'
require 'open-uri'

Bundler.require(:default)

require_relative "../lib/player"
require_relative "../lib/scraper"
require_relative "sql_runner"

@db = SQLite3::Database.new('../yankees_1920.db')
@db.execute("DROP TABLE IF EXISTS yankees_1920;")
@sql_runner = SQLRunner.new(@db)
@sql_runner.execute_schema_migration_sql

