class Project < ActiveRecord::Base

  attr_accessible :name, :slug, :body, :created_at

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true,
            format: { with: /\A[\da-z-]{3,}\z$/, message: "Invalid slug" }
  validates :body, presence: true

  def to_param
    slug
  end

end
