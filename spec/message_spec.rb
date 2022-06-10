require 'spec_helper'

RSpec.describe do
  before :each do
    @offset = Offset.new("011092")
    @key = Key.new("01552")
    @shift = Shift.new(@key, @offset)
    @message = Message.new
  end

    it 'exists' do
      expect(@message).to be_instance_of Message
    end

end 
