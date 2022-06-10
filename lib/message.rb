class Message
  attr_reader :info

  def initialize(info)
    @info = info
  end

  def character_set
    @set = ("a".."z").to_a << " "
  end

end
