class AddProfileToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :ruc, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :contact_person, :string
    add_column :users, :gender, :integer
    add_column :users, :category, :integer
    add_column :users, :active, :boolean, default: true
    add_reference :users, :laboratory, index: true
    add_reference :users, :role, index: true
    #add_attachment :users, :avatar
  end
end
