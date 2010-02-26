helpers do
  def css(href)
    {:rel => "stylesheet", :href => href, :type => "text/css"}
  end
  
  def openid(type, href)
    {:rel => "openid.#{type}", :href => href}
  end
  
  def email(address, text = address)
    "<a href='#{address}'>#{text}</a>"
  end
  
  def site(href, text, id)
    "<a href='#{href}' id='#{id}'>#{text}</a>"
  end
end