class CreateSampleCategoryMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :sample_category_methods do |t|
      t.belongs_to :sample_category
      t.belongs_to :sample_method
      t.timestamps
    end
  end
end
