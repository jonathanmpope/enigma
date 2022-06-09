class Offset
  attr_reader :date, :a_key, :b_key

  def initialize(date = date_gen)
    @date = date
    @offset_numbers = offset_numbers
    @a_key = a_key_gen
    @b_key = b_key_gen 
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

  def a_key_gen
    @a_key = @last_four[0]
  end

  def b_key_gen
    @b_key = @last_four[1]
  end


end
