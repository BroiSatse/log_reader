class Record < Struct.new(:path, :address)
  class << self
    def parse(input)
      new *input.split(' ', 2)
    end
  end
end