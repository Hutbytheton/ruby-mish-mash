
def caesar_cipher(phrase, shift) 
	new_phrase = ''
	phrase.each_char do |letter|
		number = letter.sum
		if (65..90) === number
			number += shift.to_i
			if number > 90
				number -= 26
			end
		elsif (97..122) === number
			number += shift.to_i
			if number > 122
				number -= 26
			end
		end
		letter = number.chr
		new_phrase += letter
	end

	puts new_phrase
end

puts "Enter your phrase"
input = gets.chomp
puts "Enter your shift"
value = gets.chomp
caesar_cipher(input, value)