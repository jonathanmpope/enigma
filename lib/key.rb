class Key
  attr_reader :num, :a_key, :b_key, :c_key, :d_key 

  def initialize(num = num_gen)
    @num = num
    @a_key = a_key_gen
    @b_key = b_key_gen
    @c_key = c_key_gen
    @d_key = d_key_gen
  end

  def num_gen
    num = rand(0..99999)
    @num = "%05d" % num
  end

  def a_key_gen
    @a_key = @num[0..1]
  end

  def b_key_gen
    @b_key = @num[1..2]
  end

  def c_key_gen
    @c_key = @num[2..3]
  end

  def d_key_gen
    @d_key = @num[3..4]
  end

end
