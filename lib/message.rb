class Message
  attr_reader :info, :broken_up, :set

  def initialize(info)
    @info = info
    @broken_up = message_array_of_strings(info)
    @set = character_set
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def message_array_of_strings(message)
    message.chars
  end

end
