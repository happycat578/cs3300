require "rails_helper"

RSpec.describe Project, type: :model do
  context "validations tests" do
    #checks to make sure if the descrption is valid
    it "ensures the description is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    
    it "should be able to save project" do
     # checks to make sure project is saved
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
    
  end

  context "scopes tests" do

  end
end


require "rails_helper"

RSpec.describe Project, type: :model do
  # ...

  context "scopes tests" do
    #sets all infor in a fake project and crates 3 verions of thme and makes sure the count is right
    let(:params) { { title: "Title", description: "some description" } }
    before(:each) do
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    it "should return all projects" do
      expect(Project.count).to eq(3)
    end

  end
end


require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  context "GET #index" do
  
  #success respnes for project
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "GET #show" do
  #gets succesfull cration of project
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end


