require "date"

module HelperEncrypt
  def generate_key
    rand(99999).to_s.rjust(5, "0")
  end

  def generate_date
    date = Date.today
    date_to_string = date.strftime('%d%m%y')
  end

  def offset(new_date)
    squared_date = (new_date.to_i ** 2)
    squared_date.to_s[-4..-1]
  end

  def shift(key, date, encrypt = true)
    a_offset = key.slice(0..1).to_i + date.slice(0).to_i
    b_offset = key.slice(1..2).to_i + date.slice(1).to_i
    c_offset = key.slice(2..3).to_i + date.slice(2).to_i
    d_offset = key.slice(3..4).to_i + date.slice(3).to_i
    shifts = [a_offset, b_offset, c_offset, d_offset]
    if encrypt
      return shifts
    else
      return shifts.map{|shift| shift * -1}
    end
  end

  def number_generator(message)
    message_array = message.chars
    message_array.map do |letter|
      if @alphabet_hash[letter]
        @alphabet_hash[letter]
      else
        letter.ord
      end
    end
  end
end
