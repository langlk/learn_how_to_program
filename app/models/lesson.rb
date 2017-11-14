class Lesson < ActiveRecord::Base
  validates :name, :content, :order, :section, presence: true
  belongs_to :section
end
