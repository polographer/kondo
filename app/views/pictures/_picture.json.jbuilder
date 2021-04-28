json.extract! picture, :id, :filename, :full_path, :path_id, :will_organize, :will_research, :extension, :raw, :filesystem_date, :picture_date, :size, :thumb200, :thumb400, :thumb800, :exif, :meta, :created_at, :updated_at
json.url picture_url(picture, format: :json)
