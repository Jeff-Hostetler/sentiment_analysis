class Sentiment
  require 'optparse'
  require_relative 'twitterAPI'

  attr_reader :keyword, :sample_size, :verbose

  def initialize
  end

  def parser
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

    tweet_array = TwitterAPI.new.search(@keyword, @sample_size)

    puts "Keyword: #{@keyword}"
    puts "Verbosity: #{@verbose? 'on' : 'off'}"
    puts "Sample size: #{@sample_size}"

    if @verbose == true
      tweet_array.each do |tweet|
        puts "Tweet: #{tweet}"
        puts "Negative/Positive"
        puts "-------------"
      end
    end

    puts "\nAnalyzed: 0 Tweets"
    puts "Positive: 0"
    puts "Negative: 0"
    puts "Neutral: 0"
  end

end
