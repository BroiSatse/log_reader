module Statistic
  class UniqueVisitsPerPath < Base

    description 'list of webpages with most unique page views'
    unit 'unique visits'

    def initialize
      @data = Hash.new {|h, k| h[k] = [] }
    end

    def process(record)
      return if @data[record.path].include? record.address
      @data[record.path] << record.address
    end

    def result
      result = @data.map {|path, addresses| [path, addresses.count]}.sort_by {|_, count| -count }.to_h
      result.default = 0
      result
    end
  end
end