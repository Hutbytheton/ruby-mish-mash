class Game

	private 

	def initialize
		@markers = Markers.new
		assign_piece
		@player1 = Player.new(@one, "Player 1")
		@player2 = Player.new(@two, "Player 2")
		@player = @player1
		play
	end

	def display
		@markers.display
	end

	def update
		puts "Invalid move. Try again."
		play
	end

	def play
		until victory? || tie?
			@markers.display
			puts "#{@player.name}, enter the number of the space you choose."
			begin
				choice = gets.chomp.to_i
				piece = @player.piece
				(1..9).include?(choice) ? @markers.update(piece, choice) : raise("number")
			rescue
				puts "Invalid input. Try again."
				retry
			else
				next_turn
			end
		end
		game_over_announcement
	end

	def game_over_announcement
		next_turn
		@markers.display
		puts tie? == true ? "The game has ended in a draw." : "Congratulations #{@player.name}! You have won the match!"
		puts "\n"
		#exit
	end

	def next_turn
		@player == @player1 ? @player = @player2 : @player = @player1
	end

	def victory?
		@markers.victory?
	end

	def tie?
		@markers.tie?
	end

	def assign_piece
		if rand > 0.5
			@one = :x
			@two = :o
		else
			@one = :o
			@two = :x
		end
	end
end


class Player < Game

	attr_reader :piece
	attr_reader :name

	private

	def initialize(piece, name)
		@piece = piece
		@name = name
		puts "#{name}, your pieces are the #{piece.to_s.upcase}'s!"
	end

end

class Markers < Game
	def initialize
		@markers = (1..9).to_a
		@moves = Array.new(9, true)
	end

	def display
		puts "\n"
		puts "#{@markers[0]}|#{@markers[1]}|#{@markers[2]}"
		puts "-+-+-"
		puts "#{@markers[3]}|#{@markers[4]}|#{@markers[5]}"
		puts "-+-+-"
		puts "#{@markers[6]}|#{@markers[7]}|#{@markers[8]}"
		puts "\n"
	end		

	def update(piece, choice)
		cell = choice - 1
		if @moves[cell]
			@markers[cell] = piece.to_s.upcase
			@moves[cell] = false
		else
			raise("cell")
		end
	end

	def victory?
		win =  [[1,2,3], [4,5,6], [7,8,9],
						       [1,4,7], [2,5,8], [3,6,9],
									 [1,5,9], [3,5,7]]
		win.any? do |win|
			@markers[win[0] - 1] == @markers[win[1] - 1] && @markers[win[1] - 1] == @markers[win[2] - 1]
		end		
	end

	def tie?
		@moves.all? { |move| move == false }
	end
end