module Statistic
  class VisitsPerPath < Base

    description 'list of webpages with most page views'
    unit 'visits'

    def initialize
      @data = Hash.new {|h, k| h[k] = 0 }
    end

    def process(record)
      @data[record.path] += 1
    end

    def result
      result = @data.sort_by {|_, value| -value }.to_h
      result.default = 0
      result
    end
  end
end