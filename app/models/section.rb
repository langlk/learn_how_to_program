class Section < ActiveRecord::Base
  validates :name, :order, :course, presence: true
  validates :order, uniqueness: { scope: :course, message: 'already taken in this course'}
  belongs_to :course
  has_many :lessons

  def next
    sections = self.course.sections.order(:order)
    sections.each do |section|
      if section.order > self.order
        return section
      end
    end
    return nil
  end

  def previous
    sections = self.course.sections.order(order: :desc)
    sections.each do |section|
      if section.order < self.order
        return section
      end
    end
    return nil
  end
end
