class Presenter::Console
  PADDING = 3
  def display_single(statistic)
    puts statistic.class.description
    keys_size = statistic.result.map {|key, _| key.to_s.length}.max

    statistic.result.each do |key, value|
      print ' ' * PADDING
      print key.to_s.ljust(keys_size)
      print ' ' * PADDING
      print "#{value} #{statistic.class.unit}\n"
    end

    puts
  end

  def display(statistics)
    statistics.each {|stat| display_single(stat) }
  end
end