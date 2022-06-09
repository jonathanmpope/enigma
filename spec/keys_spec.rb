require 'spec_helper'

RSpec.describe do
  before :each do
      @key = Key.new
    end

    it 'exists' do
      expect(@key).to be_instance_of Key
    end

end
