class Job 
  
  def initialize(message)
    @message = message
    result = JSON.parse(message)
    @user_id = result['siteOwnerId']
    @event_type = result['eventType']
    @social_campaigns_total = result['currentPublishedSocialCampaigns']
    @fb_pages_total = result['currentPublishedSocialCampaigns']
    @page_ids = result['pageIds']
    @report = ""
  end
  
  def execute     
    begin
      access_token = SotsUtil.get_user_access_token(@user_id)
      @report << "\naccess_token set: #{access_token}" if access_token
    rescue
      @report << "\nSOTS FAILED!!!!!!!!!!!!!!!"
    end
    
    begin
      likes_count = FBUtil.get_user_likes_total(access_token, @page_ids) 
      @report << "\nlikes_count set: #{likes_count}" if likes_count    
    rescue
      @report << "\nKOALA FAILED!!!!!!!!!!!!!!"
    end
    
    #Total number of user pages, and total number of user campaigns, total likes --> To Product Services
    begin
      response = PSUtil.update_user("1100343067549", likes_count, @fb_pages_total, @social_campaigns_total)
      @report << "\ntotal likes set to: #{likes_count}"
      @report << "\n***********USER UPDATED************"
    rescue
      @report << "\nPRODUCT SERVICES FAILED!!!"
    end
    
  end
  
  def get_user_id
     @user_id
  end 
  
  def to_string
    @message
  end
  
  def get_report
    @report ?  @report : "This Job has not been executed."
  end  
    
end