class Tag < ActiveRecord::Base

  attr_accessible :name, :slug

  has_many :taggings
  has_many :posts, through: :taggings

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end

  def to_s
    name
  end

end
