module ApplicationHelper
  def section_link_to(name, options = {}, html_options = {})
    html_options.merge!({ :class => 'current' }) if current_page?(options)
    link_to name, options, html_options
  end

  def title(page_title)
    content_for :title do
      page_title
    end
  end

  def meta_keywords(words)
    content_for :meta_keywords do
      words
    end
  end

  def meta_description(desc)
    content_for :meta_description do
      desc
    end
  end
end
