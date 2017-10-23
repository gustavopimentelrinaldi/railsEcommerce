class Ad < ApplicationRecord
  belongs_to :member
  belongs_to :category, counter_cache: true
  has_many :comments

  #validates
  validates :title, :description, :category, :price, :finish_date, presence: true

  has_attached_file :picture, styles: {large: "800x300#", medium: "320x150#", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  

  scope :descending_order, -> (page) { order(created_at: :desc ).page(page).per(6) }
  scope :by_category, ->(id, page) { where(category: id).page(page).per(6) }
  scope :search, -> (term, page) { where("lower(title) LIKE ?", "%#{term.downcase}%") }
  #gem money-rails
  monetize :price_cents
end