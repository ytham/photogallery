module ApplicationHelper

  def full_title(page_title)
    main_title = "'steeme"
    if page_title.empty?
      main_title
    else
      "#{page_title} | #{main_title}"
    end
  end

end
