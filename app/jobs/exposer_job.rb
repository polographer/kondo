class ExposerJob < ApplicationJob
  queue_as :high

  def perform(pic)
    # Do something later
    pic.thumbnalize
    #@todo this can break, I wonder if we should move it out, but thumbnalize can break too...
    pic.load_exif
  end
end
