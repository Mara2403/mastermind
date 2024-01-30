# frozen_string_literal: true

# Provides methods to create Mastermind game board
module Display
  def pegs(number)
    {
      1 => "\e[107m 1 \e[0m ",
      2 => "\e[105m 2 \e[0m ",
      3 => "\e[103m 3 \e[0m ",
      4 => "\e[101m 4 \e[0m ",
      5 => "\e[106m 5 \e[0m ",
      6 => "\e[102m 6 \e[0m ",
    }[number]
  end

  def clues(clue)
    {
      'o' => " \u25CB ", # good_color_wrong_position
      'x' => " \u25CF " # good_color_good_position
    }[clue]
  end

  def show_code(array)
    array.each do |number|
      print pegs(number)
    end
  end

  def show_clues(array)
    array.each do |clues|
      print clues(clues)
    end
    puts
  end
end
