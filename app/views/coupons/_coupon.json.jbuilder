json.extract! coupon, :id, :code, :description, :gym_id, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
