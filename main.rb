
require_relative "new_admin_info_2"

require_relative "admin_password"



class Password_Manager
  

  def initialize
    @admin_info_storage = {}

    @admin_main_pw_storage = {}

    @id_vault = {}
  end
  

  def add_admin

    print "Welcome, I am Password Manager, lets get you an account to explore my service \n"
    print "For now I only need your 1st name: "
    first_name = gets.chomp
    #print "Type your surname: "
    #lst_name = gets.chomp
    print "And your email: "
    email = gets.chomp
    #print "Create a username: "
    #username = gets.chomp
   
    user = Admin_info.new(first_name, email)  #lst_name, , username,
    account_id = user.account_id.to_s


    @admin_info_storage.store(:first_name, user.first_name)
    @admin_info_storage.store(:email, user.email)
    @id_vault.store(:account_id, user.account_id.to_s)

    print  "And for you to create a password. It will be encrypted for maximum account protection: "
    main_pw_to_be_encrpt = gets.chomp
    new_pw = Admin_main_Password.new(main_pw_to_be_encrpt)


    @admin_main_pw_storage.store(:main_pw_to_be_encrpt, new_pw.main_pw_to_be_encrpt) 


    puts "\nNew Administrator saved! Your user_id is: " + @id_vault.fetch(:account_id) + "\n\nYou will need this to access certain account services."

    
  end


  def show_admins
    print "Here, you can enter your first name & user_id to lookup your account info. \n"
    print "enter first name: \n"
    first_name = gets.chomp

      if @admin_info_storage.has_value?(first_name)
        puts "enter your user_id: "
        id = gets.chomp

        if @id_vault.has_value?(id)
          print "What is your password? "
          pw = gets.chomp

          if pw == @admin_main_pw_storage.fetch(:main_pw_to_be_encrpt)

            puts "yes, you are in db\n"

            @admin_info_storage.each_key {|key| print "#{key}: #{@admin_info_storage[key]} "}
            
          else
            print "error! \n"
          end

        else 
          print "wrong id :( \n"
        end
      end
  end


  def change_email

    print  "#{@admin_info_storage[:email]} \n" 

    print " change email \n"

    @admin_info_storage[:email] = gets.chomp

    print " new email#{@admin_info_storage[:email]} \n" 


  end


  def change_password

    print "#{@admin_main_pw_storage[:main_pw_to_be_encrpt]} \n"
    print "change password \n"

    puts "to change password enter your user_id: "
    id = gets.chomp

    if @id_vault.has_value?(id)
      
      print "new password: "
      @admin_main_pw_storage[:main_pw_to_be_encrpt] = gets.chomp

      print "new password: #{@admin_main_pw_storage[:main_pw_to_be_encrpt]} \n"
    end

  end






  def encrpt_pw

    box_of_chars = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher = [" ", "`","~","!","@","#","&","%","^","&","*","(",")","-","_","=","+","[","{","]","}","'\'","|",";",":","'",'"',",","<",".",">","/","?","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    cipher.shuffle!

    # encrypting

    plain_text = @admin_main_pw_storage.fetch(:main_pw_to_be_encrpt)
    grandma = plain_text.split("")

    cipher_text = ""

    a = 0 
    while (a < grandma.length)
      dx = box_of_chars.index(grandma[a])
      cipher_text += cipher[dx]
      a += 1
    end

    print " orignal password is " + plain_text + "\n"
    print " encrypted password is " + cipher_text + "\n"

  end

end  


# run the app


while (true)

  manager = Password_Manager.new


  manager.add_admin

  manager.change_email

  manager.change_password



 
=begin
  
  manager.show_admins
  
  #manager.add_pw
  
  manager.encrpt_pw

  print "continue?: \n \n"

  if gets.chomp == "stop"
    print "Your Password security is maximized. \n \n"
    break
  else
    print "ok: starting app engine \n \n"
  end


=end

end
