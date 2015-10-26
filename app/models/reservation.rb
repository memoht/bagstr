class Reservation < ActiveRecord::Base
  include PgSearch

  scope :closed, -> { where('status = ?', 'closed') }
  scope :open, -> { where('status = ?', 'open') }

  #Constants
  RESERVE_STATUS =  %w(flagged open closed)

  # Associations
  belongs_to :locker

  # Validations
  validates :guest_name, :size_code, presence: true

  validates :guest_name,
    presence: true,
    length: { maximum: 60 }

  # http://api.rubyonrails.org/classes/Module.html#method-i-delegate
  delegate :locker_no, to: :locker

  # Callbacks
  before_validation :generate_confirmation_no, on: :create

  before_save :assign_locker, :set_reservation_status, if: :new_record?
  after_save :release_locker, if: :closed?

  # Methods
  #http://railscasts.com/episodes/343-full-text-search-in-postgresql
  pg_search_scope :search,
    against: [
      [:confirmation_no, 'A'],
      [:guest_name, 'B']
    ],
    using: { tsearch: { dictionary: 'simple', prefix: true } }

  def self.text_search(query)
    if query.present?
       search(query)
    else
      all
    end
  end

  def closed?
    status == 'closed'
  end

  def assign_locker
    @open_lockers = Locker.available.where("size_code >= ?", self.size_code).min
    if @open_lockers.nil?
      errors[:base] << "There are no open lockers to fit your bag"
      return false
    else
      self.locker_id = @open_lockers.id
      self.locker.reserved = 'true'
      self.locker.save
    end
  end

  def generate_confirmation_no
    self.confirmation_no = SecureRandom.uuid
  end

  def set_reservation_status
    self.status = 'open'
  end

  def release_locker
    self.locker.reserved = 'false'
    self.locker.save
  end
end
