# MasterMind

This may come in handy later... or not :
#board display and interaction
#I think I do not need a board this time...
#just players, puts and turns...

class Board 
    attr_reader :dot, :turn
    def initialize 
        @dot=[["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],
        ["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],["o","o","o","o"],
        ["o","o","o","o"],["o","o","o","o"],]
        @turn=0
    end

    def view
        puts <<-HEREDOC
        #{dot[0][0]}|#{dot[0][1]}|#{dot[0][2]}|#{dot[0][3]}|
        #{dot[1][0]}|#{dot[1][1]}|#{dot[1][2]}|#{dot[1][3]}|
        #{dot[2][0]}|#{dot[2][1]}|#{dot[2][2]}|#{dot[2][3]}|
        #{dot[3][0]}|#{dot[3][1]}|#{dot[3][2]}|#{dot[3][3]}|
        #{dot[4][0]}|#{dot[4][1]}|#{dot[4][2]}|#{dot[4][3]}|
        #{dot[5][0]}|#{dot[5][1]}|#{dot[5][2]}|#{dot[5][3]}|
        #{dot[6][0]}|#{dot[6][1]}|#{dot[6][2]}|#{dot[6][3]}|
        #{dot[7][0]}|#{dot[7][1]}|#{dot[7][2]}|#{dot[7][3]}|
        #{dot[8][0]}|#{dot[8][1]}|#{dot[8][2]}|#{dot[8][3]}|
        #{dot[9][0]}|#{dot[9][1]}|#{dot[9][2]}|#{dot[9][3]}|
        HEREDOC
    end

    def update
        input=gets.chomp.split("")
        dot[@turn].replace(array)
        @turn += 1
    end
end


#other stuff

def random_number
    number=(rand*7).to_i
end

def computer_master_code
    @master_code = [] if @master_code.length == 4
    until @master_code.length == 4 do
        number = random_number
        @master_code.push(number.to_s) if number != 0
        @master_code.uniq!
    end
end

@master_code = []

answer = gets.chomp.split("")



#learning how to compare
irb(main):054:1* answer.each do |x|
irb(main):055:2*   @master_code.each do |m|
irb(main):056:2*     puts x
irb(main):057:2*     puts m
irb(main):058:2*     puts  m.eql?(x)
irb(main):059:1*   end
irb(main):060:0> end
