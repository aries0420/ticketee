require 'spec_helper' #rspec

feature "Editing Projects" do #rspec
  before do #rspec
    sign_in_as!(Factory(:admin_user))
    Factory(:project, :name => "TextMate 2") #factory_girl
    visit "/" #capybara # can also be "visit root_path"
    click_link "TextMate 2" #capybara
    click_link "Edit Project" #capybara
  end #rspec

  scenario "Updating a project" do
    fill_in "Name", :with => "TextMate 2 beta" #capybara
    click_button "Update Project" #capybara
    page.should have_content("Project has been updated.") #capybara
  end

  scenario "Updating a project with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Project"
    page.should have_content("Project has not been updated.")
  end
end

# can use "save_and_open_page" (gem launchy) for debugging purposes instead of having to start 'rails s' back and forth to test things out. This is just like doing 'binding.pry'
