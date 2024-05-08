class Admin_info

  attr_reader :account_id 
  attr_reader :fst_name
  attr_reader :lst_name
  attr_accessor :email
  attr_accessor :username
  attr_reader :password

  def initialize ()
    @account_id = rand(99999)
    
    

  end  
  
  def to_s
    "(#@fst_name, #@lst_name, #@email, #@username, #@password)"

  end

  def return_fst_name
    puts "firstname = "
    @fst_name = gets.chomp
    fst_name = @fst_name

  end
  
  def return_lst_name
    puts "lastname = "
    @lst_name = gets.chomp
    lst_name = @lst_name


  end
  
  def return_email

    puts "email = "
    @email = gets.chomp
    email = @email
    
  end
  
  def return_username
    puts "username = "
    @username = gets.chomp
    username = @username
    
  end
  
  def return_password
  
    puts "password =" 
    @password = gets.chomp
    password = @password
  
  end

end  




user = Admin_info.new

name = user.return_fst_name()
email = user.return_email()
account_id = user.account_id.to_s





puts " #{name} , to maximize your protection, save your account number in a discrete place: #{account_id}"
