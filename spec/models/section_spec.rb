require "rails_helper"

describe Section do
  it { should validate_presence_of :name }
  it { should validate_presence_of :order }
  it { should belong_to :course }
  it { should validate_presence_of :course }
  it { should have_many :lessons }

  it "should validate uniqueness of order" do
    course = Course.create(name: "Test")
    section1 = course.sections.create(name: "Test", order: 1)
    section2 = course.sections.new(name: "Test2", order: 1)
    expect(section2.save).to eq(false)
  end

  it "should vaidate uniqueness of order within course" do
    course = Course.create(name: "Test")
    course2 = Course.create(name: "Test2")
    section1 = course.sections.create(name: "Test", order: 1)
    section2 = course2.sections.new(name: "Test2", order: 1)
    expect(section2.save).to eq(true) 
  end
end
