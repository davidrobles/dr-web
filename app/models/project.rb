class Project < ActiveRecord::Base

  attr_accessible :title, :slug, :body

  validates :title, :presence => true, :uniqueness => true
  validates :slug, :presence => true, :uniqueness => true
  validates :body, :presence => true

end
