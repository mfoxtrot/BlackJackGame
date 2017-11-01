require_relative 'player.rb'
require_relative 'deck.rb'

class Game
  include Player
  include Deck

  attr_reader :dealer
  attr_reader :gamer
  attr_reader :deck

  def initialize(player_name)
    @dealer = Player.new('Dealer', 100)
    @gamer = Player.new(player_name, 100)
    @deck = Deck.new
    @deck.shuffle!

    @game_bank = 0
  end

  def start
    2.times do { draw_card(gamer) }
    2.times do { draw_card(dealer) }
    bet!(10)
    show_info
    play_game
    show_cards
    show_result
  end

  private

  def draw_card(player)
    player.hit(deck.pull_card)
  end

  def bet!(rate)
    game_bank += rate * 2
    dealer.bank -= rate
    gamer.bank -= rate
  end

  def show_info
    puts 'Dealer''s cards: * *'
    print "#{@gamer.name}'s cards: "
    gamer.hand.each { |card| print card[:icon]}
  end

  def show_cards
    print 'Dealer''s cards: * *'
    dealer.hand.each { |card| print card[:icon]}
    puts
    print "#{@gamer.name}'s cards: "
    gamer.hand.each { |card| print card[:icon]}
  end

  def play_game
  end

  def show_result
  end
end
