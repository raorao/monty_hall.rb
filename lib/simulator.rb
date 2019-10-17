class Simulator
  def initialize(logger:)
    @doors = []
    @logger = logger
  end

  def run!(num_doors:, change:)
    fail "you must have at least 3 doors" if num_doors < 3
    setup!(num_doors: num_doors)
    select_door!
    reveal_goat!
    change_door! if change
    reveal_winner!
  end

  private

  def setup!(num_doors:)
     num_goats = num_doors - 1
     goats = num_goats.times.map { Door.goat }
     winner = Door.winner

    @doors = (goats + [winner]).shuffle

    @logger.setup!(@doors)
  end

  def select_door!
    @doors.sample.select!
    @logger.select_door!(@doors)
  end

  def reveal_goat!
    @doors.reject(&:selected?).select(&:goat?).sample.reveal!
    @logger.reveal_goat!(@doors)
  end

  def change_door!
    current_selection = @doors.find(&:selected?)
    new_selection = @doors.reject(&:selected?).reject(&:revealed?).sample

    current_selection.deselect!
    new_selection.select!
    @logger.change_door!(@doors)
  end

  def reveal_winner!
    @doors.select(&:selected?).map(&:reveal!)
    @logger.reveal_winner!(@doors)
  end
end
