class RemoveColumn < ActiveRecord::Migration
  def change

  	remove_column :users, :contact

  end
end
