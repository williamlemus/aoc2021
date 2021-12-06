

def solution_part_one(data_set)
  count = 0
  data_set[0...-1].each_with_index do |el, idx|
    count += 1 if el < data_set[idx + 1]
  end
  count
end


def solution_part_two(data_set)
  count = 0
  data_set[0..-2].each_with_index do |el, idx|
    window1 = data_set[idx...idx+3].reduce(:+)
    window2 = data_set[idx+1...idx+4].reduce(:+)
    count += 1 if window1 < window2
  end
  count
end


def main
  data_set = File.read('day1input').split.map(&:to_i)
  puts solution_part_one(data_set) 
  puts solution_part_two(data_set)
end

main