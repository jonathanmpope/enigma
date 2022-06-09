class Key
  attr_reader :num

  def initialize(num = num_gen)
    @num = num
    # @argument = argument
  end

  def num_gen
    num = rand(0..99999)
    @num = "%05d" % num

  end

end
