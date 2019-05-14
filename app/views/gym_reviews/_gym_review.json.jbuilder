json.extract! gym_review, :id, :text, :athlete_id, :gym_id, :created_at, :updated_at
json.url gym_review_url(gym_review, format: :json)
