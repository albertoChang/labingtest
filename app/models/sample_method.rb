class SampleMethod < ApplicationRecord

  has_many :sample_category_methods
  has_many :sample_categories, through: :sample_category_methods
  belongs_to :laboratory

  enum accreditation: [:accredited, :non_accredited]

  def self.initialize params, current_user
    sample_method = SampleMethod.new params
    sample_method.laboratory = current_user.laboratory
    sample_method
  end

  def self.per_lab current_user
    if current_user.laboratory.nil?
      SampleMethod.all
    else
      where(laboratory_id: current_user.laboratory)
    end
  end
end
