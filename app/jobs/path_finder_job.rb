class PathFinderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    
    Path.all.each do |path|
      path.scan
      # extensions.each do | ext |
      #   Dir["#{folder.location}/**/*."+ext].each do |file|
      #     puts file
      #     x = Picture.find_or_create_by(full_path: file)

      #   end

      # end
    end
  end
end
