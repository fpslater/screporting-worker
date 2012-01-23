class MainController < ApplicationController
  
  def start
    Thread.new do 
      Driver.execute
    end
  end

  def stop
    Driver.abort 
  end

end
