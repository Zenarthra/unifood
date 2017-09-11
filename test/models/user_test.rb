require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup

      @user = User.create!(firstname: "Michael", lastname: "Lee", contact: "07399039171", address: "This is my address", postcode: "M12 5WQ", email: "Michael@example.com", password: "newpassword", password_confirmation: "newpassword")
      
    end
      
      test "upassword present" do
        @user.password = @user.password_confirmation = " "
        assert_not @user.valid?
      end

end
