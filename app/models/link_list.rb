

class LinkList

  def get_title
    @title = Link.last.title
  end

  def get_url
    @url = Link.last.url
  end

  def display_links
    "#{@title} #{@url}"
  end


end
