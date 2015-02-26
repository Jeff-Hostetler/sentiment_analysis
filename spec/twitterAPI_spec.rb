require 'twitterAPI'

describe TwitterAPI do

  let(:api_data) do

  end

  describe "#new" do
    it "returns a Twitter object" do
      twitter = TwitterAPI.new
      expect(twitter.class).to eq(TwitterAPI)
    end
  end


end
