module ApplicationHelper
    
    def current_year
      Date.today.year
    end
    
    def github_url(author, repo)
      link_to 'Test Guru', 'https://github.com/#{author}/#{repo}'
    end 
    
    def flash_messages
      content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
    end
end
