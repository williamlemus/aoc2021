FORWARD = 'forward'
UP = 'up'
DOWN = 'down'

def upOrDown(dir)
  dir === UP ? -1 : 1
end

def solution_part_one(data_set)
  solution_array = [0, 0]
  data_set.each do |el|
     direction, spaces = el.split
     solution_array[0] += spaces.to_i if direction === FORWARD
     solution_array[1] += (upOrDown(direction) * spaces.to_i) if [UP, DOWN].include?(direction)
  end
  solution_array.reduce(:*) 
end


def solution_part_two(data_set)
   solution_array = [0, 0, 0]
  data_set.each do |el|
     direction, spaces = el.split
     case direction
     when FORWARD
      solution_array[0] += spaces.to_i 
      solution_array[1] += (spaces.to_i * solution_array[2])
     when UP
      # solution_array[1] += (upOrDown(direction) * spaces.to_i)
      solution_array[2] -= spaces.to_i
     when DOWN
      # solution_array[1] += (upOrDown(direction) * spaces.to_i)
      solution_array[2] += spaces.to_i
     end
  end
  solution_array[0..1].reduce(:*) 
end


def main
  data_set = File.read('day2input').split("\n")
  puts data_set
  puts solution_part_one(data_set) 
  puts solution_part_two(data_set)
end

main