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
end
