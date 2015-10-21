module Statistic
  class Base
    class << self
      def description(value = nil)
        value ? @description = value : @description
      end

      def unit(value = nil)
        value ? @unit = value : @unit
      end
    end
  end
end


Dir.glob( File.expand_path '../statistic/*.rb', __FILE__).each do |file|
  require file
end