require 'spec_helper'

module Refinery
  module Banners
    describe Banner do

      def reset_banner(options = {})
        @valid_attributes = {
          :id => 1,
          :name => "RSpec is great for testing too"
        }

        @banner.destroy! if @banner
        @banner = ::Refinery::Banners::Banner.create!(@valid_attributes.update(options))
      end

      before(:each) do
        reset_banner
      end

      context "validations" do
        
        it "rejects empty name" do
          ::Refinery::Banners::Banner.new(@valid_attributes.merge(:name => "")).should_not be_valid
        end

        it "rejects non unique name" do
          # as one gets created before each spec by reset_banner
          ::Refinery::Banners::Banner.new(@valid_attributes).should_not be_valid
        end
        
      end

    end
  end
end