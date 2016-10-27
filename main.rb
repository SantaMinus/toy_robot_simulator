require_relative 'robot.rb'
require 'byebug'

class Main
  def self.start
    robot = Robot.new

    puts 'Now command. When you want to stop, enter STOP'
    input = gets.chomp

    until input == 'STOP'
      case input
      when /^PLACE/
        params = input.split(' ')[1]
        robot.place(params)
      when 'MOVE'
        robot.move
      when 'LEFT', 'RIGHT'
        robot.turn(input)
      when 'REPORT'
        robot.report
      else
        'Unknown command'
      end
      input = gets.chomp
    end
  end
end

Main.start
