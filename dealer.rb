require_relative 'player.rb'
class Dealer < Player
  def pull_card?
    @score < 17
  end
end
