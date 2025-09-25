# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
User.find_or_create_by!(email_address: "dev@launchpad.com") do |user|
  user.password = "dev"
end


100.times do
  Offer.find_or_create_by!(
    title: Faker::Job.title,
    company_name: Faker::Company.name,
    address: [ Faker::Address.city, Faker::Address.country ].compact.join(", "),
    application_link: Faker::Internet.url,
    contract_type: Offer.contract_types.keys.sample,
    job_type: Offer.job_types.keys.sample,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    status: Offer.statuses.keys.sample,
    verification_status: Offer.verification_statuses.keys.sample,
    user: User.first
  )
end
