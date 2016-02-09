

class LinkList

  def initialize
    @active = false
    @mega_list = []
  end

  def get_info
    @list = Link.all
    @list.each do |link|
      mini_list = []
      mini_list.push(link.title)
      mini_list.push(link.url)
      @mega_list.push(mini_list)
    end
  end

  # def get_title
  #   @title = Link.last.title if @active
  # end
  #
  # def get_url
  #   @url = Link.last.url if @active
  # end

  def display_links
    display_list = @mega_list.map{|x|"#{x[0]} #{x[1]}"}
    display_list.join("\n")
  end

  def activation
    @active = true
  end

end
