require 'spec_helper'

RSpec.describe do
  before :each do
    @enigma = Enigma.new
    @enigma_2 = Enigma.new("message.txt", "encrypted.txt")
  end

  it 'exists' do
    expect(@enigma).to be_instance_of Enigma
  end

  it 'can have a from file argument' do
    expect(@enigma_2.from_file).to eq("message.txt")
  end

  it 'can have a to file argument' do
    expect(@enigma_2.to_file).to eq("encrypted.txt")
  end

  it 'can encrypt a message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
                                    encryption: "keder ohulw",
                                    key: "02715",
                                    date: "040895"
                                   })
  end

  it 'can encrypt a message with numbers' do
    expect(@enigma.encrypt("hello wor33", "02715", "040895")).to eq({
                                    encryption: "keder ohu33",
                                    key: "02715",
                                    date: "040895"
                                   })
  end

  it 'can can create a random key' do
    allow(@enigma).to receive(:key_creator).and_return("01234")
    expect(@enigma.encrypt("hello world")[:key]).to eq("01234")
  end

  it 'can can create a random key' do
    allow(@enigma).to receive(:date_generator).and_return("101214")
    expect(@enigma.encrypt("hello world")[:date]).to eq("101214")
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
    expect(@enigma.encrypt("hello world")[:date].length).to eq(6)
  end

  it 'can create keys if one is not passed in' do
     expect(@enigma.key_creator.length).to eq(5)
     expect(@enigma.key_creator.class).to eq(String)
  end

  it 'can create a date if one is not passed in' do
     expect(@enigma.date_generator.length).to eq(6)
     expect(@enigma.date_generator.class).to eq(String)
  end

  it 'creates the message, key, offset, and shift objects' do
    @enigma.object_creator("keder ohulw", "02715", "040895")
    expect(@enigma.shift.class).to eq(Shift)
    expect(@enigma.message.class).to eq(Message)
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
    expect(@enigma.print_message).to include(to_file)
  end

  it 'can print an enryption message' do
    @enigma.object_creator("keder ohulw", "02715", "040895")
    expect(@enigma.print_message).to include("Created")
  end

  it 'creates the shift' do
    @enigma.object_creator("keder ohulw", "01552", "011092")
    expect(@enigma.shift.create_shift(@enigma.shift.key, @enigma.shift.offset)).to eq("3196156")
  end

  it 'assigns shifts' do
    @enigma.object_creator("keder ohulw", "01552", "011092")
    expect(@enigma.shift.a_shift).to eq(3)
    expect(@enigma.shift.b_shift).to eq(19)
    expect(@enigma.shift.c_shift).to eq(61)
    expect(@enigma.shift.d_shift).to eq(56)
  end
end
