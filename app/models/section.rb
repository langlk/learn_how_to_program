class Section < ActiveRecord::Base
  validates :name, :order, :course, presence: true
  validates :order, uniqueness: { scope: :course, message: 'already taken in this course'}
  belongs_to :course
  has_many :lessons
end
