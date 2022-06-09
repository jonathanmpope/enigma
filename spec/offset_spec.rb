require 'spec_helper'

RSpec.describe do
  before :each do
      @offset = Offset.new
      # @offset_2 = Offset.new("011092")
    end

    it 'exists' do
      expect(@offset).to be_instance_of Offset
    end

    it 'sets the date as today if none is provided' do
      date = Time.now.to_s
      y = date[2..3]
      m = date[5..6]
      d = date[8..9]
      final = m.concat(d).concat(y)
      expect(@offset.date).to eq(final)
    end
  end
