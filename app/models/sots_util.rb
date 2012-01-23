class SotsUtil 

  #Returns the access token for the user
  def self.get_user_access_token(user_id)
      #include JavaDependencies
      access_token = nil
      begin
        scr_util = Java::Foo.SCReportingUtil.new
        access_token = scr_util.findAccessTokenForSiteOwner(user_id.to_i)
      rescue
        raise "Call to Sots failed!"
      end
      access_token 
  end
  
end