# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__),"support/**/*.rb")].each { |f| require f }

require 'watir-webdriver'
require 'watir-page-helper'

BROWSER = Watir::Browser.new ENV['WEB_DRIVER'] || :chrome

def visit page_class, &block
  on page_class, true, &block
end

def on page, visit=false, &block
  page_class = Object.const_get "#{page.capitalize}Page"
  page = page_class.new BROWSER, visit
  block.call page if block
  page
end

at_exit do
  BROWSER.close
end