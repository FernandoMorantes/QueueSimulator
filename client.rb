class Client
  attr_reader :name, :shopping_time, :time_on_line

  def initialize
    @name = [*('a'..'z')].sample(2).join
    @shopping_time = Random.rand(4...25)
    @time_on_line = 0
  end

  def wait_on_line
    @time_on_line += 1
  end
end
