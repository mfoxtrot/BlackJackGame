class Deck
  @@cards = [
    {icon: "\u1F0A1", score: 11},
    {icon: "\u1F0A2", score: 2},
    {icon: "\u1F0A3", score: 3},
    {icon: "\u1F0A4", score: 4},
    {icon: "\u1F0A5", score: 5},
    {icon: "\u1F0A6", score: 6},
    {icon: "\u1F0A7", score: 7},
    {icon: "\u1F0A8", score: 8},
    {icon: "\u1F0A9", score: 9},
    {icon: "\u1F0AA", score: 10},
    {icon: "\u1F0AB", score: 10},
    {icon: "\u1F0AD", score: 10},
    {icon: "\u1F0AE", score: 10},
    {icon: "\u1F0B1", score: 11},
    {icon: "\u1F0B2", score: 2},
    {icon: "\u1F0B3", score: 3},
    {icon: "\u1F0B4", score: 4},
    {icon: "\u1F0B5", score: 5},
    {icon: "\u1F0B6", score: 6},
    {icon: "\u1F0B7", score: 7},
    {icon: "\u1F0B8", score: 8},
    {icon: "\u1F0B9", score: 9},
    {icon: "\u1F0BA", score: 10},
    {icon: "\u1F0BB", score: 10},
    {icon: "\u1F0BD", score: 10},
    {icon: "\u1F0BE", score: 10},
    {icon: "\u1F0C1", score: 11},
    {icon: "\u1F0C2", score: 2},
    {icon: "\u1F0C3", score: 3},
    {icon: "\u1F0C4", score: 4},
    {icon: "\u1F0C5", score: 5},
    {icon: "\u1F0C6", score: 6},
    {icon: "\u1F0C7", score: 7},
    {icon: "\u1F0C8", score: 8},
    {icon: "\u1F0C9", score: 9},
    {icon: "\u1F0CA", score: 10},
    {icon: "\u1F0CB", score: 10},
    {icon: "\u1F0CD", score: 10},
    {icon: "\u1F0CE", score: 10},
    {icon: "\u1F0D1", score: 11},
    {icon: "\u1F0D2", score: 2},
    {icon: "\u1F0D3", score: 3},
    {icon: "\u1F0D4", score: 4},
    {icon: "\u1F0D5", score: 5},
    {icon: "\u1F0D6", score: 6},
    {icon: "\u1F0D7", score: 7},
    {icon: "\u1F0D8", score: 8},
    {icon: "\u1F0D9", score: 9},
    {icon: "\u1F0DA", score: 10},
    {icon: "\u1F0DB", score: 10},
    {icon: "\u1F0DD", score: 10},
    {icon: "\u1F0DE", score: 10}
  ]

  attr_reader :cards

  def initialize
    @cards = @@cards
  end

  def shuffle!
    cards.shuffle!
  end

  def pull_card
    cards.shift
  end
end
