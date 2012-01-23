class PSUtil

  def self.update_user(user_id, likes_count, total_pages, total_campaigns)
    scr_util = Java::Foo.SCReportingUtil.new
    response = scr_util.updateUser(user_id.to_i, likes_count, total_pages, total_campaigns)
    response
  end
  
end