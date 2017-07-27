class Picture < ApplicationRecord

  validates :artist, presence: true
  validates :title, length: { in: 3..20 }
  validates :url, presence: true, uniqueness: true

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.last_month
    Picture.where("created_at > ? AND created_at < ?", Date.today.last_month.beginning_of_month, Date.today.beginning_of_month)
  end


  def self.created_in_year(year)
    beginning_of_year = DateTime.new(year, 1, 1)
    end_of_year = DateTime.new(year, 12, 31)
    Picture.where("created_at > ? and created_at < ?", beginning_of_year, end_of_year)
  end
end
