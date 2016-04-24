# ex_easy3.rb

# question 1 - Show an easier way to write this array:
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# question 2 - How can we add the family pet "Dino" to our usual array:
flintstones.push("Dino") # => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino"]

# question 3 - How can we add multiple items to our array? (Dino and Hoppy)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Hoppy") # => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino", "Hoppy"]

# question 4 - Shorten this sentence...remove everything starting from "house".
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0..38) # => "Few things in life are as important as "
p advice # => "house training your pet dinosaur."
# bonus - what happend if you use String#slice instead?
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice(0..38) # => "Few things in life are as important as "
p advice # => "Few things in life are as important as house training your pet dinosaur."

# question 5 - Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"
statement.count "t" # => 2

# question 6 - Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 
# 40 character wide table of Flintstone family members, how could we easily center that title above the table 
# with spaces?
title = "Flintstone Family Members"
title.center(40) # => "       Flintstone Family Members        "