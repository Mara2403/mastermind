# frozen_string_literal: true

# Module TextContent: Provides methods text formatting and text descriptions
module TextContent
  def formatting(style, text)
    {
      'underline' => "\e[4m#{text}\e[0m",
      'bold' => "\e[1m#{text}\e[0m"
    }[style]
  end

  def ingame_text(description)
    {
      'user_choice' => 'Choose 1 if you want to be the code BREAKER or 2 if you want to be the code MAKER',
      'warning_mode' => 'Please, choose 1 or 2',
      'enter_4_numbers' => 'Enter 4 numbers from 1 to 6:',
      'user_won' => 'YOU WON! You cracked the code. Congratulations!',
      'wrong_input' => 'Wrong input. Please, enter four numbers from 1 to 6: ',
      'break' => 'Thanks for playing!',
      'play_again' => 'Would you like to play again? y/n',
      'y/n_only' => 'Wrong input. Please choose y or n',
      'computer_won' => 'Computer cracked the code!'
    }[description]
  end

  def game_intro
    <<~HEREDOC
      #{formatting('bold', '  Welcome to the Mastermind Game!')}

      Get ready for a challenging adventure where your wit and strategy will be put to the test.

        In this game, you have 12 attempts to crack the secret code.
      The code consists of pegs with numbers from 1 to 6, each representing a color.

      - You can be #{formatting('underline', 'the code maker')} and let the computer try to break your code.
      - Or you can be #{formatting('underline', 'the code breaker')} and try to guess the computer's secret code.

      So, gear up, make your choice, and let the code-breaking adventure begin! Best of luck!

    HEREDOC
  end

  def player_instructions
    <<~HEREDOC

      You are #{formatting('underline', 'the code breaker')}!

        The code consists of 4 pegs, each with a different color and a number from 1 to 6.

      You have 12 turns to decipher the code. After each guess, you will receive clues to guide you. Here's what the clues mean:

      #{formatting('bold', 'Filled Circle:')} Indicates a peg with the correct color and in the right position.

      #{formatting('bold', 'Empty Circle:')} Represents a peg with the correct color but in the wrong position.

        Best of luck!

      Let's begin. Try to guess the code.
    HEREDOC
  end
end

def computer_game_instructions
  <<~HEREDOC

    Please, choose four numbers from 1 to 6 to create your secret code. The computer will try to figure out what that code is within 12 turns. Each time the computer makes a guess, he will be provided with feedback to help it refine its strategy.
  HEREDOC
end
