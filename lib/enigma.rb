require "./lib/alphabet"
require "date"
require "./lib/helper_encrypt"

class Enigma
  include HelperEncrypt
  attr_reader :alphabet_hash,
              :alphabet_array,
              :encrypted_hash,
              :decrypted_hash

  def initialize

    @alphabet_hash  = Alphabet.new.index
    @alphabet_array = Alphabet.new.alphabet_array
    @encrypted_hash = {encryption: nil,
                       key: nil,
                       date: nil}
    @decrypted_hash = {decryption: nil,
                      key: nil,
                      date: nil}
  end

  def encrypt(message, key = generate_key, date = generate_date)
    shift = shift(key, format_date(date))
    downcase_message = message.downcase
    message_array = number_generator(downcase_message.gsub(/\n/, ""))


    encrypted_message = message_array.map.with_index do |letter, index|
      @alphabet_array.rotate(shift[index % 4])[letter]
    end
    @encrypted_hash[:encryption] = encrypted_message.join
    @encrypted_hash[:key]        = key
    @encrypted_hash[:date]       = date
    @encrypted_hash
  end

  def decrypt(message, key, date = generate_date)
    shift = shift(key, format_date(date), false)
    message_array = number_generator(message.gsub(/\n/, ""))
    collector = []
    message_array.each_with_index do |letter, index|
      collector << @alphabet_array.rotate(shift[index % 4])[letter]
    end
    @decrypted_hash[:decryption] = collector.join
    @decrypted_hash[:key]        = key
    @decrypted_hash[:date]       = date
    @decrypted_hash
  end
end
