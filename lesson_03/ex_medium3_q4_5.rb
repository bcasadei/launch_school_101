# ex_medium3_q4_5.rb
# question 4
def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => My string looks like this now: rutabaga
puts "My array looks like this now: #{my_array}" # => My array looks like this now: ["pumpkins"]
# the gsub! method is destructive and modifies the variable
# the =[ ] operator is not destructive and is creating a new object

# question 5 - How could the unnecessary duplication in this method be removed?
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
# solution
def color_valid(color)
  color == "blue" || color == "green"
end

