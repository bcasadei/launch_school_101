# ex_medium3_q3.rb
# question 3 - Study the following code and state what will be displayed...and why:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => My string looks like this now: rutabaga
puts "My array looks like this now: #{my_array}" # => My array looks like this now: ["pumpkins", "rutabaga"]
# The += operator is not destructive and reassigns the value to a new variable and does not alter the variable
# The << operator is destructive and alters the variable adding a new item to the existing variable