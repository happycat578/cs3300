

require "rails_helper"

RSpec.feature "Visiting the homepage", type: :feature do
  #checks to make sure when you go to the home you see all projects 
  scenario "The visitor should see projects" do
  
    visit root_path
    expect(page).to have_text("Projects")
  end
end

