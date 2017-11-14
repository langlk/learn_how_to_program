require "rails_helper"

describe "managing sections" do
  it "adds a new section to a course" do
    course = Course.create(name: "Intro")
    visit course_path(course)
    click_link 'Add a Section'
    fill_in 'Name', with: 'Week 1'
    fill_in 'Order', with: 1
    click_on 'Create Section'
    expect(page).to have_content('Section created!')
    expect(page).to have_content('Week 1')
  end

  it "does not allow a section to be created without a name" do
    course = Course.create(name: "Intro")
    visit new_course_section_path(course)
    click_on 'Create Section'
    expect(page).to have_content('errors')
  end

  it "sorts sections in order" do
    course = Course.create(name: "Intro")
    section1 = course.sections.create(name: 'Week2', order: 2)
    section2 = course.sections.create(name: 'Week1', order: 1)
    visit course_path(course)
    expect(page).to have_content('Week1 Week2')
  end

  it "allows user to edit a section" do
    course = Course.create(name: "Intro")
    section1 = course.sections.create(name: 'Week2', order: 2)
    visit section_path(section1)
    click_link 'Edit'
    fill_in 'Name', with: 'Week1'
    click_on 'Update Section'
    expect(page).to have_content('Section updated!')
    expect(page).to have_content('Week1')
  end
end
