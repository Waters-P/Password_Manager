require_relative "admin_info"



class New_Users

  attr_reader :name
  attr_reader :account_id #5digits
  attr_accessor :admin_info
  attr_reader :display_account_info


  def initialize ()
    @account_id = rand(99999)
    

  end  



 
end 



#name = admin_info()


user = Admin_info.new
email = user.return_email()

pp email





#account_id = user.account_id.to_s

#puts " , go ahead and save your account number in a discrete place: #{account_id}"
