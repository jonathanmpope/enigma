require 'spec_helper'

RSpec.describe do
  before :each do
      @key = Key.new("01552")
    end

    it 'exists' do
      expect(@key).to be_instance_of Key
    end

    it 'has a num variable' do
      expect(@key.num).to eq("01552")
    end

    it 'creates an A key' do
      expect(@key.a_key.length).to eq(2)
      expect(@key.a_key.class).to eq(String)
      expect(@key.a_key).to eq("01")
    end

    it 'creates a B key' do
      expect(@key.b_key.length).to eq(2)
      expect(@key.b_key.class).to eq(String)
      expect(@key.b_key).to eq("15")
    end

    it 'creates a C key' do
      expect(@key.c_key.length).to eq(2)
      expect(@key.c_key.class).to eq(String)
      expect(@key.c_key).to eq("55")
    end

    it 'creates a D key' do
      expect(@key.d_key.length).to eq(2)
      expect(@key.d_key.class).to eq(String)
      expect(@key.d_key).to eq("52")
    end
end
