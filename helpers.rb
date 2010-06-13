helpers do
  def css(href)
    {:rel => "stylesheet", :href => href, :type => "text/css"}
  end
  
  def openid(type, href)
    {:rel => "openid.#{type}", :href => href}
  end
  
  def email(address, text = address)
    "<a href='mailto:#{address}'>#{text}</a>"
  end
  
  def site(href, text, id = to_slug(text))
    "<a href='#{href}' id='#{id}'>#{text}</a>"
  end
  
  def to_slug(input)
    input = input.gsub(/[']+/, '')
    input = input.gsub(/\W+/, ' ')
    input = input.strip
    input = input.downcase
    input = input.gsub(' ', '-')
    input
  end
end