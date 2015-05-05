require 'rails_helper'

RSpec.describe User, type: :model do
  describe "The User" do
    it "has a name" do
      user = User.new(name: "Scott")
      expect(user.name).to eq("Scott")
    end
  end
end

