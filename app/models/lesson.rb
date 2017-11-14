class Lesson < ActiveRecord::Base
  validates :name, :content, :order, :section, presence: true
  validates :order, uniqueness: { scope: :section, message: 'already taken in this section'}
  belongs_to :section

  def next
    lessons = self.section.lessons.order(:order)
    lessons.each do |lesson|
      if lesson.order > self.order
        return lesson
      end
    end
    return nil
  end

  def previous
    lessons = self.section.lessons.order(order: :desc)
    lessons.each do |lesson|
      if lesson.order < self.order
        return lesson
      end
    end
    return nil
  end
end
