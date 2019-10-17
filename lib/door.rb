class Door
  def self.winner
    new(winner: true)
  end

  def self.goat
    new(winner: false)
  end

  def initialize(winner:)
    @selected = false
    @revealed = false
    @winner = !!winner
  end

  def select!
    @selected = true
  end

  def deselect!
    @selected = false
  end

  def reveal!
    @revealed = true
  end

  def selected?
    !!@selected
  end

  def revealed?
    !!@revealed
  end

  def goat?
    !winner?
  end

  def winner?
    !!@winner
  end
end
