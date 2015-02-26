require 'parser'

describe Parser do

  describe "new" do
    it "returns a Parser object" do
      parser = Parser.new('file')
      expect(parser.class).to eq(Parser)
    end
  end

  describe "to_hash" do
    it "returns an array of hash values with keyword as key, sentiment as value " do
      expect(Parser.new('test.csv').to_array[0]).to eq({ "beer" => "positive"})
    end

    it "returns an exception when a file ins't found" do
      expect{Parser.new('fake.csv').to_array}.to raise_error
    end
  end

end
