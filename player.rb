class Player
  attr_accessor :player, :lives

  def initialize(player, lives)
    @player = player
    @lives = lives
  end

  def update_lives
    if @lives > 0
      @lives -= 1
    end
    @lives
  end
end