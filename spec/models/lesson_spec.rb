require "rails_helper"

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should validate_presence_of :order }
  it { should belong_to :section }
  it { should validate_presence_of :section }

  it "validates uniqueness of lesson order" do
    course = Course.create(name: "Test")
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

  describe "#next" do
    it "returns the next lesson in the section" do
      course = Course.create(name: "Test")
      section = course.sections.create(name: "Test", order: 1)
      lesson1 = section.lessons.create(
        name: "Test",
        content: "Test",
        order: 1
      )
      lesson2 = section.lessons.create(
        name: "Test",
        content: "Test",
        order: 2
      )
      expect(lesson1.next).to eq(lesson2)
    end
  end

  describe '#previous' do
    it "returns the previous lesson in the section" do
      course = Course.create(name: "Test")
      section = course.sections.create(name: "Test", order: 1)
      lesson1 = section.lessons.create(
        name: "Test",
        content: "Test",
        order: 1
      )
      lesson2 = section.lessons.create(
        name: "Test",
        content: "Test",
        order: 2
      )
      expect(lesson2.previous).to eq(lesson1)
    end
  end
end
