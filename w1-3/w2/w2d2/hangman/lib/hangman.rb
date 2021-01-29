class Hangman

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize

    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)

    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)

    indices_a = []

    @secret_word.each_char.with_index do |c, i| 
      indices_a << i if c == char
    end
    indices_a
  end

  def fill_indices(char, indices_a)

    indices_a.each do |i|

      @guess_word[i] = char 
    end
  end

  def try_guess(char)
    if  self.already_attempted?(char) 
      p "that has already been attempted"
      return false 
    else  
      @attempted_chars << char 
    end
    matchings_a = self.get_matching_indices(char)
    if matchings_a.empty?
      @remaining_incorrect_guesses -= 1
    end
    self.fill_indices(char,matchings_a)


    true
  end

  def ask_user_for_guess

    p 'Enter a char:'
    char = gets.chomp

    self.try_guess(char)
  end

  def win?

    if @secret_word == @guess_word.join('')
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?

    if @remaining_incorrect_guesses == 0 
      p 'LOSE'
      true
    else
      false
    end
  end

  def game_over?

    if self.win? || self.lose?
      p @secret_word
      true
    else
      false
    end 
  end

end








