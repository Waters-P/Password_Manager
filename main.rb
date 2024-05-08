
require_relative "new_admin_info_2"




class Password_Manager
  

  def initialize
    @admin_accounts = []
  end
  

  def add_admin
    print "Type your 1st name: "
    fst_name = gets.chomp
    print "Type your surname: "
    lst_name = gets.chomp
    print "Type your email: "
    email = gets.chomp
    print "Create a username: "
    username = gets.chomp
    print "Create a password. It will be encrypted for maximum account protection"
    pass_word = gets.chomp

    
    #@admin_accounts << Admin_info.new(fst_name, lst_name, email, username, pass_word) 

    user = Admin_info.new(fst_name, lst_name, email, username, pass_word) 

    @admin_accounts.push(user.fst_name)

    #puts " New Administrator saved! "

    
  end


  



  def show_admins
    puts "Admins Saved:"
    @admin_accounts.each do |admin|
      puts "#{admin}"
    end
  end




end  


manager = Password_Manager.new

manager.add_admin


manager.show_admins
