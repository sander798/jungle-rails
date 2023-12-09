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

  end
end
