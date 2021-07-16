class PathFinderJob < ApplicationJob
  queue_as :low

  def perform(*args)
    
    Path.all.each do |path|
      path.scan
    end
  end
end
