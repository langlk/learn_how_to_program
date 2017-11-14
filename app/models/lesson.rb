class Lesson < ActiveRecord::Base
  validates :name, :content, :order, :section, presence: true
  validates :order, uniqueness: { scope: :section, message: 'lesson order already taken in this section'}
  belongs_to :section

  def next
    lessons = self.section.lessons.order(:order)
    lessons.each do |lesson|
      puts lesson.order
      if lesson.order > self.order
        return lesson
      end
    end
    return nil
  end

  def previous
    lessons = self.section.lessons.order(order: :desc)
    lessons.each do |lesson|
      puts lesson.order
      if lesson.order < self.order
        return lesson
      end
    end
    return nil
  end
end
