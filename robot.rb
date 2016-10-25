require 'byebug'

class Robot
  attr_reader :position

  def initialize
    @directions = %w(NORTH EAST SOUTH WEST)
  end

  def place(coordinates)
    coordinates = coordinates.split(',')
    coordinates[0] = coordinates[0].to_i
    coordinates[1] = coordinates[1].to_i

    if valid?(coordinates[0], coordinates[1], coordinates[2])
      @position = {
        x: coordinates[0],
        y: coordinates[1],
        dir: coordinates[2]
      }
    else
      puts 'Wrong position. Please specify the other coordinates:'
    end
  end

  def move
    x = @position[:x]
    y = @position[:y]

    case @position[:dir]
    when 'NORTH'
      y += 1
    when 'EAST'
      x += 1
    when 'SOUTH'
      y -= 1
    when 'WEST'
      x -= 1
    end

    if valid?(x, y, @position[:dir])
      @position[:x] = x
      @position[:y] = y
    else
      puts 'Cannot move in this direction'
    end
  end

  def turn(dir)
    direction = @directions.index(@position[:dir])
    @position[:dir] = case dir
                      when 'LEFT'
                        direction.zero? ? @directions[3] : @directions[direction - 1]
                      when 'RIGHT'
                        direction == 3 ? @directions[0] : @directions[direction + 1]
                      end
  end

  def valid?(x, y, dir)
    (@directions.include? dir) && x < 5 && y < 5 && x > -1 && y > -1
  end

  def report
    puts "#{@position[:x]}, #{@position[:y]}, #{@position[:dir]}"
  end
end
