require "rails_helper"

RSpec.describe "The math below is wrong..." do
  #tests if 7*7 equals 42
  it "should equal 42 but we said 43" do
    expect(6 * 7).to eq(42)
  end
end
require "rails_helper"

RSpec.describe "hello spec" do
  # ...
  #checks to make sure a string with no params equals ""
  describe String do
    let(:string) { String.new }
    it "should provide an empty string" do
      expect(string).to eq("")
    end
  end
 end
