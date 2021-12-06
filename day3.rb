FORWARD = 'forward'
UP = 'up'
DOWN = 'down'

def binToDec(num_array)
  num_array.reverse.each_with_index.reduce(0) do |acc, (el, idx)|
    el.zero? ? acc : acc + ((2*el)**idx)
  end
end



def solution_part_one(data_set)
  # add all the 1 digits and then use that to set the amount
  collection_of_ones = Array.new(data_set[0].length).fill(0)
  data_set_length = data_set.length.to_f
  data_set.each do |bin_num|
    collection_of_ones.each_with_index do |digits, idx|
      collection_of_ones[idx] += 1 if bin_num[idx] === '1'
    end
  end
  # check count and make one if greater than total
  collection_of_ones.map! do |one_count|
    one_count/data_set_length >= 0.5 ? 1 : 0 
  end
  flipped_bits = collection_of_ones.map {|digit| digit === 1 ? 0 : 1}
  gamma = binToDec(collection_of_ones)
  episilon = binToDec(flipped_bits)
  gamma*episilon
end


def find_most_least_common(array, pos)
  total_ones = 0
  array_length = array.length.to_f
  array.each do |el|
    total_ones += 1 if el[pos] === '1'
  end
  percent_ones = total_ones/array_length 
  puts percent_ones
   ret = [percent_ones >= 0.5 ? "1" : "0", percent_ones >= 0.5 ? "0" : "1"] 
   p ret
end


def solution_part_two(data_set)
  o2_filter, co2_filter = find_most_least_common(data_set, 0)
  result = data_set.dup
  idx = 0
  while(result.length > 1) do
    result.filter! {|el| el[idx] === o2_filter}
    break if result.length === 1
    idx += 1
    o2_filter, co2_filter = find_most_least_common(result, idx) 
  end

  o2_filter, co2_filter = find_most_least_common(data_set, 0)
  idx2 = 0
  result2 = data_set.dup
  while(result2.length > 1) do
    result2.filter! {|el| el[idx2] === co2_filter}
    break if result2.length === 1
    idx2 += 1
    o2_filter, co2_filter = find_most_least_common(result2, idx2) 
  end  

  o2_rate = binToDec(result.first.split('').map(&:to_i))
  co2_rate = binToDec(result2.first.split('').map(&:to_i))
  o2_rate * co2_rate

end

def main
  data_set = File.read('day3input').split
  # puts data_set
  puts solution_part_one(data_set) 
  puts solution_part_two(data_set)
end

main