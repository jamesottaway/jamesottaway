class IndexPage < BasePage
  direct_url "http://localhost:9292/"
  
  div :header, :id => 'header'
  div :bio, :id => 'bio'
  div :online, :id => 'online'
  div :contact_me, :id => 'contact_me'
  div :footer, :id => 'footer'
end