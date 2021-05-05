class Picture < ApplicationRecord
  require "image_processing/vips"

  belongs_to :path
  #has_one_attached :web
  has_one_attached :web do |attachable|
    attachable.variant :thumb_200, resize: "200x200"
    attachable.variant :thumb_400, resize: "400x400"
    attachable.variant :thumb_800, resize: "800x800"
  end

  def thumbnalize
    if not self.full_path.blank?
      pipeline = ImageProcessing::Vips
        .source(self.full_path)
        .resize_to_limit(1080, 1350)
        .convert("jpg")
        .saver(quality: 85)

      self.web.attach( io: File.open(pipeline.call),filename: "picture_#{self.id}_web.jpg" )
    end
    
  end
end
