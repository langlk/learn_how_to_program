require "rails_helper"

describe "managing lessons" do
  it "adds a lesson" do
    course = Course.create(name: "Test")
    section = course.sections.create(name: "Test Section", order: 1)
    visit section_path(section)
    click_on 'Add a Lesson'
    fill_in 'Name', with: 'Test Lesson'
    fill_in 'Content', with:'Test Content'
    fill_in 'Order', with: 1
    click_on 'Create Lesson'
    expect(page).to have_content('Lesson created!')
    expect(page).to have_content('Test Lesson')
  end

  it "does not add a lesson with a blank name/content/order" do
    course = Course.create(name: "Test")
    section = course.sections.create(name: "Test Section", order: 1)
    visit new_section_lesson_path(section)
    click_on 'Create Lesson'
    expect(page).to have_content('errors')
  end

  it "sorts lessons by order" do
    course = Course.create(name: "Test")
    section = course.sections.create(name: "Test Section", order: 1)
    lesson1 = section.lessons.create(name: "Test2", order: 2, content: "herp")
    lesson2 = section.lessons.create(name: "Test1", order: 1, content: "herp")
    visit section_path(section)
    expect(page).to have_content('Test1 Test2')
  end

  it "allows user to edit lessons" do
    course = Course.create(name: "Test")
    section = course.sections.create(name: "Test Section", order: 1)
    lesson1 = section.lessons.create(name: "Test2", order: 2, content: "herp")
    visit lesson_path(lesson1)
    click_link 'Edit'
    fill_in 'Name', with: 'Test1'
    click_on 'Update Lesson'
    expect(page).to have_content('Lesson updated!')
    expect(page).to have_content('Test1')
  end
end
