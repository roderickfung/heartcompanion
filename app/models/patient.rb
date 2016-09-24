class Patient < ApplicationRecord
  has_secure_password
  belongs_to :clinician

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :care_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: VALID_EMAIL_REGEX
  validates :age, presence: true
  validates :sex, presence: true
  validates :phone, presence: true
  validates :address, presence: true

  before_validation :set_defaults

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end

  protected

  def set_defaults
    self.approved ||= false
  end
end
