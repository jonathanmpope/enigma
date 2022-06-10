require 'spec_helper'

RSpec.describe do
  before :each do
    @offset = Offset.new("011092")
    @key = Key.new("01552")
    @shift = Shift.new(@key, @offset)
    @message = Message.new("hello world end")
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of Enigma
  end

  xit 'can encrypt a message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
                                    encryption: "keder ohulw",
                                    key: "02715",
                                    date: "040895"
                                   })
  end

  it 'can create keys if one is not passed in' do
     expect(@enigma.key_creator.length).to eq(5)
     expect(@enigma.key_creator.class).to eq(String)
  end
end
