require 'spec_helper'

RSpec.describe do
  before :each do
    @offset = Offset.new("011092")
    @key = Key.new("01552")
    @shift = Shift.new(@key, @offset)
  end

  it 'exists' do
    expect(@shift).to be_instance_of Shift
  end

  it 'creates the shifts' do
    expect(@shift.create_shift(@key, @offset)).to eq("3196156")
  end

  it 'assigns shifts' do
    expect(@shift.a_shift).to eq(3)
    expect(@shift.b_shift).to eq(19)
    expect(@shift.c_shift).to eq(61)
    expect(@shift.d_shift).to eq(56)
  end
end
