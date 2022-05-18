# player creation
class Player 
    def initialize(name,rol)
        @name=name
        @rol=rol
    end
end

#board display and interaction

class Board 
    attr_reader :dot
    def initialize 
        @dot=[["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],
        ["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],
        ["o","o","o","o"],["o","o","o","o"],]
    end
end


#Game Mechanics