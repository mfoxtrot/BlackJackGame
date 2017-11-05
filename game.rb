require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'deck.rb'

class Game
  attr_reader :dealer
  attr_reader :gamer
  attr_reader :deck
  attr_reader :game_phase
  attr_reader :players

  def initialize(player_name)
    @dealer = Dealer.new('Dealer', 100)
    @gamer = Player.new(player_name, 100)
    @deck = Deck.new
    @deck.shuffle!
    @game_bank = 0
    @players = [@dealer, @gamer]
    @game_phase = ''
  end

  def start
    to_phase('first_phase')
  end

  def game_over?
    @players.each { |player| return true if player.bust? }
    return true if @gamer.hand.count == 3 && @dealer.hand.count == 3
    return true if @game_phase == 'open_cards'
    false
  end

  def users_move(choice)
    draw_card(@gamer) if choice == 'pull'
    new_phase = choice == 'open' ? 'open_cards' : 'dealers_move'
    to_phase(new_phase)
  end

  def info
    info = []
    show_cards = true if game_over?
    info += @dealer.show_info(show_cards)
    info += @gamer.show_info(true)
    info
  end

  def game_result
    info = []
    if @dealer.score == @gamer.score
      info << 'Draw'
    else
      winner = who_wins
      winner.bank += @game_bank
      @game_bank = 0
      info << "The winner is #{winner.name}"
    end
    @players.each { |player| info << player.show_bank }
    info << "Game's bank: #{@game_bank}"
    info
  end

  def user_menu
    menu = []
    menu << { label: 'Пропустить', answer: 'skip' } if dealer.hand.count < 3
    menu << { label: 'Добавить карту', answer: 'pull' } if gamer.hand.count < 3
    menu << { label: 'Открыть карты', answer: 'open' }
    menu
  end

  private

  def to_phase(new_phase)
    @game_phase = new_phase
      case new_phase
      when 'first_phase' then first_phase
      when 'dealers_move' then dealers_move unless game_over?
      end
  end

  def first_phase
    @players.each do |player|
      player.empty_hand
      2.times { draw_card(player) }
    end
    bet!(10)
  end

  def dealers_move
    draw_card(@dealer) if @dealer.pull_card?
  end

  def draw_card(player)
    player.hit(deck.pull_card)
  end

  def bet!(rate)
    @game_bank += rate * 2
    @players.each { |player| player.bank -= rate }
  end

  def who_wins
    return @gamer if @dealer.score > 21
    return @dealer if @gamer.score > 21
    return @gamer.score > @dealer.score ? @gamer : @dealer
  end
end
