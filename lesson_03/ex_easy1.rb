# ex_easy1.rb

# question 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers # => outputs 1 2 2 3

# question 2
# ! Logical NOT Operator. Use to reverses the logical 
# state of its operand. If a condition is true, then Logical NOT operator will make false.
# ! used after a method alters the incoming object rather than returning a new object

# ? is a conditional expression. If condition is true ? then do something...

# part 1. != means not equal to and is used to evaluate parameters
num = 4
if num != 3
  puts "not equal to 3"
end

# part 2.
user_name = "Bob"
puts !user_name # => false

# part 3.
words = ["dog", "dog", "cat", "bird"]
words.uniq!
puts words # => dog cat bird

# part 4.
# a ? before something gives a syntax error

# part 5.
defined? puts # => "method"

# part 6.
puts !!user_name # => true

# question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")
puts advice

# question 4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # => [1, 3, 4, 5] deletes index
p "delete_at returns: #{numbers}"

numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # => [2, 3, 4, 5] deletes equivalent number
p "delete returns: #{numbers}"

# question 5 - Programmatically determine if 42 lies between 10 and 100.
if (10..100).include?(42)
  puts "42 lies between 10 and 100"
end

# question 6
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
puts famous_words

famous_words = "seven years ago..."
puts "Four score and " + famous_words

# question 7
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

eval(how_deep) # => 42

# question 8
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
flintstones.flatten!
p flintstones

# question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
Barney = flintstones.assoc("Barney")
p Barney

# question 10
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
new_hash = flintstones.map.with_index.to_h {|x, i| [x, i.to_i]}
p new_hash
