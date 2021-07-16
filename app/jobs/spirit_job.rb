class SpiritJob < ApplicationJob
  queue_as :default
  # this generates thumbnails that are not generated for each picture
  
  def perform(*args)
    
    Picture.all.each do |pic|
      if not pic.web.attached? or pic.exif.blank?
        ExposerJob.perform_later(pic)
      end
    end

  end
end
