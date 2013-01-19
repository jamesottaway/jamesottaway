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

    def xmpp address, text = address
      "<a href='xmpp:#{address}'>#{text}</a>"
    end

    def link href, text
      "<a href='#{href}'>#{text}</a>"
    end
  end

  Sinatra::helpers ViewHelpers
end
