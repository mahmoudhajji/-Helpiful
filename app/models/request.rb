class Request < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  has_one_attached :photo
  CATEGORIES = ["Furniture", "Gardening", "Trash", "PET bottles",
                "Glass bottles", "Packages", "Moving", "Wood", "Metal"]
  CITIES = ["Munich", "Stockholm", "Berlin", "Athena",
            "Bukarest", "Falun", "Sibiu", "Korfu", "Hamburg"]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :city ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_category,
    against: [ :category ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_keyword,
    against: [ :category, :city, :description, :title ],
    using: {
      tsearch: { prefix: true }
    }
end
