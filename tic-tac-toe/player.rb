class Player

    attr_reader :name, :marker

    def initialize (name, first)
        @name = name
        @marker = first == true ? "X" : "O"
    end

    def to_s
        name
    end

end