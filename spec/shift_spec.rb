require 'spec_helper'

RSpec.describe do
  before :each do
    @shift = Shift.new
    @offset = Offset.new("011092")
    @key = Key.new("01552")
  end

    it 'exists' do
      expect(@shift).to be_instance_of Shift
    end

    it 'creates the shifts' do
      expect(@shift.create_shift(@key, @offset)).to eq("3196156")
    end
end
