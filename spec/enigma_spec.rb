require_relative 'spec_helper'
require "./lib/enigma"
require "./lib/alphabet"

RSpec.describe "enigma" do

  it "exists" do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  it "has an alphabet in a hash and an array" do
    enigma = Enigma.new
    expect(enigma.alphabet_hash).to be_a Hash
    expect(enigma.alphabet_hash.count).to eq 27
    expect(enigma.alphabet_array).to be_a Array
    expect(enigma.alphabet_array.count).to eq 27
  end

  it "can generate keys" do
    enigma = Enigma.new
    expect(enigma.generate_keys).to be_a String
    expect(enigma.generate_keys.length).to eq(5)
  end

  it "can generate the date" do
    enigma = Enigma.new
    expect(enigma.generate_date).to be_a String
    expect(enigma.generate_date.length).to eq(6)
  end

  it "can shift" do
    enigma = Enigma.new
    expect(enigma.shift("02715", "1025")).to eq([3, 27, 73, 20])
  end

  it "can turn the message into an array of indexes in the alphabet" do
    enigma = Enigma.new
    expect(enigma.number_generator("hello world")).to be_a Array
    expect(enigma.number_generator("hello world")).to eq([7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3])
  end

  xit "can encrypt" do
    enigma = Enigma.new
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq( {
                                                                      encryption: "keder ohulw",
                                                                      key: "02715",
                                                                      date: "040895"
                                                                      })
  end

end
