class Enigma

  def initialize
    # @argument = argument
  end

  def encrypt(info, key = key_creator, date = date_gen)
    binding.pry
    object_creator(info, key, date)

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

end
