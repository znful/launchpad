json.extract! offer, :id, :company_name, :title, :description, :address, :application_link, :contract_type, :job_type, :verification_status, :status, :created_at, :updated_at
json.url offer_url(offer, format: :json)
