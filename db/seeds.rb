# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

Brewery.destroy_all
State.destroy_all

states = [ "California", "New York", "Texas", "Ohio", "Colorado" ]

states.each do |state_name|
  state = State.create!(name: state_name)

  # Fetch data from API for this state
  url = "https://api.openbrewerydb.org/v1/breweries?by_state=#{state_name.downcase.gsub(' ', '_')}&per_page=50"
  uri = URI.open(url)
  breweries_data = JSON.parse(uri.read)

  breweries_data.each do |b|
    state.breweries.create!(
      name: b["name"],
      brewery_type: b["brewery_type"],
      city: b["city"],
      address: b["address_1"],
      phone: b["phone"],
      website_url: b["website_url"]
    )
  end
end

puts "Seed finished! Created #{State.count} states and #{Brewery.count} breweries."
