# frozen_string_literal: true

require_relative 'text_content'

# Provides game logic
class Game
  include TextContent

  def play
    puts game_intro
    choose_mode
  end

  def choose_mode
    puts ingame_text('user_choice')
    gets.chomp
  end
end
