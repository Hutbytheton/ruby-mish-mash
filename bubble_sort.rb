def bubble_sort(array)
	array.length.times do 
		array.each_with_index do |left, index|
			right = array[index + 1]
			(left <=> right) == 1 ? (array[index], array[index + 1] = right, left) : next
		end
	end
	p array
end

def bubble_sort_by(array, &block)
	if block_given?
		array.length.times do
			array.each_with_index do |left, index|
				right = array[index + 1]
				(yield("#{array[index]}", "#{array[index + 1]}") > 0) ? (array[index], array[index + 1] = right, left) : next
			end
		end
		p array.reverse
	else
		bubble_sort(array)
	end
end

bubble_sort_by([4,3,78,2,0,2])

bubble_sort_by(['hi','hello','hey']) do |left,right|
	right.length - left.length
 end