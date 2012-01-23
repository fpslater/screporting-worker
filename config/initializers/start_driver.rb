
 begin
   # Checks for existence of /opt/cc/etc/screporting/screporting_settings.yml
   YAML.load_file(File.join(File::SEPARATOR,"opt","cc","etc","screporting","screporting_settings.yml"))[Rails.env]
   
   puts "Starting App!"
   Driver.execute
 rescue Exception =>e
   puts "Unable to find screporting_settings.yml. Assuming this is the build running..."
   puts e.inspect
   puts e.backtrace
 end







