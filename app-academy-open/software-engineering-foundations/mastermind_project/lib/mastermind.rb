require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    puts "Exact matches: #{code.num_exact_matches(@secret_code)}"
    puts "Near matches: #{code.num_near_matches(@secret_code)}"
  end

  def ask_user_for_guess
    puts "Enter a code"
    guess = Code.from_string(gets.chomp)
    print_matches(guess)
    @secret_code == guess
  end
end
