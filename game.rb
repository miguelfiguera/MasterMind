require_relative "text_module.rb"
require "colorize"
require "pry"

# player creation
class Player 
    attr_reader :name,:points
    attr_writer :points
    def initialize(name)
        @name=name
        @points= 0
    end
end


#Game Mechanics
class Game
    attr_reader :turn, :player1,:answer,:player2,:code_breaker,:master_code
    include Text

    def initialize
        @player1=nil
        @player2= nil
        @code_breaker=nil
        @master_code=[]
        @turn= 1
        @answer = []
    end

#basic methods

public

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

def answer_printing
    @answer.each do |str|
        printing_with_color(str)
    end
end


def codebreaker_answer
    @answer = gets.chomp.split("")
    if @answer.any? { | x | x == "0"|| x == "7" || x == "8" || x == "9"}
        puts "Choose only between 1 & 6!"
        codebreaker_answer
    elsif @answer.uniq.length != 4
        puts "No duplicates please"
        codebreaker_answer
    else
        answer_printing
        turn_update
    end
end

def turn_update
    @turn += 1
end
    
def choosing_role
    select_your_rol_text
    answer = gets.chomp.downcase
    if answer == "m"
        @code_breaker = @player2
    elsif answer == "c"
        @code_breaker = @player1
    end
end

def clue_output
    @master_code.each_with_index do |m,i|
        @answer.each_with_index do |a,ix|
        if a == m && i == ix
        color_clues(0)
        elsif a == m && i!=ix
        color_clues(1)
        end
        end
    end
    puts ""
end

def winning
    @answer.eql?(@master_code)
end

def defeat 
    @turn == 11
end

def create_player
    whats_your_name
    name=gets.chomp
    player=Player.new(name)
end

def create_computer
    player=Player.new("Computer")
end

public

def victory_real
    @player1.points == 3
end

def defeat_real
    @player2.points==3
end

def swap_status
    if @code_breaker==@player1
        @code_breaker=@player2
    else
        @code_breaker=@player1
    end
end

#compound methods
public

def point_distribution_human
    if winning
        @player1.points += 1
    elsif defeat
        @player2.points += 1
    end
end

def reset_turns
    @turn = 1
end

def human_codebreaker_turns
    until defeat do
        the_turn_number_text(@turn)
        update_the_board_text
        codebreaker_answer
        clue_output
        break if winning
    end
end

def creating_players
    @player1=create_player
    @player2=create_computer
    choosing_role
end

def game_prep
    the_welcome_text
    rules_text
    colors_text
end

    #computer as CodeBreaker
    
    public

    def human_master_code
        human_master_code_text
        answer=gets.chomp.split("")
        @master_code=answer
    end
    
    def computer_guess
        @answer = [] if @answer.length == 4
         until @answer.uniq.length == 4 do
            number = random_number
            @answer.push(number.to_s) if number != 0
            @answer.uniq!
         end
         answer_printing
         turn_update
    end
    
    def computer_codebreaker_turns
        until defeat do
            the_turn_number_text(@turn)
            update_the_board_text
            computer_guess
            clue_output
            break if winning
        end
    end
    
    def computer_points_distribution
        if winning
            @player2.points += 1
        elsif defeat
            @player1.points += 1
        end
    end
    
    #end of class
end