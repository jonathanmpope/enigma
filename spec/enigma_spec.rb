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
    date = (Time.now).strftime("%d%m%y")
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


  it 'can encrypt the message - can deal with symbols' do
    expect(@enigma.encrypt("hello wor!d", "02715", "040895")[:encryption]).to eq("keder ohu!w")
  end

  it 'can encrypt the message - can deal with upper case letters' do
    expect(@enigma.encrypt("HELLO WORLD", "02715", "040895")[:encryption]).to eq("keder ohulw")
  end

  it "can decrypt a message " do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({
                                    decryption: "hello world",
                                    key: "02715",
                                    date: "040895"
                                   })
  end

  it "can decrypt a message without a date input" do
    date = (Time.now).strftime("%d%m%y")
    hash = @enigma.decrypt("keder ohulw", "02715", date)
    expect(@enigma.decrypt("keder ohulw", "02715")).to eq({
                                    decryption: hash[:decryption],
                                    key: "02715",
                                    date: hash[:date]
                                   })
  end

  it 'can decrypt the message - can deal with symbols' do
    expect(@enigma.decrypt("keder ohu!w", "02715", "040895")[:decryption]).to eq("hello wor!d")
  end

  it 'can decrypt the message - can deal with upper case letters' do
    expect(@enigma.decrypt("KEDer ohulw", "02715", "040895")[:decryption]).to eq("hello world")
  end

  it 'can read a file using enc file read method' do
    from_file = 'test_read_file.txt'
    to_file = 'encrypted.txt'
    @enigma = Enigma.new(from_file, to_file)
    expect(@enigma.enc_file_read).to include("This is a test")
  end

  it 'can read a file using dec file read method' do
    from_file = 'test_read_file.txt'
    to_file = 'encrypted.txt'
    key = "05150"
    date = "052122"
    @enigma = Enigma.new(from_file, to_file)
    expect(@enigma.dec_file_read(key, date)).to include("This is a test")
  end

  it 'can write a file' do
    from_file = 'test_read_file.txt'
    to_file = 'encrypted.txt'
    @enigma = Enigma.new(from_file, to_file)
    @enigma.enc_file_read
    expect(@enigma.message).to include(to_file)
  end

  it 'can print an enryption message' do
    @enigma.object_creator("keder ohulw", "02715", "040895")
    @enigma.message
    expect(@enigma.message).to include("Created")
  end
end
