class PatientLog < ApplicationRecord
  belongs_to :patient

  validates :bp_hi, presence: true
  validates :bp_low, presence: true
  validates :weight_num, presence: true
  validates :weight_type, presence: true
  validates :exerting_breath, presence: true
  validates :night_breath, presence: true
  validates :leg_swollen, presence: true
  validates :lightheadedness, presence: true

  after_initialize :set_weight_type_default

  protected

  def set_weight_type_default
    self.weight_type = 'lbs'
  end

  def set_date_default
    self.date = Date.today.strftime("%d/%m/%Y")
  end

end
