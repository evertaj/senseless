require 'rails_helper'

describe User do

  describe  "/validation/" do

    let! (:user) {create :user, username: "qwe"}
    it  "should validate username for uniqueness" do
      user2 = User.new(username: "qwe")
      expect(user2).not_to be_valid
      expect(user2.errors.details[:username].select{|error| error[:error] == :taken}).not_to eq []
    end

    it "should validate username is a word or|and numbers" do
      user1 = User.new(username: "qwe_qwe", password: "qweqwe", email: "qwe@qwe.qwe")
      user2 = User.new(username: "qwe!")
      expect(user1).to be_valid
      expect(user2).not_to be_valid
      expect(user2.errors.details[:username].select{|error| error[:error] == :invalid}).not_to eq []
    end

    it "should validate username is not 'admin'" do
      user1 = User.new(username: "admin")
      user2 = User.new(username: "notadmin")
      expect(user1).not_to be_valid
      expect(user2).not_to be_valid
      # expect{user1.valid? || user2.valid?}.not_to be_truthy
      expect(user1.errors.details[:username].select{|error| error[:error] == :invalid}).not_to eq []
      expect(user2.errors.details[:username].select{|error| error[:error] == :invalid}).not_to eq []
    end

  end

end