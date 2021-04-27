class Game
  attr_accessor :player

  def initialize
    @player = "player1"
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
  end

  def welcome
    puts "---- NEW GAME -----"
    self.nextTurn
  end

  def changePlayer
    if @player == "player1"
      @player = "player2"
    else
      @player = "player1"
    end
  end

  def checkGamestate
    if @player1.lives == 0
      puts "Player 2 wins with a score of #{@player2.lives}/3"
    elsif @player2.lives == 0
      puts "Player 1 wins with a score of #{@player1.lives}/3"
    else
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      self.nextTurn
    end
  end


  def nextTurn
    puts "----- NEW TURN -----"
    newturn = Turn.new(@player)
    answer = newturn.question
    playerAnswer = gets.chomp

    if answer == playerAnswer.to_i
      newturn.correct
    else
      newturn.incorrect
      if @player == "player1"
        @player1.lives -= 1
      else
        @player2.lives -= 1
      end
    end

    self.changePlayer
    self.checkGamestate
  end
end
