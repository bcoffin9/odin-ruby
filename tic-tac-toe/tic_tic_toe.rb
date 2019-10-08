require_relative 'board'
require_relative 'player'

class TicTacToe
    attr_accessor :board, :end, :number_of_turns, :active_player, :first_turn_complete, :winner
    attr_reader :player1, :player2

    def initialize (p1, p2)
        @player1 = Player.new(p1, true)
        @player2 = Player.new(p2, false)
        @end = true
        @board = Board.new
        @number_of_turns = 0
        @first_turn_complete = false
        @active_player = @player1
        @winner = false
    end

    def game_over?
        #board is filled, ends in a tie
        if (self.board.valid_choices.all? { |choice| choice != " "}) #board full
            self.end = false
            self.winner = self.board.winner?(self.active_player.marker)
        elsif self.board.winner?(self.active_player.marker) #winner
            self.end = false
            self.winner = true
        else
            self.end = true
        end
    end

    def turn
        if self.active_player.marker == "X" && self.first_turn_complete
            self.active_player = self.player2
        else
            self.active_player = self.player1
        end

        puts "Make a selection #{self.active_player}"
        choice = gets.chomp.to_i
        self.board.draw_choice(self.active_player, choice)
        self.number_of_turns += 1
        self.board.draw_board
        
        if !self.first_turn_complete
            self.first_turn_complete = true
        end
    end

    def play
        while self.end
            self.turn
            self.game_over? if self.number_of_turns > 4
        end

        if self.winner
            puts "#{self.active_player.name} has destroyed the competition!!"
        else
            puts "The battle was fierce but no winner has proven themself.."
        end
    end


end

lineWidth = 48
puts "***********************************".center(lineWidth)
puts "-----------------------------------".center(lineWidth)
puts "We've been expecting you. Welcome to Tic-Tac-Toe"
puts "created by Confucious ca. 740 A.D."
puts "Objective: Line up three of your markings either"
puts "vertically, horizontally, or diagonally."
puts "The game can end in a tie if the board fills up"
puts "and you or the other player have not achieved"
puts "the objective. Good luck."
puts "----------------------------------".center(lineWidth)

puts "Player 1's Name: "
player1 = gets.chomp

puts "Player 2's Name:"
player2 = gets.chomp

game = TicTacToe.new(player1, player2)
game.board.draw_board
game.play