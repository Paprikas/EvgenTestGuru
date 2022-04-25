module ApplicationHelper
    
    def current_year
      Date.today.year
    end
    
    def github_url(author, repo)
      link_to 'Test Guru', 'https://github.com/#{author}/#{repo}'
    end 
    
    def flash_messages
      flash.map do |key, msg|
        content_tag :p, msg, id: key, class: 'flash #{key}' if flash[key]
        if key == 'success' 
          content_tag :div, msg, class: 'alert alert-success', role: 'alert'
        elsif key == 'alert'
          content_tag :div, msg, class: 'alert alert-danger', role: 'alert'
        elsif key == 'error'
          content_tag :div, msg, class: 'alert alert-danger', role: 'alert'  
        end         
      end.join.html_safe 
    end

    
end
