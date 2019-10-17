require "./lib/simulator"
require "./lib/door"
require "./lib/io_logger"
require "./lib/counter"


if ARGV[0] == 'run_once'
  num_doors = ARGV[1].to_i
  change = ARGV[2] == 'change'
  simulator = Simulator.new(logger: IoLogger.new)
  simulator.run!(num_doors: num_doors, change: !!change)
end

if ARGV[0] == "run_multiple"
  num_doors = ARGV[1].to_i
  change = ARGV[2] == 'change'
  runs = ARGV[3].to_i

  counter = Counter.new

  runs.times do
    simulator = Simulator.new(logger: counter)
    simulator.run!(num_doors: num_doors, change: change)
  end

  counter.display_stats!
end
