require 'jamesottaway/view_helpers'

include JamesOttaway::ViewHelpers

describe JamesOttaway::ViewHelpers do
  describe '#css' do
    subject { css 'abc' }
    it { should == { :rel => 'stylesheet', :href => 'abc', :type => 'text/css' } }
  end
  
  describe '#openid' do
    subject { openid 'type', 'http://endpoint/' }
    it { should == { :rel => 'openid.type', :href => 'http://endpoint/' } }
  end
  
  describe '#email' do
    subject { email 'a@b.com', 'Mr A. B' }
    it { should == "<a href='mailto:a@b.com'>Mr A. B</a>" }
  end
  
  describe '#xmpp' do
    subject { xmpp 'me@xmpp.com', 'Mr. XMPP' }
    it { should == "<a href='xmpp:me@xmpp.com'>Mr. XMPP</a>" }
  end

  describe '#link' do
    subject { link 'http://some/app/', 'Some App' }
    it { should == "<a href='http://some/app/'>Some App</a>" }
  end
end
