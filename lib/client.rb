class Client
  attr_reader :statistics

  def initialize
    @statistics = []
  end

  def add_statistic(klass)
    @statistics << klass.new
  end

  def read_line(line)
    record = Record.parse(line)
    statistics.each {|s| s.process record }
  end

  def read!(stream)
    while line = stream.gets
      read_line line.strip
    end
  end
end