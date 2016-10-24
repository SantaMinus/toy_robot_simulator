require_relative 'robot.rb'
require 'byebug'

class Main
  def self.start
    robot = Robot.new

    puts 'Now command. When you want to stop, enter REPORT'
    input = gets.chomp

    until input == 'REPORT'
      case input
      when /^PLACE/
        params = input.split(' ')[1]
        robot.place(params)
      when 'MOVE'
        robot.move
      when 'LEFT'
        robot.left
      when 'RIGHT'
        robot.right
      else
        'Unknow command'
      end
      input = gets.chomp
    end

    robot.report
  end
end

Main.start
