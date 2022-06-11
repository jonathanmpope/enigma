require 'spec_helper'

RSpec.describe do
  before :each do
    @file_test = 'test_read_file.txt'
  end

  xit 'can read a file' do
    # file_mock = double(File, read: "This is a message")
    # allow(File).to receive(:open).and_call_original
    expect(file_read).to eq("This is a test")
  end
end
