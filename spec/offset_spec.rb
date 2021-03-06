require 'spec_helper'

RSpec.describe do
  before :each do
      @offset = Offset.new("011092")
  end

  it 'exists' do
    expect(@offset).to be_instance_of Offset
  end

  it 'sets the date as today if none is provided' do
    expect(@offset.date).to eq("011092")
  end

  it 'creates the offset numbers' do
    expect(@offset.offset_numbers).to eq("2464")
  end

  it 'creates an a key' do
    expect(@offset.a_key).to eq("2")
  end

  it 'creates a b key' do
    expect(@offset.b_key).to eq("4")
  end

  it 'creates a c key' do
    expect(@offset.c_key).to eq("6")
  end

  it 'creates a d key' do
    expect(@offset.d_key).to eq("4")
  end

  it 'can generate all the keys' do
    @offset.offset_key_gen
    expect(@offset.a_key).to eq("2")
    expect(@offset.b_key).to eq("4")
    expect(@offset.c_key).to eq("6")
    expect(@offset.d_key).to eq("4")
  end
end
