require_relative 'views_parser.rb'
require_relative 'views_formatter.rb'

# class responsible for counting the views per page
class ViewsCounter
  attr_reader :total_views, :unique_views

  def initialize(parser = ViewsParser.new, formatter = ViewsFormatter.new)
    @total_views = Hash.new(0)
    @unique_views = Hash.new(0)
    @parser = parser
    @formatter = formatter
  end

  def parse_data(log_file)
    @parser.parse_data(log_file)
  end

  def extract_total_pages(log_file)
    parse_data(log_file)
    @counts = []
    @parser.parsed_data.each { |elem| @counts.push(elem[0]) }
  end

  def extract_unique_pages(log_file)
    parse_data(log_file)
    @counts = []
    @parser.parsed_data.uniq.each { |elem| @counts.push(elem[0]) }
  end

  def count_total_views(log_file)
    extract_total_pages(log_file)
    @total_views.empty? ? update_total_count : @total_views
  end

  def count_unique_views(log_file)
    extract_unique_pages(log_file)
    @unique_views.empty? ? update_unique_count : @unique_views
  end

  def update_total_count
    @counts.each { |page| @total_views[page] += 1 }
    @total_views
  end

  def update_unique_count
    @counts.each { |page| @unique_views[page] += 1 }
    @unique_views
  end

  def show_total_views(log_file)
    count_total_views(log_file)
    @formatter.show_total_views(@total_views)
  end

  def show_unique_views(log_file)
    count_unique_views(log_file)
    @formatter.show_unique_views(@unique_views)
  end
end
