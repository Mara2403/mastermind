# frozen_string_literal: true

require_relative 'text_content'
require_relative 'display'

# Provides game logic
class Game
  include TextContent
  include Display

  def play
    puts game_intro
    choose_mode
    show_code([1,2,3,4,5,6])
    show_clues(%w[x x o o])
  end

  def choose_mode
    puts ingame_text('user_choice')
    gets.chomp
  end
end
