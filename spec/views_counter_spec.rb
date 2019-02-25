require 'views_counter'

describe ViewsCounter do
  subject(:counter) { described_class.new }

  describe '#counts_total_views' do
    it 'returns the pages and the total views count as key/value pair' do
      expect(counter.count_total_views('webserver.log')).to eq (
                                                     {  '/help_page/1' => 80,
                                                        '/contact' => 89,
                                                        '/home' => 78,
                                                        '/about/2' => 90,
                                                        '/index' => 82,
                                                        '/about' => 81 })
    end
    it 'doesn\'t add any view to the total count if already counted' do
      counter.count_total_views('webserver.log')
      expect(counter.count_total_views('webserver.log')).to eq (
                                                     {  '/help_page/1' => 80,
                                                        '/contact' => 89,
                                                        '/home' => 78,
                                                        '/about/2' => 90,
                                                        '/index' => 82,
                                                        '/about' => 81 })
    end
  end

  describe '#counts_unique_views' do
    it 'returns the pages and the unique views count as key/value pair' do
      expect(counter.count_unique_views('webserver.log')).to eq (
                                                      {  '/help_page/1' => 23,
                                                         '/contact' => 23,
                                                         '/home' => 23,
                                                         '/about/2' => 22,
                                                         '/index' => 23,
                                                         '/about' => 21 })
    end
    it 'doesn\'t add any view to the unique count if already counted' do
      counter.count_unique_views('webserver.log')
      expect(counter.count_unique_views('webserver.log')).to eq (
                                                      { '/help_page/1' => 23,
                                                        '/contact' => 23,
                                                        '/home' => 23,
                                                        '/about/2' => 22,
                                                        '/index' => 23,
                                                        '/about' => 21 })
    end
  end

  describe '#show_total_views' do
    it 'prints the total views in the console' do
      expect(counter.show_total_views('webserver.log')).to eq '/about/2 has 90 total views - /contact has 89 total views - /index has 82 total views - /about has 81 total views - /help_page/1 has 80 total views - /home has 78 total views - '
    end
  end

  describe '#show_unique_views' do
    it 'prints the unique views in the console' do
      expect(counter.show_unique_views('webserver.log')).to eq '/help_page/1 has 23 unique views - /contact has 23 unique views - /home has 23 unique views - /index has 23 unique views - /about/2 has 22 unique views - /about has 21 unique views - '
    end
  end
end
