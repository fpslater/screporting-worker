class Driver
    
  # Logger Info:
  # logger.debug "Person attributes hash: #{@person.attributes.inspect}"
  # logger.info "Processing the request..."
  # logger.fatal "Terminating application, raised unrecoverable error!!!"
  #include JavaDependencies
  
  def self.send_message_to_que
    client = OnStomp.connect('stomp://localhost:61613')
    client.send('/queue/cc.sc.reporting.in.q', '{"siteOwnerId":"1100356293960","eventType":"SCHEDULE","currentPublishedSocialCampaigns":0,"currentFbPagesConnected":1,"pageIds":[245357492194581]}')
    client.disconnect
  end
  
  def self.send_messages_to_que
    client = OnStomp.connect('stomp://localhost:61613')
    (1..500).each do |i|
      client.send('/queue/cc.sc.reporting.in.q', '{"siteOwnerId":"1100356293960","eventType":"SCHEDULE","currentPublishedSocialCampaigns":0,"currentFbPagesConnected":1,"pageIds":[245357492194581]}')
    end  
    client.disconnect
  end
  
  def self.execute 
      @@thread_flag = 1  
      threads = [] 
      (1..10).each do |i|
        count = 0
        threads << Thread.new(i) do |i|
          begin  
            client = OnStomp::Client.new('stomp://localhost:61613')
            client.connect
            client.subscribe('/queue/cc.sc.reporting.in.q', :ack => 'client') do |m|
              client.ack m
              puts "Thread_ID: #{i.id}"     
              begin
                job = Job.new(m.body)
                job.execute
                puts "JOB: #{job.get_report}"
              rescue 
                puts "Job Exectution failed"
              end
            end
          rescue
            puts "\nUnable to subscribe to que, thread: #{i.id} crashed. "
          end
          count += 1
          while true
          end
        end
      end
      threads.each { |t| t.join }
  end  
    
end