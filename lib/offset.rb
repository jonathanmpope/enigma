class Offset
  attr_reader :date, :a_key, :b_key, :c_key, :d_key

  def initialize(date = date_gen)
    @date = date
    @key_gen = offset_key_gen
    @a_key = a_key
    @b_key = b_key
    @c_key = c_key
    @d_key = d_key
  end

  def date_gen
    today = Time.now.to_s
    y = today[2..3]
    m = today[5..6]
    d = today[8..9]
    @date = m.concat(d).concat(y)
  end

  def offset_numbers
    squared = @date.to_i**2
    @last_four = squared.to_s[-4..-1]
  end

  def offset_key_gen
    offset_numbers
    @a_key = @last_four[0]
    @b_key = @last_four[1]
    @c_key = @last_four[2]
    @d_key = @last_four[3]
  end
end
