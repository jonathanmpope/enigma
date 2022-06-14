require 'spec_helper'

RSpec.describe do
  before :each do
    @shift = Shift.new("02715", "040895")
    @message = Message.new("hello world")
    @message_2 = Message.new("keder ohulw")
  end

  it 'exists' do
    expect(@message).to be_instance_of Message
  end

  it 'takes in a message' do
    expect(@message.info).to eq("hello world")
  end

  it 'creates a character set' do
    expect(@message.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'breaks the message into a hash of strings' do
    expect(@message.message_hash(@message.info)).to eq({0=>"h", 1=>"e", 2=>"l",  3=>"l", 4=>"o", 5=>" ",  6=>"w", 7=>"o", 8=>"r",  9=>"l",  10=>"d"})
  end

  it 'it has access to the message broken into a hash with index and letters as strings' do
    expect(@message.broken_up).to eq({0=>"h", 1=>"e", 2=>"l",  3=>"l", 4=>"o", 5=>" ",  6=>"w", 7=>"o", 8=>"r",  9=>"l",  10=>"d"})
  end

  it 'it has access to the character_set' do
    expect(@message.set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can encrypt the message - helper function' do
    expect(@message.encryption_process(@shift)).to eq("keder ohulw")
  end

  it 'can decrypt the message - helper function' do
    expect(@message_2.decryption_process(@shift)).to eq("hello world")
  end

  it 'can use decryption_logic' do
    index = 0
    letter = "k"
    expect(@message_2.decryption_logic(@shift, index, letter)).to eq("h")
  end

  it 'can use encryption_logic' do
    index = 0
    letter = "h"
    expect(@message.encryption_logic(@shift, index, letter)).to eq("k")
  end

  it 'can assign letters' do
    letter = "h"
    let_shift = 3
    expect(@message.let_assign(letter, let_shift)).to eq("k")
  end
end
