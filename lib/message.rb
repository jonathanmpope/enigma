class Message
  attr_reader :info, :broken_up, :set, :encryption_message

  def initialize(info)
    @info = info
    @broken_up = message_hash(info)
    @set = character_set
    @encryption_message = encryption_message
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def message_hash(message)
    array = message.downcase.chars
    indexes = Array(0..array.size - 1)
    Hash[indexes.zip array]
  end

  def encryption_process(shift)
    @encryption_message = @broken_up.map { |index, letter| encryption_logic(shift, index, letter) }
    @encryption_message.join("")
  end

  def encryption_logic(shift, index, letter)
    if index % 4 == 0 && @set.include?(letter) == true
      letter = @set.rotate(shift.a_shift + @set.find_index(letter))[0]
    elsif index % 4 == 1 && @set.include?(letter) == true
      letter = @set.rotate(shift.b_shift + @set.find_index(letter))[0]
    elsif index % 4 == 2 && @set.include?(letter) == true
      letter = @set.rotate(shift.c_shift + @set.find_index(letter))[0]
    elsif index % 4 == 3 && @set.include?(letter) == true
      letter = @set.rotate(shift.d_shift + @set.find_index(letter))[0]
    else
      letter
    end
  end

  def decryption_process(shift)
    @decryption_message = @broken_up.map { |index, letter| decryption_logic(shift, index, letter) }
    @decryption_message.join("")
  end

  def decryption_logic(shift, index, letter)
    if index % 4 == 0 && @set.include?(letter) == true
      letter = @set.rotate(-shift.a_shift + @set.find_index(letter))[0]
    elsif index % 4 == 1 && @set.include?(letter) == true
      letter = @set.rotate(-shift.b_shift + @set.find_index(letter))[0]
    elsif index % 4 == 2 && @set.include?(letter) == true
      letter = @set.rotate(-shift.c_shift + @set.find_index(letter))[0]
    elsif index % 4 == 3 && @set.include?(letter) == true
      letter = @set.rotate(-shift.d_shift + @set.find_index(letter))[0]
    else
      letter
    end
  end
end
