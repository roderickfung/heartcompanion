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

  before_validation :set_approved_defaults
  before_create { generate_token(:auth_token) }

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.hex(64)
    end while Patient.exists?(column => self[column])
  end

  protected

  def set_approved_defaults
    self.approved ||= false
  end
end
