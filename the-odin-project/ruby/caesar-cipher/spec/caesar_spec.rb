require './lib/caesar.rb'

describe Caesar do
  subject { Caesar.new }

  describe "#caesar_cipher" do
    it "returns a string" do
      expect(subject.caesar_cipher("What a string!", 5)).to be_a(String)
    end

    it "returns the correct string" do
      expect(subject.caesar_cipher("What a string!", 5)).to eql "Bmfy f xywnsl!"
      expect(subject.caesar_cipher("What a string!", 27)).to eql "Xibu b tusjoh!"
      expect(subject.caesar_cipher("What a string!", 26)).to eql "What a string!"
    end
  end
end