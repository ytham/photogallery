module ApplicationHelper

  def full_title(page_title)
    main_title = "Photo Gallery"
    if page_title.empty?
      main_title
    else
      "#{page_title} | #{main_title}"
    end
  end

end
