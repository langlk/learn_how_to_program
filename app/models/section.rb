class Section < ActiveRecord::Base
  validates :name, :order, :course, presence: true
  belongs_to :course
  has_many :lessons
end
