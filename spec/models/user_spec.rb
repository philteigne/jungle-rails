require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'saves a user when all validations are met' do
      expect(@user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "12345678",
        password_confirmation: "12345678",
      )).to be_valid
    end

    it 'fails to save a user when no first_name is provided' do
      expect(@user = User.new(
        first_name: "",
        last_name: "Test",
        email: "test@test.com",
        password: "12345678",
        password_confirmation: "12345678",
      )).not_to be_valid
    end
    it 'fails to save a user when no last_name is provided' do
      expect(@user = User.new(
        first_name: "Test",
        last_name: "",
        email: "test@test.com",
        password: "12345678",
        password_confirmation: "12345678",
      )).not_to be_valid
    end
    it 'fails to save a user when no email is provided' do
      expect(@user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "",
        password: "12345678",
        password_confirmation: "12345678",
      )).not_to be_valid
    end
    it 'fails to save a user when the provided email already exists in the database' do
      @user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "12345678",
        password_confirmation: "12345678",
      )
      @user.save
      expect(@user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "TEST@test.com",
        password: "12345678",
        password_confirmation: "12345678",
      )).not_to be_valid
    end
    it 'fails to save a user when password_confirmation does not match password' do
      expect(@user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "TEST@test.com",
        password: "12345678",
        password_confirmation: "87654321",
      )).not_to be_valid
    end
    it 'fails to save a user when password_confirmation and password are not provided' do
      expect(@user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "TEST@test.com",
        password: "",
        password_confirmation: "",
      )).not_to be_valid
    end
    it 'fails to save a user when password is shorter than 8 characters' do
      expect(@user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "TEST@test.com",
        password: "1234567",
        password_confirmation: "1234567",
      )).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns a user if the provided credentials match a user in the database' do
      @user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "12345678",
        password_confirmation: "12345678",
      )

      @user.save

      username = "test@test.com"
      password = "12345678"

      expect(user = User.authenticate_with_credentials(username, password)).not_to be_nil
    end

    it 'does not return a user if the provided credentials have no matches in the database' do
      expect(user = User.authenticate_with_credentials("test@test.com", "12345678")).to be_nil
    end

    it 'returns a user if the provided email has excess spaces but still matches in the database' do
      @user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "12345678",
        password_confirmation: "12345678",
      )

      @user.save

      username = "  test@test.com "
      password = "12345678"

      expect(user = User.authenticate_with_credentials(username, password)).not_to be_nil
    end
    it 'returns a user if the provided email has incorrect case but still matches in the database' do
      @user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "12345678",
        password_confirmation: "12345678",
      )

      @user.save

      username = "TeST@test.com"
      password = "12345678"

      expect(user = User.authenticate_with_credentials(username, password)).not_to be_nil
    end
  end
end
