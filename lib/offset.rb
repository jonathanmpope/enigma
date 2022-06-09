class Offset
  attr_reader :date

  def initialize(date = date_gen)
    @date = date
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


end
