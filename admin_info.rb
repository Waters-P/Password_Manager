class Admin_info

  attr_reader :fst_name
  attr_reader :lst_name
  attr_accessor :email
  attr_accessor :username
  attr_reader :password

  
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



