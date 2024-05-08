class Admin_info

  attr_reader :account_id 
  attr_reader :fst_name
  attr_reader :lst_name
  attr_accessor :email
  attr_accessor :username
  attr_reader :pass_word

  def initialize (fst_name, lst_name, email, username, pass_word)
    @account_id = rand(99999)
    @fst_name = fst_name
    @lst_name = lst_name
    @email = email
    @username = username
    @password = pass_word
    

  end  
  

end  



=begin


user = Admin_info.new(fst_name, lst_name, email, username)

account_id = user.account_id.to_s





puts " #{fst_name} , to maximize your protection, save your account number in a discrete place: #{account_id}"

=end
