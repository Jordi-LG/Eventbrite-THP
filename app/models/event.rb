class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: 'User'
  has_one_attached :avatar


  validates :start_date,
    presence: true
  validate :time_in_futur

  validates :duration,
    presence: true,
    numericality: { only_integer: true, greater_than: 0 }
    validate :multiple_of_5

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description,
    presence: true,
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}

  validates :avatar, attached: true

    def time_in_futur
      if start_date != nil
      if Time.now > start_date
        errors.add(:start_date, "date de départ peut pas être passée !")
      end
    end
    end

    def multiple_of_5
      if duration != nil
      if duration % 5 != 0
        errors.add(:duration, "durée doit être multiple de 5")
      end
    end
    end
end
