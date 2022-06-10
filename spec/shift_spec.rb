require 'spec_helper'

RSpec.describe do
  before :each do
    @shift = Shift.new
    @offset = Offset.new
    @key = Key.new
  end

    it 'exists' do
      expect(@shift).to be_instance_of Shift
    end
end 
