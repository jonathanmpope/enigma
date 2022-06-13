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
    letter_array = message.downcase.chars
    indexes = Array(0..letter_array.size - 1)
    Hash[indexes.zip letter_array]
  end

  def encryption_process(shift)
    @encryption_message = @broken_up.map { |index, letter| encryption_logic(shift, index, letter) }
    @encryption_message.join("")
  end

  def encryption_logic(shift, index, letter)
    index % 4 == 0 && @set.include?(letter) ? letter = let_assign(letter, shift.a_shift) : nil
    index % 4 == 1 && @set.include?(letter) ? letter = let_assign(letter, shift.b_shift) : nil
    index % 4 == 2 && @set.include?(letter) ? letter = let_assign(letter, shift.c_shift) : nil
    index % 4 == 3 && @set.include?(letter) ? letter = let_assign(letter, shift.d_shift) : nil
    letter
  end

  def decryption_process(shift)
    @decryption_message = @broken_up.map { |index, letter| decryption_logic(shift, index, letter) }
    @decryption_message.join("")
  end

  def decryption_logic(shift, index, letter)
    index % 4 == 0 && @set.include?(letter) ? letter = let_assign(letter, -shift.a_shift) : nil
    index % 4 == 1 && @set.include?(letter) ? letter = let_assign(letter, -shift.b_shift) : nil
    index % 4 == 2 && @set.include?(letter) ? letter = let_assign(letter, -shift.c_shift) : nil
    index % 4 == 3 && @set.include?(letter) ? letter = let_assign(letter, -shift.d_shift) : nil
    letter
  end

  def let_assign(letter, let_shift)
    letter = @set.rotate(let_shift + @set.find_index(letter))[0]
  end
end
