require './app/models/link_list.rb'

describe LinkList do
  subject(:link_list) {described_class.new}


  # context '#links' do
  #   it 'displays the links and titles from the table' do
  #     allow(link_list).to receive(:get_title).and_return("Facebook")
  #     allow(link_list).to receive(:get_url).and_return("www.facebook.com")
  #     link_list.get_url
  #     link_list.get_title
  #     expect(link_list.display_links).to eq 'Facebook www.facebook.com'
  #   end
  # end

  context '#links' do
    it 'displays the links and titles from the table' do
      allow(link_list).to receive(:get_title).and_return("Facebook")
      allow(link_list).to receive(:get_url).and_return("www.facebook.com")
      link_list.get_url
      link_list.get_title
      expect(link_list.display_links).to be_instance_of String
    end
  end
end
