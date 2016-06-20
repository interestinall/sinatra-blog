require 'spec_helper'

  describe 'User' do 
    before do
      @user = User.create(username: "mikejonez", email: "mike@mikjonez.com", password: "mikeymikejonez")
    end

    it 'saves user to db' do 
      expect(@user).to eq(User.find(1))
    end

    it 'has a secure password' do 
      right_password = "mikeymikejonez"
      expect(@user.authenticate("wrong password")).to eq(false)
      expect(@user.authenticate(right_password)).to eq(@user)
    end


  end
