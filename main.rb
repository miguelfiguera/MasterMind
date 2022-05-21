require_relative 'game'
require_relative 'text_module'
require "pry"


def game
  game = Game.new
  game.game_prep
  game.creating_players
  binding.pry
  if game.code_breaker == game.player1
    game.computer_master_code
    game.human_codebreaker_turns
    game.point_distribution_human
        if game.victory_real
            puts game.victory_text
        elsif game.defeat_real
             puts "Computer wins this time!"
        end
  elsif game.code_breaker == game.player2
    game.human_master_code
    game.computer_codebreaker_turns
    game.computer_points_distribution
        if game.victory_real
            puts game.victory_text
        elsif defeat_real
            puts "Computer wins this time!"
        end
  end
  repeat
end

def repeat
  puts 'Do you want to play again? Y/N'
  answer = gets.chomp.downcase
  if answer == 'y'
    game
  elsif answer != 'y' && answer != 'n'
    puts 'I did not understand...'
    repeat
  else
    puts 'Thanks for playing!'
  end
end

game