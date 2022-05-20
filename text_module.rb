module Text 
    #Welcome, rules and explanations

    def the_welcome_text
        puts "Welcome, lets play MasterMind on the console, shall we?"
    end

    def colors_text
        puts "The colors of each numbers are:\n 
        1 = Green \n
        2 = Blue \n
        3 = Red \n
        4 = Yellow \n
        5 = magenta \n
        6 = Cyan \n
        "
    end

    def rules_text
        puts <<-HEREDOC 
        Rules are simple:
        A) Choose your rol (MasterMind or CodeBreaker)
        B) If you choose CodeBreaker, you have ten rounds to break the code.
        C) Each round you will have a automatic feedback:
        White points = Right color and right position
        Black Points = Right color and Wrong position
        D) If the CodeBreaker does not break the code after ten rounds
        the MasterMind wins one point, else the CodeBreaker wins the point"
        E) At the end of the Round, roles should be reversed.
        F) No duplicated number on any code, to keep it easy (but to make the code harder for me).

        HEREDOC
    end


    def select_your_rol_text
        puts "What do you want to be? MasterMind (M) or CodeBreaker(C)?"   
    end

    #methods text
    
    def update_the_board_text
        puts "Choose your numbers, CodeBreaker"
    end

    def the_turn_number_text(number)
        puts "This is the turn ##{number}."
    end

    def whats_your_name
        puts "How should I call you?"
    end

    #Victory and Defeat

    def victory_text
        puts "You have won, Codebreaker!"
    end

    def defeat_text
        puts "CodeBreaker was unable to guess, MasterMind have won!"
    end

    def victory_text_computer
        puts "The computer broke your code... best luck next time!"
    end

    def defeat_text_computer
        puts "Computer could not break your code, well done MasterMind!"
    end


    #color_method
    def printing_with_color(string)
    case string
        when "1"
        print " 1 ".on_green
        when "2"
        print " 2 ".on_blue
        when "3"
        print " 3 ".on_red
        when "4"
        print " 4 ".on_yellow
        when "5"
        print " 5 ".on_magenta
        when "6"
        print " 6 ".on_cyan
    end
    end

    def color_clues(number)
        if number == 1
            print " o ".black
        elsif number == 0
            print " o ".white
        end
    end

end