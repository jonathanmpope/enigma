require 'spec_helper'

RSpec.describe do
  before :each do
      @offset = Offset.new
      # @offset_2 = Offset.new("011092")
    end

    it 'exists' do
      expect(@offset).to be_instance_of Offset
    end
  end
