json.extract! person, :id, :name, :face_path, :created_at, :updated_at
json.url person_url(person, format: :json)
