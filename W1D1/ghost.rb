require 'byebug'

class Game
  def initialize(players=[])
    @players = players
    @fragment = ""
    @dictionary = File.readlines("dictionary.txt").map(&:chomp)
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players = @players.rotate
  end

  def valid_play?(string)
    ('a'..'z').include?(string.downcase)
  end

  def loss?
    return true if @dictionary.include?(@fragment) || !dictionary_include?(@fragment)
  end

  def take_turn(player)
    loop do
      guess = player.guess
      if valid_play?(guess)
        @fragment += guess
        break
      else
        player.alert_invalid_guess
      end
    end
  end

  def play_round
    @fragment = ''
    until loss?
      puts "Current fragment: #{@fragment}"
      take_turn(current_player)
      next_player!
    end
    previous_player.ghost_add!
    puts "#{previous_player.name} lost!"
    puts "#{previous_player.name} now has #{previous_player.ghost_string}."
  end

  def play
    until @players.any? { |player| player.ghost_string == 'GHOST' }
      play_round
    end
  end

  private

  def dictionary_include?(fragment)
    @dictionary.each do |word|
      return true if word[0...fragment.length] == fragment
    end
    false
  end
end


class Player
  GHOST_STRING = 'GHOST'

  attr_reader :ghost_string, :name

  def initialize(name, game)
    @name = name
    @game = game
    @ghost_string = ''
  end

  def ghost_add!
    @ghost_string = GHOST_STRING[0..@ghost_string.length]
  end

  def guess
    puts "#{@name}, please type in a guess:"
    @guess = gets.chomp
    @guess
  end

  def alert_invalid_guess
    puts "#{@name}, your guess is invalid."
  end
end
