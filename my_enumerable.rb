

module Enumerable

	def my_each
		for i in self
			yield(i)
		end
		return self
	end

	def my_each_with_index
		for i in (0..(self.count-1))
			yield(self[i], i)
			return self
		end
	end

	def my_select
		array = []
		self.my_each do |x|
			array << x if yield(x)
		end
		return array
	end

	def my_any?
		self.my_each do |x|
			if yield(x)
				return true
				break
			else
				return false
			end
		end
	end

	def my_all?
		self.my_each do |x|
			if !(yield(x))
				return false
			end
		end
		true
	end

	def my_none?

		if block_given?
			my_each { |x| return false if yield(x) }
		else
			my_each { |x| return false if x}
		end
		true
	end

	def my_count
		counter = 0
		if block_given?
			my_each {|x| counter += 1 if yield(x)}
		else
			my_each {|x| counter += 1 if x}
		end
		return counter
	end

	def my_map(proc)
		new_array = []
		if block_given?
			for i in self
				new_array << yield(proc.call(i))
			end
		elsif proc
			for i in self
				new_array << proc.call(i)
			end
		else
			my_each {|x| new_array << x}
		end
		return new_array
	end

	def my_inject(start=0)
		collection = start
		my_each do |x|
			collection = yield(collection, x)
		end
		return collection
	end
end

def multiply_els(array)
		array.my_inject(1){|x,y| x * y}
end


 