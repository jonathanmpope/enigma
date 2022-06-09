require 'spec_helper'

RSpec.describe do
  before :each do
      @key = Key.new
    end

    it 'exists' do
      expect(@key).to be_instance_of Key
    end

    it 'creates a random five digit number' do
      expect(@key.num.length).to eq(5)
      expect(@key.num.class).to eq(String)
    end

end
