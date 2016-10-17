class Patient < ApplicationRecord
  has_secure_password
  belongs_to :clinician
  has_many :patient_logs

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :care_id, presence: true, numericality: {greater_than: 9845000000, less_than: 9999999999}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: VALID_EMAIL_REGEX
  validates :age, presence: true
  validates :sex, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :postal_code, presence: true, uniqueness: {scope: :address}

  mount_uploader :profile_image, ProfileImageUploader

  before_validation :set_approved_defaults
  before_validation :set_parameters_defaults

  geocoded_by :address
  after_validation :geocode

  before_create { generate_token(:auth_token) }

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.hex(64)
    end while Patient.exists?(column => self[column])
  end

  def in_range?
    previous_log.bp_hi.to_i > bphigh || previous_log.bp_low.to_i < bplow ||
    previous_log.heartrate > hrhigh ||
    previous_log.heartrate < hrlow ||
    previous_log.weight_num > lbhigh ||
    previous_log.weight_num < lblow
  end

  protected

  def set_approved_defaults
    self.approved ||= false
  end

  def set_parameters_defaults
    self.lbhigh ||= 185
    self.lblow ||= 110
    self.hrhigh ||= 85
    self.hrlow ||= 53
    self.bplow ||= 90
    self.bphigh ||= 110
  end

  def previous_log
    patient_logs.last
  end
end
