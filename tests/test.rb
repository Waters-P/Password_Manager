require 'minitest/autorun'
require './manager'



class TestManager < Minitest::Test

    def test_encrypting

        user = The_Password_Manager.new
        
        assert_nil user.add_admin
         
    end
end

