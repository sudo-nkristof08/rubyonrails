json.extract! car, :id, :brand, :model, :BHP, :mileage, :starting_price, :image, :user_id, :created_at, :updated_at
json.url car_url(car, format: :json)
