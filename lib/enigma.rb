class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = Alphabet.new.index
  end

  def generate_keys
    rand(99999).to_s.rjust(5, '0')
  end

  def generate_date
    date = Date.today
    date_to_string = date.strftime('%d%m%y')
  end
end
