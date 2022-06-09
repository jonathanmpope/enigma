require 'spec_helper'

RSpec.describe do
  before :each do
      @offset = Offset.new
      @offset_2 = Offset.new("011092")
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
      expect(@offset_2.date).to eq("011092")
    end

    it 'creates the offset numbers' do
      expect(@offset_2.offset_numbers).to eq("2464")
    end


  end
