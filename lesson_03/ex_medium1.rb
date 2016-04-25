# ex_medium1.rb

# question 1 - For this exercise, write a one-line program that creates the following output 10 times, 
# with the subsequent line indented 1 space to the right: The Flintstones Rock!
10.times { |number| puts (" " * number) + "The Flintstones Rock!"}

# question 2 - Create a hash that expresses the frequency with which each letter occurs in this string:
# ex: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# question 3 - The result of the following statement will be an error:
# returns TypeError: no implicit conversion of Fixnum into String
# need  to covert the resulting integer from (40 + 2) to a string
puts "the value of 40 + 2 is " + (40 + 2).to_s
# or
int = 40 + 2
puts "the value of 40 + 2 is #{int}"
# or LS solution
puts "the value of 40 + 2 is #{40 + 2}"

# question 4 - What happens when we modify an array while we are iterating over it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number| # => prints 1 3 returns => [3, 4]
  p number
  numbers.shift(1)
end
# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number| # => prints 1 2 returns => [1, 2]
  p number
  numbers.pop(1)
end
# debugging version
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# question 6 - Do you like << or + for modifying the buffer?". Is there a difference between 
# the two, other than what operator she chose to use to add an element to the buffer?
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
# The + uses concatenation to merge the new element to the input_array which is then assigned 
# to the buffer variable. 
# << appends the new element to the buffer array.

# question 7 - What's wrong with the code?
limit = 15  # => the limit variable was outside of the local scope of the method.
def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
result = fib(0, 1, limit)
puts "result is #{result}"

# question 8 - Write your own version of the rails titleize implementation.
munsters_description = "The Munsters are creepy in a good way."
def titleize(str)
  str.split.map!(&:capitalize).join(' ')
end
titleize(munsters_description) # => "The Munsters Are Creepy In A Good Way."

# question 9 - Modify the hash such that each member of the Munster family has an additional 
# "age_group" key that has one of three values describing the age group the family member is 
# in (kid, adult, or senior). Note: a kid is in the age range 0 - 17, an adult is in the range 
# 18 - 64 and a senior is aged 65+.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.each do |k, v|
  age = munsters[k]["age"]
  case age
  when 0..18
    munsters[k].merge!("age_group" => "kid")
  when 18..65
    munsters[k].merge!("age_group" => "adult")
  else
    munsters[k].merge!("age_group" => "senior")
  end
end
