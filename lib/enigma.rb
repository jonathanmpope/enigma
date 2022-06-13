require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'

class Enigma

  def initialize(from_file = nil, to_file = nil)
    @from_file = from_file
    @to_file = to_file
  end

  def encrypt(info, key = key_creator, date = date_gen)
    object_creator(info, key, date)
    @encryption = {
      encryption: @message.encryption_process(@shift),
      key: @key.num,
      date: @offset.date
    }
  end

  def decrypt(info, key, date = date_gen)
    object_creator(info, key, date)
    @decryption = {
      decryption: @message.decryption_process(@shift),
      key: @key.num,
      date: @offset.date
    }
  end

  def object_creator(info, key, date)
    @message = Message.new(info)
    @key = Key.new(key)
    @offset = Offset.new(date)
    @shift = Shift.new(@key, @offset)
  end

  def key_creator
    num = rand(0..99999)
    test = "%05d" % num
  end

  def date_gen
    (Time.now).strftime("%d%m%y")
  end

  def enc_file_read
    in_file = File.open(@from_file, "r")
    indata = in_file.read
    in_file.close
    encrypt(indata)
    file_writer(@encryption[:encryption])
    indata
  end

  def file_writer(info)
    out_file = File.open(@to_file, 'w')
    out_file.write(info)
    out_file.close
    message
  end

  def message
    final_message = "Created '#{@to_file}' with the key #{@key.num} and date #{@offset.date}"
    puts final_message
    final_message
  end

  def dec_file_read(key, date)
    in_file = File.open(@from_file, "r")
    indata = in_file.read
    in_file.close
    decrypt(indata, key, date)
    file_writer(@decryption[:decryption])
    indata
  end
end
