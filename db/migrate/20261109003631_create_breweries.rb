class CreateBreweries < ActiveRecord::Migration[7.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :brewery_type
      t.string :city
      t.string :address
      t.string :phone
      t.string :website_url
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
