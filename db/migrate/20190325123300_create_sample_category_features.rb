class CreateSampleCategoryFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :sample_category_features do |t|
      t.float :minimun_value, default:  0.00
      t.float :maximum_value, default:  0.00
      t.string :description
      t.belongs_to :sample_category_method
      t.timestamps
    end
  end
end
