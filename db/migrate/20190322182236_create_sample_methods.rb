class CreateSampleMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :sample_methods do |t|
      t.float :unit_cost
      t.string :name
      t.string :description
      t.boolean :active, default: true
      t.integer :accreditation, default: true
      t.belongs_to :laboratory
      t.timestamps
    end
  end
end
