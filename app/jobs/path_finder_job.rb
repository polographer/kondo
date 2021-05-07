class PathFinderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    
    Path.all.each do |path|
      path.scan
    end
  end
end
