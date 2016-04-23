# ex_easy2.rb

# question 1 - see if there is an age present for "Spot".
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.has_key?("Spot") # => false
ages.include?("Spot") # => false
ages.member?("Spot") # => false

# question 2 - Add up all of the ages from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_ages = ages["Herman"] + ages["Lily"] + ages["Grandpa"] + ages["Eddie"] + ages["Marilyn"] + ages["Spot"]
puts "total_ages is: #{total_ages}"
# option 2
total_ages = 0
ages.each_value do |value| 
  total_ages += value 
end
puts "total_ages is #{total_ages}"
# option 3
puts ages.values.inject(:+)

# question 3 - throw out the really old people (age 100 or older).
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.delete_if {|key, value| value > 100 }

# question 4 - Convert the string in the following ways (code will be executed on original munsters_description):
# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.slice(0..3) + munsters_description.slice(4).downcase + munsters_description.slice(5..-1)
puts munsters_description.slice(0).downcase + munsters_description.slice(1..2).upcase + munsters_description.slice(3..4).downcase + munsters_description.slice(5..-1).upcase
puts munsters_description.downcase
puts munsters_description.upcase
# or Launch School's easier solution for the first 2
munsters_description.capitalize!
munsters_description.swapcase!

# question 5 - add ages for Marilyn and Spot to the existing hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

# question 6 - Pick out the minimum age from our current Munster family hash:
ages.values.min { |a, b| a <=> b} # => 10
ages.values.min # => 10

# question 7 - See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice("Dino") # => nil
advice.scan("Dino") # => []
advice.match("Dino") # => nil

# question 8 - Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index {|s| s =~ /Be/} # => 3

# question 9 - Using array#map!, shorten each of these names to just 3 characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |x| x.slice(0..2)}

# question 10 - Again, shorten each of these names to just 3 characters -- but this time do it all on one line:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |x| x[0..2]}
