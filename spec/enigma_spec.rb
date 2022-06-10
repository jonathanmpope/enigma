require 'spec_helper'

RSpec.describe do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of Enigma
  end

  it 'can encrypt a message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
                                    encryption: "keder ohulw",
                                    key: "02715",
                                    date: "040895"
                                   })
  end

  it 'can encrypt a message without the date provided' do
    today = Time.now.to_s
    y = today[2..3]
    m = today[5..6]
    d = today[8..9]
    date = m.concat(d).concat(y)
    hash = @enigma.encrypt("hello world", "02715", date)
    expect(@enigma.encrypt("hello world", "02715")).to eq({
                                    encryption: hash[:encryption],
                                    key: "02715",
                                    date: date
                                   })
  end

  it 'can encrypt a message without the date or key provided' do
    expect(@enigma.encrypt("hello world")[:key].length).to eq(5)
  end

  it 'can create keys if one is not passed in' do
     expect(@enigma.key_creator.length).to eq(5)
     expect(@enigma.key_creator.class).to eq(String)
  end

  it 'can create a date if one is not passed in' do
     expect(@enigma.date_gen.length).to eq(6)
     expect(@enigma.date_gen.class).to eq(String)
  end

  it 'can create key, offset, shift, and message objects' do
    expect(@enigma.object_creator("hello world", "02715", "040895").class).to eq(Shift)
  end

  it 'can encrypt the message - helper function' do
    @enigma.object_creator("hello world", "02715", "040895")
    expect(@enigma.encryption_process).to eq("keder ohulw")
  end

  it 'can encrypt the message - helper function - can deal with symbols' do
    expect(@enigma.encrypt("hello wor!d", "02715", "040895")[:encryption]).to eq("keder ohu!w")
  end

  it 'can encrypt the message - helper function - can deal with upper case letters' do
    expect(@enigma.encrypt("HELLO WORLD", "02715", "040895")[:encryption]).to eq("keder ohulw")
  end

  xit "can decrypt a message" do

  end

end
