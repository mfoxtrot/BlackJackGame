require_relative 'game.rb'

class TerminalInterface
  attr_reader :player_name

  def initialize
    puts 'Игра Блекджек'
    print 'Введите ваше имя: '
    @player_name = gets.chomp
    @game = Game.new(@player_name)
  end

  def start_game
    @game.start
    until @game.game_over?
      show_info
      @game.users_move(users_choice)
    end

    show_game_result
    start_game if another_game?
  end

  private

  def users_choice
    menu = @game.user_menu
    menu.each { |item| puts "#{item[:label]}(#{item[:answer]})" }
    print 'Ваш выбор: '
    choice = gets.chomp
    choice
  end

  def show_info
    system('clear')
    info = @game.info
    info.each { |string| puts string }
  end

  def show_game_result
    show_info
    puts "game phase: #{@game.game_phase}"
    info = @game.game_result
    info.each { |string| puts string }
  end

  def another_game?
    print 'Сыгрем еще раз?(Y/N): '
    choice = gets.chomp
    true if choice.capitalize == 'Y'
  end
end
