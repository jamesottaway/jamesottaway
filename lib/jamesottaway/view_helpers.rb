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
      link("mailto:#{address}", text)
    end

    def xmpp address, text = address
      link("xmpp:#{address}", text)
    end

    def link href, text
      "<a href='#{href}'>#{text}</a>"
    end
  end

  Sinatra::helpers ViewHelpers
end
