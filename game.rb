require_relative 'player.rb'
require_relative 'deck.rb'

class Game
  #include Player
  #include Deck

  attr_reader :dealer
  attr_reader :gamer
  attr_reader :deck
  attr_reader :game_phase

  def initialize(player_name)
    @dealer = Player.new('Dealer', 100)
    @gamer = Player.new(player_name, 100)
    @deck = Deck.new
    @deck.shuffle!
    @game_bank = 0
  end

  def start
    @dealer.empty_hand
    @gamer.empty_hand
    set_phase("first_phase")
  end

  def set_phase(new_phase)
    case new_phase
    when "first_phase" then first_phase
    when "users_move" then game_over ? open_cards : users_move
    when "dealers_move" then game_over ? open_cards : dealers_move
    when "open_cards" then open_cards
    end
  end

  def game_over
    @gamer.score > 21 || @dealer.score > 21 || (@gamer.hand.count == 3 && @dealer.hand.count == 3)
  end

  def first_phase
    2.times do draw_card(gamer) end
    2.times do draw_card(dealer) end
    bet!(10)
    show_info(false)
    set_phase('users_move')
  end

  def users_move
    choice = users_menu_choice
    draw_card(@gamer) if choice == 'pull'
    show_info(false)
    new_phase = choice == 'open' ? 'open_cards': 'dealers_move'
    set_phase(new_phase)
  end

  def users_menu_choice
    menu = []
    menu << {label: "Пропустить", answer: "skip"} if dealer.hand.count < 3
    menu << {label: "Добавить карту", answer: "pull"} if gamer.hand.count < 3
    menu << {label: "Открыть карты", answer: "open"}
    menu.each { |item| puts "#{item[:label]}(#{item[:answer]})" }
    print 'Ваш выбор: '
    choice = gets.chomp
    choice
  end

  def dealers_move
    draw_card(@dealer) if @dealer.score < 17
    new_phase = 'users_move'
    set_phase(new_phase)
    show_info(false)
  end

  def open_cards
    show_info(true)
    show_winner_info
    puts 'Do you want to play another game?(Y/N)'
    choice = gets.chomp
    start if choice.capitalize! == 'Y'
  end

  private

  def draw_card(player)
    player.hit(deck.pull_card)
  end

  def bet!(rate)
    @game_bank += rate * 2
    dealer.bank -= rate
    gamer.bank -= rate
  end

  def show_info(open_cards)
    system('clear')
    print "Dealer's cards: "
    if open_cards
      dealer.hand.each { |card| print " #{card[:icon]} "}
      puts "Dealer's score is: #{@dealer.score}"
    else
      dealer.hand.each { |card| print " * "}
      puts
    end
    print "#{@gamer.name}'s cards: "
    gamer.hand.each { |card| print " #{card[:icon]} "}
    puts "Your score is: #{@gamer.score}"
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
    puts "Dealer's bank: #{@dealer.bank}"
    puts "Your bank: #{@gamer.bank}"
    puts "Game's bank: #{@game_bank}"
  end

  def who_wins
    return @gamer if @dealer.score > 21
    return @dealer if @gamer.score > 21
    return @gamer.score > @dealer.score ? @gamer : @dealer
  end
end
