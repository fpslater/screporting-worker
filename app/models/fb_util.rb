class FBUtil
  
  def self.get_user_likes_total(access_token, page_ids) 
    graph = Koala::Facebook::API.new(access_token)
    likes_count = 0
    page_ids.each do |page_id| 
      likes_count += get_page_likes(page_id, graph) 
    end
    likes_count
  end
  
  private
  
  def self.get_page_likes(page_id, graph)
    begin
      likes_count = graph.get_object(page_id.to_i)['likes']  
    rescue
      puts "Request failed"
    end
    likes_count
  end
    
end 