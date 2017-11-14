require "rails_helper"

describe "managing courses" do
  it "adds a new course" do
    visit courses_path
    click_link "Add a Course"
    fill_in "Name", with: "Intro to Programming"
    click_on "Create Course"
    expect(page).to have_content('Course created!')
  end

  it "does not allow course name to be blank" do
    visit new_course_path
    click_on 'Create Course'
    expect(page).to have_content('errors')
  end

  it "allows user to edit a course" do
    course = Course.create(name: 'New Test Course')
    visit course_path(course)
    click_on 'Edit'
    fill_in 'Name', with: 'Intro to Programming'
    click_on 'Update Course'
    expect(page).to have_content('Course updated!')
    expect(page).to have_content('Intro to Programming')
  end
end
