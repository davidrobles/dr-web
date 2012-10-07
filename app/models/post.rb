class Post < ActiveRecord::Base

  paginates_per 6

  attr_accessible :title, :slug, :body, :tag_list, :created_at

  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true, 
            format: { with: /\A[\da-z-]{3,}\z/, message: "Invalid slug" }
  validates :body, presence: true

  # TAGS
  
  def self.tagged_with(slug)
    Tag.find_by_slug!(slug).posts
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:slug).join(", ")
  end

  def tag_list=(slugs)
    self.tags = slugs.split(",").map do |s|
      Tag.where(slug: s.strip, name: s.strip).first_or_create!
    end
  end

  def to_param
    slug
  end

end
