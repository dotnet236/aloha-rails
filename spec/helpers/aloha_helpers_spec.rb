require 'spec_helper'

describe "Aloha::Rails::Helpers" do

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::JavaScriptHelper
  include Aloha::Rails::Helpers

  context "aloha_script_tag" do

    it "returns a javascript tag" do
      aloha_script_tag.should match(%r{<script.+type="text/javascript"></script>})
    end

    it "script src is '/assets/aloha/lib/aloha.js'" do
      aloha_script_tag.should match(%r{src="/assets/aloha/lib/aloha.js"})
    end

    context "without options" do
      it "inserts the default set of plugins as data tags" do
        Aloha::Rails.stub(:default_plugins) { %w(common/foo common/bar) }
        aloha_script_tag.should match(%{data-aloha-plugins="common/foo,common/bar"})
      end
    end

    context "plugins" do

      context "when passing :plugins" do
        it "uses the given plugins as data tags" do
          aloha_script_tag(:plugins => ['custom/foo', 'custom/bar']).should match(%r{data-aloha-plugins="custom/foo,custom/bar"})
        end

        it "uses no plugins if plugins is nil" do
          aloha_script_tag(:plugins => nil).should_not match(/data-aloha-plugins/)
        end
      end

    end

    context "extra_plugins" do
      it "appends the plugins to the default plugin list" do
        Aloha::Rails.stub(:default_plugins) { %w(foo/bar) }
        aloha_script_tag(:extra_plugins => [ 'custom/foo' ]).should match(%{data-aloha-plugins="foo/bar,custom/foo"})
      end

      it "removes default plugins if :plugins is set to nil" do
        aloha_script_tag(:plugins => nil, :extra_plugins => [ 'foobar' ]).should match('data-aloha-plugins="foobar"')
      end

    end

  end

  context "aloha_setup" do

    it "returns a javascript tag" do
      aloha_setup.should match(%r{<script type="text/javascript">})
    end

  end

  context "aloha!" do
    it "returns aloha_script_tag and aloha_setup" do
      self.should_receive(:aloha_script_tag).with(:extra_plugins => ['foo']) { "<script>" } 
      self.should_receive(:aloha_setup) { "<setup>" }
      aloha!(extra_plugins: ['foo']).should eq("<script><setup>")
    end
  end
end
