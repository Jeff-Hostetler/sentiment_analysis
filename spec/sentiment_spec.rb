require 'sentiment'

describe Sentiment do

  describe "#new" do
    it "creates a Sentiment object" do
      sentiment = Sentiment.new
      expect(sentiment.class).to eq(Sentiment)
    end
  end

end
