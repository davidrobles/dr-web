class Post < ActiveRecord::Base

  paginates_per 6
  attr_accessible :title, :slug, :body

  validates :title, :presence => true, :uniqueness => true
  validates :slug, :presence => true, :uniqueness => true
  validates :body, :presence => true

  def to_param
    "#{id}-#{slug}"
  end

end
