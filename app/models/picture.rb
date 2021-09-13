class Picture < ApplicationRecord
#  require "image_processing/vips"
  require "image_processing/mini_magick"


  belongs_to :path
  has_one_attached :web
  has_many :albums, through: :pages
  has_many :people, through: :appareances


  # has_one_attached :web do |attachable|
  #   attachable.variant :thumb, resize: "100x100"
  #   attachable.variant :thumb_200, resize: "200x200"
  #   attachable.variant :thumb_400, resize: "400x400"
  #   attachable.variant :thumb_800, resize: "800x800"
  # end

  def is_raw_image?
    ["DNG","CR2","ORF"].include? self.extension.upcase
  end
                   
  def thumbnalize
    if self.full_path.present?
      self.web.attached? || self.web.purge

      pipeline = ImageProcessing::MiniMagick
        .source(self.full_path)
        .resize_to_limit(2048, 1536, sharpen: false)
        #.colourspace(:srgb)
        .convert("jpg")
        .saver(quality: 95, strip: true)
      
      self.web.attach( io: File.open(pipeline.call),filename: "picture_#{self.id}_web.jpg" )
    end
  end

  def load_exif
    pic.exif = JSON.parse(`exiftool -json #{pic.full_path}`)[0]
    pic.save!
  end
end
