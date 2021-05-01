class Picture < ApplicationRecord
  belongs_to :path
  #has_one_attached :web
  has_one_attached :web do |attachable|
    attachable.variant :thumb_200, resize: "200x200"
    attachable.variant :thumb_400, resize: "400x400"
    attachable.variant :thumb_800, resize: "800x800"
  end

  # def thumbnalize
    
  # end
end
