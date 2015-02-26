class Sentiment
  require 'optparse'
  require_relative 'twitterAPI'
  require_relative 'parser'

  attr_reader :keyword, :sample_size, :verbose, :sentiment_array,

  def initialize
  end

  def run_sentiment
    dictionary_array = Parser.new('dictionary.csv').to_array

    tweet_array = TwitterAPI.new.search(@keyword, @sample_size)

    positive_tweets = 0
    negative_tweets = 0
    neutral_tweets = 0
    sentiment_array = []

    tweet_array.each do |tweet|
      tweet.split.each do |word|
        positive_words = 0
        negative_words = 0
        dictionary_array.each do |hash|
          if hash["#{word}".downcase] !=nil
            if hash["#{word}".downcase] == "positive"
              positive_words += 1
            else
              negative_words += 1
            end
          end
        end
        if positive_words > negative_words
          positive_tweets += 1
          sentiment_array << "positive"
        elsif positive_words < negative_words
          negative_tweets += 1
          sentiment_array << "negative"
        elsif positive_words != negative_words && 0
          neutral_tweets +=1
          sentiment_array << "neutral"
        end
      end
    end
    @positive_tweets = positive_tweets
    @negative_tweets = negative_tweets
    @neutral_tweets = neutral_tweets
    @sentiment_array = sentiment_array
    @tweet_array = tweet_array
  end

  def print
    OptionParser.new do |opts|
      opts.banner = "Usage: ruby sentiment.rb [options]"

      opts.on("-k", "--keyword KEYWORD", "Keyword for Twitter search") do |keyword|
        @keyword = keyword
      end

      opts.on("-s", "--sample-size SIZE", "The number of tweets to sample") do |size|
        @sample_size= size.to_i
      end

      opts.on("-v", "--verbose", "Run verbosely") do |verbose|
        @verbose = verbose
      end
    end.parse!
    self.run_sentiment
    puts "Keyword: #{@keyword}"
    puts "Verbosity: #{@verbose? 'on' : 'off'}"
    puts "Sample size: #{@sample_size}"

    if @verbose == true
      i = 0
      @tweet_array.each do |tweet|
        puts "\nTweet: #{tweet}"
        puts sentiment_array[i]
        puts "-------------"
        i+=1
      end
    end

    puts "\nAnalyzed: #{@positive_tweets + @negative_tweets + @neutral_tweets} Tweets"
    puts "Positive: #{@positive_tweets}"
    puts "Negative: #{@negative_tweets}"
    puts "Neutral: #{@neutral_tweets}"
  end

end
