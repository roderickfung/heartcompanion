class PatientLog < ApplicationRecord
  belongs_to :patient

  validates :bp_hi, presence: true
  validates :bp_low, presence: true
  validates :weight_num, presence: true
  validates :weight_type, presence: true
  validates :exerting_breath, presence: true
  valdiates :night_breath, presence: true
  validates :leg_swollen, presence: true
  validates :lightheadedness, presence: true

  after_initialization :set_weight_type_default

  protected

  def set_weight_type_default
    self.weight_type = 'lbs'
  end


end
