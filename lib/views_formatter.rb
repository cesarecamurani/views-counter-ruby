# class responsible for printing out the results in the desired format
class ViewsFormatter
  def show_total_views(total_views)
    @total_format = ''
    total_views.sort { |a, b| b[1] <=> a[1] }.each do |page, count|
      @total_format += "#{page} has #{count} total views - "
    end
    @total_format
  end

  def show_unique_views(unique_views)
    @unique_format = ''
    unique_views.sort { |a, b| b[1] <=> a[1] }.each do |page, count|
      @unique_format += "#{page} has #{count} unique views - "
    end
    @unique_format
  end
end
