require 'views_counter'

describe 'feature test show total views' do
  it 'prints the total views in the console' do
    counter = ViewsCounter.new
    counter.show_total_views('./webserver.log')
    expect(counter.show_total_views('./webserver.log')).to eq '/about/2 has 90 total views - /contact has 89 total views - /index has 82 total views - /about has 81 total views - /help_page/1 has 80 total views - /home has 78 total views - '
  end
end

describe 'feature test show unique views' do
  it 'prints the unique views in the console' do
    counter = ViewsCounter.new
    counter.show_unique_views('./webserver.log')
    expect(counter.show_unique_views('./webserver.log')).to eq '/help_page/1 has 23 unique views - /contact has 23 unique views - /home has 23 unique views - /index has 23 unique views - /about/2 has 22 unique views - /about has 21 unique views - '
  end
end
