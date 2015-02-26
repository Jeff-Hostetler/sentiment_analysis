class Parser

  require 'csv'

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def to_array
    result = []
    CSV.foreach(@file) do |row|
      result << {row[0] =>row[1]}
    end
    result
  end

end
