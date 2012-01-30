require 'spec_helper'

describe "Config spec" do

  context "defaults" do
    it "has a set of sane plugins" do
      Aloha::Rails.default_plugins.should include('common/format')
      Aloha::Rails.default_plugins.should include('common/link')
      Aloha::Rails.default_plugins.should include('common/list')
    end
  end

  context "configuring" do
    it "should be configurable" do
      Aloha::Rails.default_plugins = ['foobar']
      Aloha::Rails.default_plugins.should == ['foobar']
    end
  end

end
