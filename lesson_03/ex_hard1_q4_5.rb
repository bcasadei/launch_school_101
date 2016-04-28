# ex_hard1_q4.rb

# question 4 - Write a method that returns one UUID when called with no parameters.
def uuid
  char_array = [('a'..'f'), (0..9)].map { |i| i.to_a }.flatten # set an array of characters 0-9, a-f
  string = (0...32).map { char_array[rand(char_array.length)] }.join # randomly select 32 characters
  string.unpack("m0").first.unpack("H8H4H4H4H12").join("-") # decode string to base64 ecoded array, decode to hexadecimal array in 8-4-4-4-12 format, join array
end
uuid

# question 5 - Fix code. You're not returning a false condition, and not handling the case that there are more 
# or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size < 4 || dot_separated_words.size > 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end
  return true
end

dot_separated_ip_address?("192.458.1.1")