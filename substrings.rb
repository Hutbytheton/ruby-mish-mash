dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(words, dic)
	words = words.downcase
	results = {}
	dic.each do |term|
		if words =~ /#{term}/
			results[term] = words.scan(/#{term}/).length
		end
	end
	puts results

end

substrings("Howdy partner, sit down! How's it going?", dictionary)