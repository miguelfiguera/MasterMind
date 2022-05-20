require_relative "game.rb"
require_relative "text_module.rb"

def game
    game=Game.new
    game.game_prep
    game.creating_players
    game.human_codebreaker_turns
end

def repeat?
    puts "Do you want to play again? Y/N"
    answer=gets.chomp.downcase
    if answer=="y"
        game
    elsif answer != "y" || answer != "n"
        puts "I did not understand..."
        repeat?
    else
        puts "Thanks for playing!"
    end
end