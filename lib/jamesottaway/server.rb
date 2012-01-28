require 'sinatra/base'
require 'view_helpers'
require 'haml'

class JamesOttaway::Server < Sinatra::Base
  set :root, File.dirname(__FILE__)+'/../..'

  helpers JamesOttaway::ViewHelpers

  get '/' do
    haml :index
  end
end
