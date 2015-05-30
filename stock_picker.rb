def stock_picker(array)
	tracker = {}
	array.each do |buy|
		index1 = array.index(buy)
		array.each do |sell|
			index2 = array.index(sell)
			net = sell - buy
			if index1 < index2
				tracker[net] = [index1, index2]
			end
		end
	end
	tracker.each do |net, days|
		puts days if net == tracker.keys.max
	end
end

stock_picker([17,3,6,9,15,8,6,1,10])