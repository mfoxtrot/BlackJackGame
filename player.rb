class Player
  attr_reader :name
  attr_reader :hand
  attr_accessor :score
  attr_accessor :bank

  def initialize(name, initial_bank)
    @name = name
    @hand = []
    @score = 0
    @bank = initial_bank
  end

  def hit(card)
    hand << card
    calc_score
  end

  def calc_score
    scores_array = []
    hand.each { |card| scores_array << card[:score] }
    @score = 0
    scores_array.each { |sc| @score += sc }
    scores_array.each { |sc| @score -= 10 if @score > 21 && sc == 11 }
  end

  def empty_hand
    @hand = []
  end

  def bust?
    @score > 21
  end

  def show_info(show_cards)
    print "#{name}'s cards: "
    if show_cards
      @hand.each { |card| print " #{card[:icon]} " }
      puts "#{@name}'s score is: #{@score}"
    else
      @hand.each { print ' * ' }
      puts
    end
  end

  def show_bank
    puts "#{name}'s bank: #{@bank}"
  end
end
