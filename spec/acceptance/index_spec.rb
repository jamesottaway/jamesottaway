require 'spec_helper'

describe 'index' do
  before :all do
    visit :index
  end
  
  it 'should have my name as the title' do
    on(:index) { |page| page.title.should == 'James Ottaway' }
  end
  
  it 'should include my name in the header' do
    on(:index) { |page| page.header.should include 'James Ottaway' }
  end
  
  [:bio, :online, :contact_me].each do |section|
    it "should have a #{section} div" do
      on(:index) { |page| page.send("#{section}_div").should exist }
    end
  end
  
  it 'should include my name in the footer' do
    on(:index) { |page| page.footer.should include 'James Ottaway' }
  end
end