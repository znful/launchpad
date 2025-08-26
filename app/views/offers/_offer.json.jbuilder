json.extract! offer, :id, :company_name, :title, :description, :city, :country, :apply_link, :contract_type, :job_type, :latitude, :longitude, :user_id, :created_at, :updated_at
json.url offer_url(offer, format: :json)
