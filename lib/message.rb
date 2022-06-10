class Message
  attr_reader :info, :broken_up

  def initialize(info)
    @info = info
    @broken_up = message_array_of_strings(info)
  end

  def character_set
    @set = ("a".."z").to_a << " "
  end

  def message_array_of_strings(message)
    message.chars
  end

end
