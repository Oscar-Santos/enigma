class Enigma
  attr_reader :alphabet_hash,
              :alphabet_array

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

  def shift(key, date)

    a_offset = key.slice(0..1).to_i + date.slice(0).to_i
    b_offset = key.slice(1..2).to_i + date.slice(1).to_i
    c_offset = key.slice(2..3).to_i + date.slice(2).to_i
    d_offset = key.slice(3..4).to_i + date.slice(3).to_i
    [a_offset, b_offset, c_offset, d_offset]
  end

  def number_generator(message)
    message_array = message.chars
    message_array.map do |letter|
      @alphabet_hash[letter]
    end
  end

  def encrypt(message, key = generate_key , date = generate_date)
    shift = shift(key, date)
    message_array = message.chars
    collector = []
    message_array.each_with_index do |letter, index|
      if index % 4 == 0

        collector << @alphabet_array.rotate(shift[0])[letter.to_i]

      elsif index % 4 == 1
        collector << @alphabet_array.rotate(shift[1])[index]
      elsif index % 4 == 2
        collector << @alphabet_array.rotate(shift[2])[index]
      elsif index % 4 == 3
        collector << @alphabet_array.rotate(shift[3])[index]
      end
    end
  end
end
