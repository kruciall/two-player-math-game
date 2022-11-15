class Game

  NUM_LIVES = 3

  def initialize
    @player1 = Player.new('Player 1', NUM_LIVES)
    @player2 = Player.new('Player 2', NUM_LIVES)
    @current_player = @player1
    @question = Question.new
end

  def show_question
    @question.new_question
    puts "#{@current_player.player}: #{@question.question} "
  end

  def check_answer
    print "> "
    answer = gets.chomp.to_i
    answer == @question.answer
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def correct
    puts "#{@current_player.player}: YES! You are correct!"
  end

  def incorrect
    puts "#{@current_player.player}: Seriously?! INCORRECT!"
  end

  def next_turn
    puts "P1: #{@player1.lives}/#{NUM_LIVES} vs #{@player2.lives}/#{NUM_LIVES}"
    if @player1.lives > 0 && @player2.lives > 0
      puts "------------------ NEW TURN ------------------"
    end
  end

  def game_over(winner)
    puts "#{winner.player} wins with a score of #{winner.lives}/#{NUM_LIVES}"
    puts "------------------ GAME OVER ------------------"
  end

  #steps - show question -> receive input and check answer -> IF CORRECT -> PUTS -> next_turn -> switch_player
  def play
    while @player1.lives > 0 && @player2.lives > 0 do
      self.show_question
      if self.check_answer
        self.correct
        next_turn
        switch_player
      else
        self.incorrect
        @current_player.update_lives
        next_turn
        switch_player
      end
    end
    self.game_over(@current_player)
  end
end