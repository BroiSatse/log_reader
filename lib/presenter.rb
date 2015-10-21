module Presenter
end

Dir.glob( File.expand_path '../presenter/*.rb', __FILE__).each do |file|
  require file
end