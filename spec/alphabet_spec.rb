require_relative 'spec_helper'
require './lib/alphabet'

RSpec.describe Alphabet do
  it "exists" do
    alphabet = Alphabet.new
    expect(alphabet).to be_a(Alphabet)
  end

  it "has attributes" do
    alphabet = Alphabet.new
    expect(alphabet.index).to be_a(Hash)
    expect(alphabet.index.length).to eq(27)
    expect(alphabet.alphabet_array).to be_a(Array)
  end
end
