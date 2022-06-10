class Enigma

  def initialize
    # @argument = argument
  end

  def encrypt(info, key = key_creator, date = date_gen)
    object_creator(info, key, date)

  end

  def object_creator(info, key, date)
    @message = Message.new(info)
    @key = Key.new(key)
    @offset = Offset.new(date)
  end

  def key_creator
    num = rand(0..99999)
    "%05d" % num
  end

end
