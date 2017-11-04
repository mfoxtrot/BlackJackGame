class Deck
  @@cards = [
    { icon: '🂡', score: 11 },
    { icon: '🂢', score: 2 },
    { icon: '🂣', score: 3 },
    { icon: '🂤', score: 4 },
    { icon: '🂥', score: 5 },
    { icon: '🂦', score: 6 },
    { icon: '🂧', score: 7 },
    { icon: '🂨', score: 8 },
    { icon: '🂩', score: 9 },
    { icon: '🂪', score: 10 },
    { icon: '🂫', score: 10 },
    { icon: '🂭', score: 10 },
    { icon: '🂮', score: 10 },
    { icon: '🂱', score: 11 },
    { icon: '🂲', score: 2 },
    { icon: '🂳', score: 3 },
    { icon: '🂴', score: 4 },
    { icon: '🂵', score: 5 },
    { icon: '🂶', score: 6 },
    { icon: '🂷', score: 7 },
    { icon: '🂸', score: 8 },
    { icon: '🂹', score: 9 },
    { icon: '🂺', score: 10 },
    { icon: '🂻', score: 10 },
    { icon: '🂽', score: 10 },
    { icon: '🂾', score: 10 },
    { icon: '🃁', score: 11 },
    { icon: '🃂', score: 2 },
    { icon: '🃃', score: 3 },
    { icon: '🃄', score: 4 },
    { icon: '🃅', score: 5 },
    { icon: '🃆', score: 6 },
    { icon: '🃇', score: 7 },
    { icon: '🃈', score: 8 },
    { icon: '🃉', score: 9 },
    { icon: '🃊', score: 10 },
    { icon: '🃋', score: 10 },
    { icon: '🃍', score: 10 },
    { icon: '🃎', score: 10 },
    { icon: '🃑', score: 11 },
    { icon: '🃒', score: 2 },
    { icon: '🃓', score: 3 },
    { icon: '🃔', score: 4 },
    { icon: '🃕', score: 5 },
    { icon: '🃖', score: 6 },
    { icon: '🃗', score: 7 },
    { icon: '🃘', score: 8 },
    { icon: '🃙', score: 9 },
    { icon: '🃚', score: 10 },
    { icon: '🃛', score: 10 },
    { icon: '🃝', score: 10 },
    { icon: '🃞', score: 10 }
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
