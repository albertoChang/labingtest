class SampleCategoryMethod < ApplicationRecord

  belongs_to :sample_category
  belongs_to :sample_method

  has_many :sample_category_features

  accepts_nested_attributes_for :sample_category_features, allow_destroy: true, reject_if: :all_blank
end
