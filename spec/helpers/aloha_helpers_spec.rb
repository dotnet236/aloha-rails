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
      it "inserts the default set of options as data tags" do
        aloha_script_tag.should match('data-aloha-plugins="common/format,common/table,common/list,common/link,common/block,common/undod,common/contenthandler,common/paste"')
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
        aloha_script_tag(:extra_plugins => [ 'custom/foo' ]).should match('data-aloha-plugins="common/format,common/table.*,custom/foo"')
      end

      it "removes default plugins if :plugins is set to nil" do
        aloha_script_tag(:plugins => nil, :extra_plugins => [ 'foobar' ]).should match('data-aloha-plugins="foobar"')
      end

    end

  end

end
