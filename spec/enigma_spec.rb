require_relative 'spec_helper'
require "./lib/enigma"
require "./lib/helper_encrypt"
require "./lib/alphabet"

RSpec.describe "enigma" do
  it "exists" do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  it "has an alphabet in a hash and an array" do
    enigma = Enigma.new
    expect(enigma.alphabet_hash).to be_a(Hash)
    expect(enigma.alphabet_hash.length).to eq(27)
    expect(enigma.alphabet_array).to be_a(Array)
    expect(enigma.alphabet_array.length).to eq(27)
  end

  it "can generate keys" do
    enigma = Enigma.new
    expect(enigma.generate_key).to be_a(String)
    expect(enigma.generate_key.length).to eq(5)
  end

  it "can generate a date" do
    enigma = Enigma.new
    expect(enigma.generate_date).to be_a(String)
    expect(enigma.generate_date.length).to eq(6)
  end

  it "it can square the date and take the last 4 digits" do
    enigma = Enigma.new
    expect(enigma.offset("040895")).to be_a(String)
    expect(enigma.offset("040895")).to eq("1025")
  end

  it "can shift for encryption" do
    enigma = Enigma.new
    expect(enigma.shift("02715", "1025")).to eq([3, 27, 73, 20])
  end

  it "can shift for decryption" do
    enigma = Enigma.new
    expect(enigma.shift("02715", "1025", false)).to eq([-3, -27, -73, -20])
  end

  it "can turn the message into an array of indexes in the alphabet" do
    enigma = Enigma.new
    expect(enigma.number_generator("hello world")).to be_a(Array)
    expect(enigma.number_generator("hello world")).to eq([7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3])
  end


  it "can encrypt" do
    enigma = Enigma.new
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq( {
                                                                      encryption: "keder ohulw",
                                                                      key: "02715",
                                                                      date: "040895"
                                                                      })
  end

  it "can decrypt" do
    enigma = Enigma.new
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq( {
                                                                      decryption: "hello world",
                                                                      key: "02715",
                                                                      date: "040895"
                                                                      })
  end

  it "can encrypt a message with a key and todays date and can decrypt it back" do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expect(encrypted[:encryption]).to be_a(String)
    expect(encrypted[:encryption].length).to eq(11)
    expect(encrypted[:date]).to be_a(String)
    expect(encrypted[:date].length).to eq(6)
    expect(encrypted[:key]).to eq("02715")
    expect(enigma.decrypt(encrypted[:encryption], "02715")).to eq({:date=>"170122",
                                                                    :decryption=>"hello world",
                                                                    :key=>"02715"})
  end

  it "can encrypt a message by generating a random key and todays date" do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world")
    expect(encrypted).to be_a(Hash)
    expect(encrypted.keys.length).to eq(3)
  end

  it 'can downcase capital letters' do
    enigma = Enigma.new
    expect(enigma.encrypt("HELLO world", "02715", "040895")).to eq( {
                                                                      encryption: "keder ohulw",
                                                                      key: "02715",
                                                                      date: "040895"
                                                                      })
  end
end
