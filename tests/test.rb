require 'minitest/autorun'
require './manager'


class TestManager < Minitest::Test

    def test_encrypting

        user = The_Password_Manager.new
        #assert_equal 2024, user.get_date, "pass"
        assert_equal "Encrypted password", user.encrpt_pw, "pass"
         
    end
end
