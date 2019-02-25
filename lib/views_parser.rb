# class responsible for parsing the data from the log file
class ViewsParser
  attr_reader :parsed_data

  def initialize
    @parsed_data = []
  end

  def parse_data(log_file)
    file = File.open(log_file, 'r')
    file.each_line { |line| @parsed_data.push([line.split[0], line.split[1]]) }
  end
end
