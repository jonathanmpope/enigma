require 'spec_helper'

RSpec.describe do
  before :each do
    @offset = Offset.new("011092")
    @key = Key.new("01552")
    @shift = Shift.new(@key, @offset)
    @message = Message.new("hello world end")
  end

    it 'exists' do
      expect(@message).to be_instance_of Message
    end

    it 'takes in a message' do
      expect(@message.info).to eq("hello world end")
    end

    it 'creates a character set' do
      expect(@message.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    end

end
