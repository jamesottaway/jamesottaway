require 'rubygems'
require 'sinatra'
require 'sinatra/view_helpers'
require 'haml'

get '/' do
  haml :index
end