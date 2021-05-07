class ExposerJob < ApplicationJob
  queue_as :default

  # def perform(*args)
  #   # Do something later
    
  # end

  def perform(pic)
    # Do something later
    pic.thumbnalize
    
  end
end
