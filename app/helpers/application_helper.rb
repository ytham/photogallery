module ApplicationHelper

  def full_title(page_title)
    main_title = "'steem"
    if page_title.empty?
      main_title
    else
      "#{page_title} | #{main_title}"
    end
  end

  def next
    Photo.first(conditions: ["id > ?", id], order: "id asc")
  end

  def previous
    Photo.first(conditions: ["id < ?", id], order: "id desc")
  end

end
