require 'sinatra/base'

module JamesOttaway
  module ViewHelpers
    def css href
      { :rel => 'stylesheet', :href => href, :type => 'text/css' }
    end

    def openid type, href
      { :rel => "openid.#{type}", :href => href }
    end

    def email address, text = address
      "<a href='mailto:#{address}'>#{text}</a>"
    end

    def link href, text
      id = to_slug text
      "<a href='#{href}' id='#{id}'>#{text}</a>"
    end

    private
    
    def to_slug input
      input = input.strip.downcase
      input = input.gsub(/[']+/, '').gsub(/\W+/, ' ').gsub(' ', '-')
    end
  end

  Sinatra::helpers ViewHelpers
end
