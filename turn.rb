class Turn

  attr_accessor :player

  def initialize(player)
    @player = player
  end

  def question
    num1 = rand(1..10)
    num2 = rand(1..10)
    puts "#{@player}: What does #{num1} plus #{num2} equal?"
    return num1 + num2
  end

  def correct
    puts "#{@player}: YES! You are correct."
  end

  def incorrect
    puts "#{@player}: Seriously? No!"
  end

end
