class AddCityToAthletes < ActiveRecord::Migration
  def change
  	add_column :athletes, :city, :string
  end
end
