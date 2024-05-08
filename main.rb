


class Password_Manager
  attr_reader :account_id #5digits
  attr_accessor :admin_info
  attr_reader :display_account_info


  def initialize 
    @account_id = rand(99999)

  end  






end 


new_user = Password_Manager.new

pp new_user.account_id
