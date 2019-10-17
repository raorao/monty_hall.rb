class IoLogger
  def setup!(doors)
    puts "setup game with #{doors.length} doors with 1 winner and #{doors.length - 1} goats."
  end

  def select_door!(doors)
    index = doors.find_index(&:selected?)
    puts "selected door #{index + 1}."
  end

  def reveal_goat!(doors)
    index = doors.find_index { |door| door.revealed? && door.goat? }
    puts "revealed door #{index + 1} to be a goat."
  end

  def change_door!(doors)
    index = doors.find_index(&:selected?)
    puts "change selection to door #{index + 1}."
  end

  def reveal_winner!(doors)
    selected_door = doors.find(&:selected?)

    if selected_door.winner?
      puts "You win the prize!"
    else
      winner_index = doors.find_index(&:winner?)
      puts "You lose! the correct door was door #{winner_index + 1}"
    end
  end
end
