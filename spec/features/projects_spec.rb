require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  #yet to be done but add or delete scenarios  
  pending "add some scenarios (or delete) #{__FILE__}"
end


require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  #Before all the create new projects create test data
  context "Create new project" do
    before(:each) do
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end
    #test data to make desscription 
    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end
    #test if descrritpion is empty or not 
    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    #sets fake project and goes to edit project 
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end


    scenario "should be successful" do
      #updates fake project with info to see if everything updates properly
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      #fills in data with nothing and since description can be blank erros
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    #Tests if delete project will work by deleting the fake project and makiing sure thier are zero total projects
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end

