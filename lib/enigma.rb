require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'

class Enigma

  def initialize(from_file = nil, to_file = nil)
    @from_file = from_file
    @to_file = to_file
    @enc_output = nil
  end

  def encrypt(info, key = key_creator, date = date_gen)
    object_creator(info, key, date)
    @encryption = {
      encryption: encryption_process,
      key: @key.num,
      date: @offset.date
    }
  end

  def decrypt(info, key, date = date_gen)
    object_creator(info, key, date)
    decryption = {
      decryption: decryption_process,
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
    "%05d" % num
  end

  def date_gen
    today = Time.now.to_s
    y = today[2..3]
    m = today[5..6]
    d = today[8..9]
    m.concat(d).concat(y)
  end

  def encryption_process
    @encryption_message = @message.broken_up.map { |index, letter| encryption_logic(index, letter) }
    @encryption_message.join("")
  end

  def encryption_logic(index, letter)
    if index % 4 == 0 && @message.set.include?(letter) == true
      letter = @message.set.rotate(@shift.a_shift + @message.set.find_index(letter))[0]
    elsif index % 4 == 1 && @message.set.include?(letter) == true
      letter = @message.set.rotate(@shift.b_shift + @message.set.find_index(letter))[0]
    elsif index % 4 == 2 && @message.set.include?(letter) == true
      letter = @message.set.rotate(@shift.c_shift + @message.set.find_index(letter))[0]
    elsif index % 4 == 3 && @message.set.include?(letter) == true
      letter = @message.set.rotate(@shift.d_shift + @message.set.find_index(letter))[0]
    else
      letter
    end
  end

  def decryption_process
    @decryption_message = @message.broken_up.map { |index, letter| decryption_logic(index, letter) }
    @decryption_message.join("")
  end

  def decryption_logic(index, letter)
    if index % 4 == 0 && @message.set.include?(letter) == true
      letter = @message.set.rotate(-@shift.a_shift + @message.set.find_index(letter))[0]
    elsif index % 4 == 1 && @message.set.include?(letter) == true
      letter = @message.set.rotate(-@shift.b_shift + @message.set.find_index(letter))[0]
    elsif index % 4 == 2 && @message.set.include?(letter) == true
      letter = @message.set.rotate(-@shift.c_shift + @message.set.find_index(letter))[0]
    elsif index % 4 == 3 && @message.set.include?(letter) == true
      letter = @message.set.rotate(-@shift.d_shift + @message.set.find_index(letter))[0]
    else
      letter
    end
  end

  # def enc_file_read
  #   in_file = File.open(@from_file, "r")
  #   indata = in_file.read
  #   in_file.close
  #   encrypt(indata)
  #   enc_file_writer(@encryption[:encryption])
  # end
  #
  # def enc_file_writer(message)
  #   out_file = File.open(@to_file, 'w')
  #   out_file.write(message)
  #   out_file.close
  #   enc_message
  # end

  def enc_message
    puts "Created #{@to_file} with the key #{@key.num} and date #{@offset.date}"
    "Created #{@to_file} with the key #{@key.num} and date #{@offset.date}"
  end
end
