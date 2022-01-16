require_relative 'spec_helper'
require "./lib/enigma"
require "./lib/alphabet"

RSpec.describe "enigma" do

  it "exists" do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  it "has an alphabet" do
    enigma = Enigma.new
    expect(enigma.alphabet).to be_a Hash
    expect(enigma.alphabet.count).to eq 27
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
end
