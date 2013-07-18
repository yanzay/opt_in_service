require './app'
require 'sinatra/activerecord/rake'

namespace :db do
  desc 'Load db seeds from db/seeds.rb'
  task :seed do
    load('./db/seeds.rb')
  end
end