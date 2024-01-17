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
      'warning_mode' => 'Please, choose 1 or 2'
    }[description]
  end

  def game_intro
    <<~HEREDOC
      #{formatting('bold', '  Welcome to the Mastermind Game!')}

        Get ready for a challenging adventure where your wit and strategy will be put to the test.

        In this game, you have 12 attempts to crack the secret code.
        The code consists of pegs with numbers from 1 to 6, each representing a color.

      #{formatting('bold', '  Instructions:')}
      - You can be #{formatting('underline', 'the code maker')} and let the computer try to break your code.
      - Or you can be #{formatting('underline', 'the code breaker')} and try to guess the computer's secret code.

        So, gear up, make your choice, and let the code-breaking adventure begin! Best of luck!

    HEREDOC
  end
end
