class Message
  attr_reader :info, :broken_up, :set

  def initialize(info)
    @info = info
    @broken_up = message_hash(info)
    @set = character_set
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def message_hash(message)
    array = message.chars
    indexes = Array(0..array.size - 1)
    Hash[indexes.zip array]
  end
end
