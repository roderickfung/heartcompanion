class Clinician < ApplicationRecord
  has_secure_password
  has_many :patients, dependent: :nullify

  before_validation :set_admin_defaults
  before_validation :set_approved_defaults

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: VALID_EMAIL_REGEX
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :postal_code, presence: true, uniqueness: {scope: :address}
  validates :password, length: { minimum: 6 }, on: :create
  validates :password_digest, presence: { message: "Password can't be blank" }

  mount_uploader :profile_image, ProfileImageUploader

  before_create { generate_token(:auth_token) }

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.hex(64)
    end while Clinician.exists?(column => self[column])
  end

  private

  def set_admin_defaults
    self.role ||= 'clinician'
  end

  def set_approved_defaults
    self.approved ||= false
  end
end
