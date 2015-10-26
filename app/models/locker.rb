class Locker < ActiveRecord::Base
  # Scopes
  scope :small, -> { where(size_code: 1) }
  scope :medium, -> { where(size_code: 2) }
  scope :large, -> { where(size_code: 3) }
  scope :available, -> { where(reserved: false) }
  scope :unavailable, -> { where(reserved: true) }

  # Associations
  has_many :reservations, dependent: :destroy

  # Validations
  validates :size_code,
    presence: true,
    numericality: { only_integer: true }


  validates :locker_no,
    presence: true,
    uniqueness: true,
    length: { maximum: 8 }
end
