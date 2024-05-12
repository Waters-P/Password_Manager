class Admin_info

  attr_reader :account_id 
  attr_reader :first_name
  attr_reader :last_name
  attr_accessor :email
  attr_accessor :username
  

  def initialize (first_name, email) # last_name, email, username
    @account_id = rand(99999)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @username = username
    
    

  end  
  

end  
