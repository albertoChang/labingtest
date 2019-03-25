class SampleCategory < ApplicationRecord

  has_many :sample_category_methods
  has_many :sample_methods, through: :sample_category_methods
  belongs_to :laboratory

  accepts_nested_attributes_for :sample_methods, allow_destroy: true, reject_if: :all_blank

  accepts_nested_attributes_for :sample_category_methods, allow_destroy: true, reject_if: :all_blank

  def self.initialize params, current_user
    sample_category = SampleCategory.new params
    sample_category.laboratory = current_user.laboratory
    sample_category
  end

  def self.per_lab current_user
    if current_user.laboratory.nil?
      SampleCategory.all
    else
      where(laboratory_id: current_user.laboratory)
    end
  end
end
