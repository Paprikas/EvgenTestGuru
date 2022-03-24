module ApplicationHelper
    def current_year
      Date.today.year
    end
    
    def github_url(author, repo)
      link_to 'Test Guru', 'https://github.com/#{author}/#{repo}'
    end 
    
    def flash_messages
      if flash.any?
        flash.each do |type, msg|
          concat(content_tag :p, msg, id: type, class: 'flash')
        end
      end
    end      
end
