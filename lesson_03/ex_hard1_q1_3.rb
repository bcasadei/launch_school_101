# ex_hard1.rb
# question 1 - What do you expect to happen when the greeting variable 
# is referenced in the last line of the code below?
if false
  greeting = “hello world”
end

greeting # => nil. if evaluates to true by default.

# question 2
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => { a: 'hi' } => wrong actually returns {:a=>"hi there"}
# informal_greeting << ' there' was using the String#<< method, which modifies the object that called it.

# question 3 - What will be printed by each of these code groups?
# A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => one
puts "two is: #{two}" # => two
puts "three is: #{three}" # = three

# B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => one
puts "two is: #{two}" # => two
puts "three is: #{three}" # = three

# C
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => two
puts "two is: #{two}" # => three
puts "three is: #{three}" # => one