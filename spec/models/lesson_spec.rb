require "rails_helper"

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should validate_presence_of :order }
  it { should belong_to :section }
  it { should validate_presence_of :section }

  it "validates uniqueness of lesson order" do
    course = Course.new(name: "Test")
    course.save
    section = course.sections.create(name: "Test", order: 1)
    lesson1 = section.lessons.create(
      name: "Test",
      content: "Test",
      order: 1
    )
    lesson2 = section.lessons.new(
      name: "Test",
      content: "Test",
      order: 1
    )
    expect(lesson2.save).to eq(false)
  end

  it "validates uniqueness of lesson order within a section only" do
    course = Course.new(name: "Test")
    course.save
    section = course.sections.create(name: "Test", order: 1)
    section2 = course.sections.create(name: "Test2", order: 2)
    lesson1 = section.lessons.create(
      name: "Test",
      content: "Test",
      order: 1
    )
    lesson2 = section2.lessons.new(
      name: "Test",
      content: "Test",
      order: 1
    )
    expect(lesson2.save).to eq(true)
  end
end
