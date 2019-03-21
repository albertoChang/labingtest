class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.boolean :active, default: true
      t.belongs_to :laboratory
      t.timestamps
    end
  end
end
