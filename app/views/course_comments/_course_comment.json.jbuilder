json.extract! course_comment, :id, :text, :athlete_id, :course_id, :created_at, :updated_at
json.url course_comment_url(course_comment, format: :json)
