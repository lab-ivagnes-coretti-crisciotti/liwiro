json.extract! course, :id, :name, :likes, :created_at, :updated_at
json.url course_url(course, format: :json)
