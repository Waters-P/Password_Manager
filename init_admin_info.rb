class Admin_info
 
  attr_reader :first_name

  attr_accessor :email

  attr_reader :account_id  
  

  def initialize (first_name, email) 
   
    
    @first_name = first_name
    @email = email
    @account_id = rand(99999)
    
    
  end  
  
end  
