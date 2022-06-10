require 'spec_helper'

RSpec.describe do
  before :each do
      @offset = Offset.new
      @offset_2 = Offset.new("011092")
      date = Time.now.to_s
      y = date[2..3]
      m = date[5..6]
      d = date[8..9]
      @final = m.concat(d).concat(y)
      squared = @final.to_i**2
      @last_four = squared.to_s[-4..-1]
  end

  it 'exists' do
    expect(@offset).to be_instance_of Offset
  end

  it 'sets the date as today if none is provided' do
    expect(@offset.date).to eq(@final)
    expect(@offset_2.date).to eq("011092")
  end

  it 'creates the offset numbers' do
    expect(@offset.offset_numbers).to eq(@last_four)
    expect(@offset_2.offset_numbers).to eq("2464")
  end

  it 'creates an a key' do
    expect(@offset.a_key).to eq(@last_four[0])
    expect(@offset_2.a_key).to eq("2")
  end

  it 'creates a b key' do
    expect(@offset.b_key).to eq(@last_four[1])
    expect(@offset_2.b_key).to eq("4")
  end

  it 'creates a c key' do
    expect(@offset.c_key).to eq(@last_four[2])
    expect(@offset_2.c_key).to eq("6")
  end

  it 'creates a d key' do
    expect(@offset.d_key).to eq(@last_four[3])
    expect(@offset_2.d_key).to eq("4")
  end

  it 'can generate all the keys' do
    @offset_2.key_gen
    expect(@offset_2.a_key).to eq("2")
    expect(@offset_2.b_key).to eq("4")
    expect(@offset_2.c_key).to eq("6")
    expect(@offset_2.d_key).to eq("4")
  end

end
