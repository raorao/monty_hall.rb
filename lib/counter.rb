class Counter
  def initialize
    @winners = 0
    @losers = 0
  end

  def setup!(_); end
  def select_door!(_); end
  def reveal_goat!(_); end
  def change_door!(_); end

  def reveal_winner!(doors)
    doors.find(&:selected?).winner? ? (@winners += 1) : (@losers += 1)
  end

  def display_stats!
    total = @winners + @losers
    percent = (100 * @winners/total.to_f).round(2)

    puts "won #{@winners}/#{total} times, a #{percent}% success rate."
  end
end
