$: << File.dirname(__FILE__) + '/lib'

require 'rubygems'
require 'sinatra'
require 'jamesottaway/view_helpers'
require 'haml'

get '/' do
  haml :index
end