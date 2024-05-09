class Admin_info

  attr_reader :account_id 
  attr_reader :fst_name
  attr_reader :lst_name
  attr_accessor :email
  attr_accessor :username
  #attr_reader :pass_word

  def initialize (fst_name) # lst_name, email, username, pass_word
    @account_id = rand(99999)
    @fst_name = fst_name
    @lst_name = lst_name
    @email = email
    @username = username
    #@pass_word = pass_word
    

  end  
  

end  




