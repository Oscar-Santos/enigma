require_relative 'spec_helper'
require "./lib/enigma"
require "./lib/alphabet"

RSpec.describe "enigma" do

  it "exists" do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end
end
