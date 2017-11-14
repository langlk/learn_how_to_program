class Course < ActiveRecord::Base
  validates :name, presence: true
  has_many :sections
end
