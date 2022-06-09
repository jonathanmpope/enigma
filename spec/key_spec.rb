require 'spec_helper'

RSpec.describe do
  before :each do
      @key = Key.new
      @key_2 = Key.new("015523")
    end

    it 'exists' do
      expect(@key).to be_instance_of Key
    end

    it 'creates a random five digit number' do
      expect(@key.num.length).to eq(5)
      expect(@key.num.class).to eq(String)
      expect(@key_2.num).to eq("015523")
    end

    it 'creates an A key' do
      expect(@key.a_key.length).to eq(2)
      expect(@key.a_key.class).to eq(String)
      expect(@key_2.a_key).to eq("01")
    end

    it 'creates a B key' do
      expect(@key.b_key.length).to eq(2)
      expect(@key.b_key.class).to eq(String)
      expect(@key_2.b_key).to eq("15")
    end

    it 'creates a C key' do
      expect(@key.c_key.length).to eq(2)
      expect(@key.c_key.class).to eq(String)
      expect(@key_2.c_key).to eq("55")
    end

end
