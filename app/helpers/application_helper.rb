module ApplicationHelper
  
  def gravatar(email, options={})
    src = h(gravatar_url(email, options))
    [:class, :alt, :size].each { |opt| options[opt] = h(options[opt]) }
    "<img class=\"#{options[:class]}\" alt=\"#{options[:alt]}\" width=\"#{options[:size]}\" height=\"#{options[:size]}\" src=\"#{src}\" />"      
  end

  def gravatar_api_url(hash)
    "http://www.gravatar.com/avatar/#{hash}"
  end

  def gravatar_url(email, options={})
    email_hash = Digest::MD5.hexdigest(email)
    options[:default] = CGI::escape(options[:default]) unless options[:default].nil?
    gravatar_api_url(email_hash).tap do |url|
      opts = []
      [:rating, :size, :default].each do |opt|
        unless options[opt].nil?
          value = h(options[opt])
          opts << [opt, value].join('=')
        end
      end
      url << "?#{opts.join('&')}" unless opts.empty?
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
  
  def pretty_date(date)
    return '' if date.nil?
    if date.to_time.utc > 2.day.ago
      "Publicat fa #{time_ago_in_words date}"
    else
      "Publicat el #{date.strftime('%d/%m/%Y')}"
    end
  end
  
  def section_link_to(name, options = {}, html_options = {})
    html_options.merge!({ :class => 'current' }) if current_page?(options)
    link_to name, options, html_options
  end
  
  def title(page_title)
    content_for :title do
      page_title
    end
  end
  
  # Converts a string to a format suitable for a URL without ever using escaped characters.
  def urlize(url)
    url.mb_chars.normalize(:kd).strip.gsub(/[^\x00-\x7F]/n,'').gsub!(/\ /,'-').downcase.to_s
  end
end
