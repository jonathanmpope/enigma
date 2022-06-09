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


end
