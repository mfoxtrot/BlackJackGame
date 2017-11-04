require_relative 'player.rb'
require_relative 'deck.rb'

class Game
  attr_reader :dealer
  attr_reader :gamer
  attr_reader :deck
  attr_reader :game_phase
  attr_reader :players

  def initialize(player_name)
    @dealer = Player.new('Dealer', 100)
    @gamer = Player.new(player_name, 100)
    @deck = Deck.new
    @deck.shuffle!
    @game_bank = 0
    @players = [@dealer, @gamer]
  end

  def start
    @players.each { :empty_hand }
    to_phase('first_phase')
  end

  private

  def to_phase(new_phase)
    case new_phase
    when 'first_phase' then first_phase
    when 'users_move' then game_over? ? open_cards : users_move
    when 'dealers_move' then game_over? ? open_cards : dealers_move
    when 'open_cards' then open_cards
    end
  end

  def game_over?
    @players.each { |player| return true if player.bust? }
    return true if @gamer.hand.count == 3 && @dealer.hand.count == 3
    false
  end

  def first_phase
    @players.each do |player|
      2.times { draw_card(player) }
    end
    bet!(10)
    show_info(false)
    to_phase('users_move')
  end

  def users_move
    choice = users_menu_choice
    draw_card(@gamer) if choice == 'pull'
    show_info(false)
    new_phase = choice == 'open' ? 'open_cards' : 'dealers_move'
    to_phase(new_phase)
  end

  def users_menu_choice
    menu = []
    menu << { label: 'Пропустить', answer: 'skip' } if dealer.hand.count < 3
    menu << { label: 'Добавить карту', answer: 'pull' } if gamer.hand.count < 3
    menu << { label: 'Открыть карты', answer: 'open' }
    menu.each { |item| puts "#{item[:label]}(#{item[:answer]})" }
    print 'Ваш выбор: '
    choice = gets.chomp
    choice
  end

  def dealers_move
    draw_card(@dealer) if @dealer.score < 17
    new_phase = 'users_move'
    to_phase(new_phase)
    show_info(false)
  end

  def open_cards
    show_info(true)
    show_winner_info
    puts 'Do you want to play another game?(Y/N)'
    choice = gets.chomp
    start if choice.capitalize! == 'Y'
  end

  def draw_card(player)
    player.hit(deck.pull_card)
  end

  def bet!(rate)
    @game_bank += rate * 2
    @players.each { |player| player.bank -= rate }
  end

  def show_info(open_cards)
    system('clear')
    @dealer.show_info(open_cards)
    @gamer.show_info(true)
  end

  def show_winner_info
    if @dealer.score == @gamer.score
      puts 'Draw'
    else
      winner = who_wins
      winner.bank += @game_bank
      @game_bank = 0
      puts "The winner is #{winner.name}"
    end
    show_bank
  end

  def show_bank
    @players.each { :show_bank }
    puts "Game's bank: #{@game_bank}"
  end

  def who_wins
    return @gamer if @dealer.score > 21
    return @dealer if @gamer.score > 21
    return @gamer.score > @dealer.score ? @gamer : @dealer
  end
end
