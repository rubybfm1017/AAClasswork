class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(arr)
    
    if arr.all? {|el| POSSIBLE_PEGS.keys.include?(el.upcase)}
      return true
    else
      return false
    end
    
  end

  def initialize(arr)
    if !Code.valid_pegs?(arr)
      raise "not a valid pegs"
    end
    @pegs = arr.map {|ele| ele.upcase }

  end
  def self.random(num)#3
    rand = POSSIBLE_PEGS.keys.sample 
    word = Array.new(num) {rand} 
    Code.new(word)
  end

  def self.from_string(str)
    words = str.split("")
    Code.new(words)
  end

  def [](num)
    @pegs[num]
  end
  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0 
    guess.pegs.each do |el| 
      if (guess.pegs.index(el) == @pegs.index(el)) && (el == @pegs[guess.pegs.index(el)])
        count += 1
      end
    end
    count     
  end
  def num_near_matches(guess)
    count = 0 
    (0...guess.pegs.length).each do |i|
      if @pegs.include?(guess.pegs[i]) && @pegs[i] != guess.pegs[i]
        count += 1
      end
    end
    count 
  end
   
  def ==(guess)
    return false if guess.length != self.length
    return false if guess.pegs != self.pegs
    true
  end

  

end
