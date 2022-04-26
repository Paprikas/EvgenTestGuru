module ApplicationHelper

  FLASH_BOOTSTRAP = { success: 'alert alert-success', alert: 'alert alert-danger', error: 'alert alert-danger' }
     
    def current_year
      Date.today.year
    end
    
    def github_url(author, repo)
      link_to 'Test Guru', 'https://github.com/#{author}/#{repo}'
    end 
    
    def flash_messages
      flash.map do |key, msg|
        alert_type = FLASH_BOOTSTRAP[key.to_sym]
        content_tag :div, msg, class: alert_type, role: 'alert'
      end.join.html_safe 
    end
   
end
