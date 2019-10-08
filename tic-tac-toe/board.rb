class Board
    attr_accessor :valid_choices

    @@LINE_WIDTH = 48
    WINNING_COMBOS = [
        [0, 3, 6], [1, 4, 7], [2, 5, 8], #columns
        [0, 1, 2], [3, 4, 5], [6, 7, 8], #rows
        [0, 4, 8], [2, 4, 6]             #diagonals
    ]

    def initialize
        @valid_choices = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def draw_board
        puts "1, 2, 3:  #{@valid_choices[0]} | #{@valid_choices[1]} | #{@valid_choices[2]} ".center(@@LINE_WIDTH)
        puts "          -----------".center(@@LINE_WIDTH)
        puts "4, 5, 6:  #{@valid_choices[3]} | #{@valid_choices[4]} | #{@valid_choices[5]} ".center(@@LINE_WIDTH)
        puts "          -----------".center(@@LINE_WIDTH)
        puts "7, 8, 9:  #{@valid_choices[6]} | #{@valid_choices[7]} | #{@valid_choices[8]} ".center(@@LINE_WIDTH)
    end

    def draw_choice (player, choice)
        self.valid_choices[choice-1] = player.marker if self.validate_choice(choice)
    end

    def validate_choice (choice)
        if valid_choices[choice-1] != " "
            false
        elsif choice < 1 || choice > 9
            false
        else
            true
        end
    end

    def winner? (choice)
        winner = false
        WINNING_COMBOS.each do |positions|
            winner = positions.all? do |spot|
                choice == self.valid_choices[spot]
            end
            break if winner
        end
        
        return winner
    end
end