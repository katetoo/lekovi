module ApplicationHelper
	
    def is_active?(link_path)
        current_page?(link_path) ? "active" : ""
    end
    
    def extlink(link)
        if link.include?("http://")
            puts link
        else
            link.insert(0, "http://")
            link
        end
    end
    
end
