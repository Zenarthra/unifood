class AddAddressPostcodePhonenumber < ActiveRecord::Migration
  def change

  	add_column :users, :address, :string
  	add_column :users, :postcode, :string
  	add_column :users, :contact, :integer


  end
end
