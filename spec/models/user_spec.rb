require 'rails_helper'


RSpec.describe User, type: :model do
  SimpleCov.start do
    add_filter do |source_file|
      source_file.lines.count < 5
    end
  end
  context "validation tests" do
    it "make sure user has an email and a password" do
      
      user = User.new(email: "testing@testing.com", password: "testingP")
      user2 = User.new()
      expect(user.valid?).to eq(true)
      expect(user2.valid?).to eq(false)
      
    end
  end
end
