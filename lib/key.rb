class Key
  attr_reader :num, :a_key

  def initialize(num = num_gen)
    @num = num
    @a_key = a_key_gen
  end

  def num_gen
    num = rand(0..99999)
    @num = "%05d" % num
  end

  def a_key_gen
    @a_key = @num[0..1]
    # binding.pry
  end

end
