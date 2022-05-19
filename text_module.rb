#frozen_string_literals: true
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
        5 = Purple \n
        6 = Cyan \n
        "
    end

    def rules_text
        puts <<-HEREDOC "Rules are simple:
        A) Choose your rol (MasterMind or CodeBreaker)
        B) If you choose CodeBreaker, you have ten rounds to break the code.
        C) Each round you will have a automatic feedback:
        Black points = Right color and right position
        White Points = Right color and Wrong position
        D) If the CodeBreaker does not break the code after ten rounds
        the MasterMind wins one point, else the CodeBreaker wins the point"
        E) At the end of the Round, roles should be reversed.
        HEREDOC
    end

    def select_your_rol_text
        puts "What do you want to be? MasterMind (M) or CodeBreaker(C)?"   
    end

    #methods text
    def update_the_board_text
        puts "Choose your colors"
    end