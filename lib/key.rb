class Key
  attr_reader :num, :a_key, :b_key, :c_key, :d_key

  def initialize(num = num_gen)
    @num = num
    @key_gen = keys_key_gen
    @a_key = a_key
    @b_key = b_key
    @c_key = c_key
    @d_key = d_key
  end

  def keys_key_gen
    @a_key = @num[0..1]
    @b_key = @num[1..2]
    @c_key = @num[2..3]
    @d_key = @num[3..4]
  end
end
