# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create! email_address: "dev@launchpad.com", password: "dev"

20.times do
  Offer.create!(
    company_name: Faker::Company.name,
    title: Faker::Job.title,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    city: Faker::Address.city,
    country: Faker::Address.country,
    apply_link: Faker::Internet.url,
    contract_type: Offer.contract_types.keys.sample,
    job_type: Offer.job_types.keys.sample,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    user: User.first
  )
end
