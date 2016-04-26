#ex_medium2.rb

# question 1 - Figure out the total age of just the male members of the family.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
age_total = 0
munsters.each do |name, details|
  if details["gender"] == "male"
    age_total += details["age"]
  end
end
# LS solution
total_male_age = 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end

# question 2 - print out the name, age and gender of each family member:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  age = details["age"]
  gender = details["gender"]
  puts "#{name} is a #{age} year old #{gender}."
end

# question 3 - How can we refactor this exercise to make the result easier to predict and easier for the next programmer to maintain?
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # += reassigns the value of a variable and is not destructive
  an_array_param << "rutabaga" # shovel operator (actually a method) is destructive and modifies the caller
end

my_string = "pumpkins" # my_string and my_array are outside of local scope of tricky_method, so they won't be modified by actions that are not destructive
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => My string looks like this now: pumpkins
puts "My array looks like this now: #{my_array}" # => My array looks like this now: ["pumpkins", "rutabaga"]
# Solution
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array) # => reassigns my_string and my_array to the return value of the method.

puts "My string looks like this now: #{my_string}" # => My string looks like this now: pumpkinsrutabaga
puts "My array looks like this now: #{my_array}" # => My array looks like this now: ["pumpkins", "rutabaga"]

# question 4 - Use String#split and Array#join technique to break up the following 
# string and put it back together with the words in reverse order:
sentence = "Humpty Dumpty sat on a wall."

sentence.split.reverse.join(" ") # => "wall. a on sat Dumpty Humpty"

# LS solution
words = sentence.split(/\W/)
words.reverse!
backwards_sentence = words.join(' ') + '.' # => "wall a on sat Dumpty Humpty."

# question 5 - What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer) # => 50

p answer - 8 # => 34

# question 6 - Did the family's data get ransacked, or did the mischief only 
# mangle a local copy of the original hash? (why?)
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other" # [ ]= and [ ]+= methods are destructive and modify the hash.
  end
end

mess_with_demographics(munsters) 
# => {"Herman"=>{"age"=>74, "gender"=>"other"}, "Lily"=>{"age"=>72, "gender"=>"other"}, "Grandpa"=>{"age"=>444, "gender"=>"other"}, "Eddie"=>{"age"=>52, "gender"=>"other"}, "Marilyn"=>{"age"=>65, "gender"=>"other"}}

# question 7 - Method calls can take expressions as arguments. Suppose we define a function 
# called rps as follows, which follows the classic rules of rock-paper-scissors game, but with 
# a slight twist that it declares whatever hand was used in the tie as the result of that tie.
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
# What is the result of the following call?
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") # => paper

# question 8 - What would be the output of this code:
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
bar("yes") # => "no"
