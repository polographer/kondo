class SpiritJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later

    # Path.includes(:pictures).each do |path|
    #   path.pictures.each do |pic|
    #     if not pic.web.attached?
    #       ExposerJob.perform_later(pic)
    #     end
    #   end
    # end
    Picture.all.each do |pic|
      if not pic.web.attached?
        ExposerJob.perform_later(pic)
      end
    end

  end
end
