class Shift
  attr_reader :a_shift, :b_shift, :c_shift, :d_shift

  def initialize(key, offset)
    @shifts = create_shift(key, offset)
    @a_shift = a_shift
    @b_shift = b_shift
    @c_shift = c_shift
    @d_shift = d_shift
  end

  def create_shift(key, offset)
    @a_shift = key.a_key.to_i + offset.a_key.to_i
    @b_shift = key.b_key.to_i + offset.b_key.to_i
    @c_shift = key.c_key.to_i + offset.c_key.to_i
    @d_shift = key.d_key.to_i + offset.d_key.to_i
    "#{@a_shift}#{@b_shift}#{@c_shift}#{@d_shift}"
  end

end
