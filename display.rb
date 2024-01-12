# frozen_string_literal: true

# Provides methods to create Mastermind game board
module Display
  def create_board
    {
      '1' => "\e107m 1 \e0m",
      '2' => "\e105m 2 \e0m",
      '3' => "\e103m 3 \e0m",
      '4' => "\e101m 4 \e0m",
      '5' => "\e106m 5 \e0m",
      '6' => "\e102m 6 \e0m"
    }
  end
end
