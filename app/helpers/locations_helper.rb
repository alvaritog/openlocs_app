module LocationsHelper

  def opening_hours_for(location)
    content_tag :ul do
      @location.h_opening_rules.collect{|str| content_tag :li, str }.join.html_safe
    end
  end
  
end
