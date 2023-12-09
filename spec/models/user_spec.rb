require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    
    before do
      @user = User.new()
    end

    it "Can be created with valid data" do
      @user.name = "newUser"
      @user.password = "pass123"
      @user.password_confirmation = "pass123"
      expect(@user.save!).to eql(true)
    end

    it "Requires a name" do
      #@user.name = "newUser"
      @user.password = "pass123"
      @user.password_confirmation = "pass123"
      expect {@user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Requires a password" do
      @user.name = "newUser"
      #@user.password = "pass123"
      @user.password_confirmation = "pass123"
      expect {@user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Requires password confirmation" do
      @user.name = "newUser"
      @user.password = "pass123"
      #@user.password_confirmation = "pass123"
      expect {@user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Requires password and password confirmation to be the same" do
      @user.name = "newUser"
      @user.password = "pass123"
      @user.password_confirmation = "pass321"
      expect {@user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Requires passwords of at least 7 characters" do
      @user.name = "newUser"
      @user.password = "pass12"
      @user.password_confirmation = "pass12"
      expect {@user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Requires names to be unique" do
      @user.name = "newUser"
      @user.password = "pass123"
      @user.password_confirmation = "pass123"
      @user.save

      user2 = User.new()
      user2.name = "newUser"
      user2.password = "123password"
      user2.password_confirmation = "123password"
      expect {user2.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

  describe '.authenticate_with_credentials' do

    before do
      User.create(name: "user1", password: "pass123", password_confirmation: "pass123")
    end

    it "Authenticates with correct name and password" do
      expect(User.authenticate_with_credentials("user1", "pass123")).to_not eql(nil)
    end

    it "Returns nil when given incorrect name" do
      expect(User.authenticate_with_credentials("user2", "pass123")).to eql(nil)
    end

    it "Returns nil when given incorrect password" do
      expect(User.authenticate_with_credentials("user1", "pass123asd")).to eql(nil)
    end
  end
end
