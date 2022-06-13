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

  it 'creates the shift' do
    key = double("key", num: "01552", a_key: "01", b_key: "15", c_key: "55", d_key: "52")
    offset = double("offset", a_key: "2", b_key: "4", c_key: "6", d_key: "4")
    expect(@shift.create_shift(key, offset)).to eq("3196156")
  end

  it 'has a key' do
      expect(@shift.key).to eq(@key)
  end

  it 'has an offset' do
      expect(@shift.offset).to eq(@offset)
  end

  it 'assigns shifts' do
    expect(@shift.a_shift).to eq(3)
    expect(@shift.b_shift).to eq(19)
    expect(@shift.c_shift).to eq(61)
    expect(@shift.d_shift).to eq(56)
  end

  it 'has key keys' do
    expect(@shift.key.a_key).to eq("01")
    expect(@shift.key.b_key).to eq("15")
    expect(@shift.key.c_key).to eq("55")
    expect(@shift.key.d_key).to eq("52")
  end

  it 'has offset keys' do
    expect(@shift.offset.a_key).to eq("2")
    expect(@shift.offset.b_key).to eq("4")
    expect(@shift.offset.c_key).to eq("6")
    expect(@shift.offset.d_key).to eq("4")
  end
end
